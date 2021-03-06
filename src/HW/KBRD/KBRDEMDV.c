/*
	KBRDEMDV.c

	Copyright (C) 2006 Philip Cummins, Paul C. Pratt

	You can redistribute this file and/or modify it under the terms
	of version 2 of the GNU General Public License as published by
	the Free Software Foundation.  You should have received a copy
	of the license along with this file; see the file COPYING.

	This file is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	license for more details.
*/

/*
	KeyBoaRD EMulated DeVice

	Emulation of the keyboard in the Mac Plus.

	This code adapted from "Keyboard.c" in vMac by Philip Cummins.
*/

#include "SYSDEPNS.h"
#include "UI/MYOSGLUE.h"
#include "EMCONFIG.h"
#include "GLOBGLUE.h"
#include "HW/KBRD/KBRDEMDV.h"
#include "HW/VIA/VIAEMDEV.h"

#include <stdio.h>

/*
	ReportAbnormalID unused 0x0B03 - 0x0BFF
*/

enum {
	kKybdStateIdle,
	kKybdStateRecievingCommand,
	kKybdStateRecievedCommand,
	kKybdStateRecievingEndCommand,

	kKybdStates
};

LOCALVAR int KybdState = kKybdStateIdle;

LOCALVAR bool HaveKeyBoardResult = false;
LOCALVAR uint8_t KeyBoardResult;

LOCALPROC GotKeyBoardData(uint8_t v)
{
	if (KybdState != kKybdStateIdle) {
		HaveKeyBoardResult = true;
		KeyBoardResult = v;
	} else {
		VIA_ShiftInData_Ext(VIA1, v);
	}
}

static bool Kybd_CheckDataReady()
{
	return VIA_GetCB2(VIA1);
}

LOCALVAR uint8_t InstantCommandData = 0x7B;

LOCALFUNC bool AttemptToFinishInquiry(void)
{
	int i;
	bool KeyDown;
	uint8_t Keyboard_Data;

	if (FindKeyEvent(&i, &KeyDown)) {
		if (i < 64) {
			Keyboard_Data = i << 1;
			if (! KeyDown) {
				Keyboard_Data += 128;
			}
		} else {
			Keyboard_Data = 121;
			InstantCommandData = (i - 64) << 1;
			if (! KeyDown) {
				InstantCommandData += 128;
			}
		}
		GotKeyBoardData(Keyboard_Data);
		return true;
	} else {
		return false;
	}
}

#define MaxKeyboardWait 16 /* in 60ths of a second */
	/*
		Code in the mac rom will reset the keyboard if
		it hasn't been heard from in 32/60th of a second.
		So time out and send something before that
		to keep connection.
	*/

LOCALVAR int InquiryCommandTimer = 0;

GLOBALPROC DoKybd_ReceiveCommand(void)
{
	if (KybdState != kKybdStateRecievingCommand) {
		ReportAbnormalID(0x0B01,
			"KybdState != kKybdStateRecievingCommand");
	} else {
		uint8_t in = VIA_ShiftOutData_Ext(VIA1);

		//fprintf(stderr, "KybdStateRecievedCommand\n");
		KybdState = kKybdStateRecievedCommand;

		switch (in) {
			case 0x10 : /* Inquiry Command */
				if (! AttemptToFinishInquiry()) {
					InquiryCommandTimer = MaxKeyboardWait;
				}
				break;
			case 0x14 : /* Instant Command */
				GotKeyBoardData(InstantCommandData);
				InstantCommandData = 0x7B;
				break;
			case 0x16 : /* Model Command */
				GotKeyBoardData(0x0b /* 0x01 */);
					/* Test value, means Model 0, no extra devices */
				/*
					Fixed by Hoshi Takanori -
						it uses the proper keyboard type now
				*/
				break;
			case 0x36 : /* Test Command */
				GotKeyBoardData(0x7D);
				break;
			case 0x00:
				GotKeyBoardData(0);
				break;
			default :
				/* Debugger(); */
				GotKeyBoardData(0);
				break;
		}
	}
}

GLOBALPROC DoKybd_ReceiveEndCommand(void)
{
	if (KybdState != kKybdStateRecievingEndCommand) {
		ReportAbnormalID(0x0B02,
			"KybdState != kKybdStateRecievingEndCommand");
	} else {
		KybdState = kKybdStateIdle;
		//fprintf(stderr, "KybdStateIdle\n");
#ifdef _VIA_Debug
		fprintf(stderr, "enter DoKybd_ReceiveEndCommand\n");
#endif
		if (HaveKeyBoardResult) {
#ifdef _VIA_Debug
			fprintf(stderr, "HaveKeyBoardResult: %d\n", KeyBoardResult);
#endif
			HaveKeyBoardResult = false;
			VIA_ShiftInData_Ext(VIA1, KeyBoardResult);
		}
	}
}

GLOBALPROC Kybd_DataLineChngNtfy(void)
{
	//fprintf(stderr, "Kybd_DataLineChngNtfy (%d)\n", Kybd_CheckDataReady());
	switch (KybdState) {
		case kKybdStateIdle:
			if (Kybd_CheckDataReady() == false) {
				//fprintf(stderr, "KybdStateRecievingCommand\n");
				KybdState = kKybdStateRecievingCommand;
#ifdef _VIA_Debug
				fprintf(stderr, "posting kICT_Kybd_ReceiveCommand\n");
#endif
				ICT_add(kICT_Kybd_ReceiveCommand,
					6800UL * kCycleScale / 64 * ClockMult);

				if (InquiryCommandTimer != 0) {
					InquiryCommandTimer = 0; /* abort Inquiry */
				}
			}
			break;
		case kKybdStateRecievedCommand:
			if (Kybd_CheckDataReady() == true) {
				KybdState = kKybdStateRecievingEndCommand;
				//fprintf(stderr, "KybdStateRecievingEndCommand\n");
#ifdef _VIA_Debug
				fprintf(stderr,
					"posting kICT_Kybd_ReceiveEndCommand\n");
#endif
				ICT_add(kICT_Kybd_ReceiveEndCommand,
					6800UL * kCycleScale / 64 * ClockMult);
			}
			break;
	}
}

GLOBALPROC KeyBoard_Update(void)
{
	if (InquiryCommandTimer != 0) {
		if (AttemptToFinishInquiry()) {
			InquiryCommandTimer = 0;
		} else {
			--InquiryCommandTimer;
			if (InquiryCommandTimer == 0) {
				GotKeyBoardData(0x7B);
			}
		}
	}
}
