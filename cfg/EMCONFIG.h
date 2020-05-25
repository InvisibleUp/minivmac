/*
	Configuration options used by platform independent code.

	This file is automatically generated by the build system,
	which tries to know what options are valid in what
	combinations. Avoid changing this file manually unless
	you know what you're doing.
*/

#ifndef EMCONFIG_H
#define EMCONFIG_H

#define CurEmMd kEmMd_Plus

#define MaxATTListN 32
#define IncludeExtnPbufs 1
#define IncludeExtnHostTextClipExchange 1

#define Sony_SupportDC42 1
#define Sony_SupportTags 0
#define Sony_WantChecksumsUpdated 0
#define Sony_VerifyChecksums 0
#define CaretBlinkTime 0x03
#define SpeakerVol 0x07
#define DoubleClickTime 0x05
#define MenuBlink 0x03
#define AutoKeyThresh 0x06
#define AutoKeyRate 0x03

#if (CurEmMd == kEmMd_Plus)
#include "MACPLUS.h"
#elif (CurEmMd == kEmMd_II)
#include "MACII.h"
#endif

#define WantDisasm 0
#define ExtraAbnormalReports 0

#endif
