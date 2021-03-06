/*
	SGLUDDSP.h

	Copyright (C) 2012 Paul C. Pratt

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
	Sound GLUe for "/Dev/DSP"
		OSS and related, accessed through "/dev/dsp"
*/

LOCALVAR int audio_fd = -1;
LOCALVAR bool audio_started;

#if 4 == kLn2SoundSampSz
LOCALPROC ConvertSoundBlockToNative(tpSoundSamp p)
{
	int i;

	for (i = kOneBuffLen; --i >= 0; ) {
		*p++ -= 0x8000;
	}
}
#else
#define ConvertSoundBlockToNative(p)
#endif

LOCALPROC Sound_WriteOut(void)
{
	int retry_count = 32;

label_retry:
	if (--retry_count > 0) {
		int err;
		struct audio_buf_info info;

		if (ioctl(audio_fd, SNDCTL_DSP_GETOSPACE, &info) != 0) {
			fprintf(stderr, "SNDCTL_DSP_GETOSPACE fails\n");
		} else {
			tpSoundSamp NextPlayPtr;
			uint16_t PlayNowSize = 0;
			uint16_t MaskedFillOffset = ThePlayOffset & kOneBuffMask;
			uint16_t PrivateBuffUsed = TheFillOffset - ThePlayOffset;
			int used = (info.fragstotal * info.fragsize) - info.bytes;

			if (audio_started) {
				uint16_t TotPendBuffs = used >> kLnOneBuffSz;

				if (TotPendBuffs < MinFilledSoundBuffs) {
					MinFilledSoundBuffs = TotPendBuffs;
				}
				/* fprintf(stderr, "buffer used %d\n", (int)used); */
			} else {
				if (PrivateBuffUsed >= kAllBuffLen - kOneBuffLen) {
					audio_started = true;
				} else {
					info.bytes = 0;
				}
			}

			if (MaskedFillOffset != 0) {
				/* take care of left overs */
				PlayNowSize = kOneBuffLen - MaskedFillOffset;
				NextPlayPtr =
					TheSoundBuffer + (ThePlayOffset & kAllBuffMask);
			} else if (0 !=
				((TheFillOffset - ThePlayOffset) >> kLnOneBuffLen))
			{
				PlayNowSize = kOneBuffLen;
				NextPlayPtr =
					TheSoundBuffer + (ThePlayOffset & kAllBuffMask);
			} else {
				/* nothing to play now */
			}

#if 4 == kLn2SoundSampSz
			PlayNowSize <<= 1;
#endif

			if (PlayNowSize > info.bytes) {
				PlayNowSize = info.bytes;
			}

			if (0 != PlayNowSize) {
				err = write(
					audio_fd, NextPlayPtr, PlayNowSize);
				if (err < 0) {
					if (- EAGAIN == err) {
						/* buffer full, try again later */
						fprintf(stderr, "pcm write: EAGAIN\n");
					} else if (- EPIPE == err) {
						/* buffer seems to have emptied */
						fprintf(stderr, "pcm write emptied\n");
						goto label_retry;
					} else {
						fprintf(stderr, "audio_fd write error: %d\n",
							err);
					}
				} else {
					ThePlayOffset += err
#if 4 == kLn2SoundSampSz
						>> 1
#endif
						;
					goto label_retry;
				}
			}
		}
	}
}

LOCALPROC Sound_Start(void)
{
	if (audio_fd >= 0) {
		Sound_Start0();
		audio_started = false;
	}
}

LOCALPROC Sound_Stop(void)
{
	if (audio_fd >= 0) {
		if (0 !=
			ioctl(audio_fd, SNDCTL_DSP_RESET /* SNDCTL_DSP_HALT */,
				NULL))
		{
			fprintf(stderr, "SNDCTL_DSP_RESET fails\n");
		}
	}
}

#if 4 == kLn2SoundSampSz
#define DesiredFormat AFMT_S16_NE
#else
#define DesiredFormat AFMT_U8
#endif

LOCALFUNC bool Sound_Init(void)
{
	bool IsOk = false;

	audio_fd = open(AudioDevPath, O_WRONLY, 0);
	if (audio_fd < 0) {
		fprintf(stderr, "open /dev/dsp fails: %d\n", audio_fd);
	} else {
		int fragment_value =  (16 /* 16 fragments */ << 16)
#if 4 == kLn2SoundSampSz
			| 10 /* of 1024 bytes */
#else
			| 9 /* of 512 bytes */
#endif
			;
		int channels_value = 1;
		int fmt_value = DesiredFormat;
		int speed_value = SOUND_SAMPLERATE;

		/* fprintf(stderr, "open /dev/dsp works\n"); */

		if (0 !=
			ioctl(audio_fd, SNDCTL_DSP_SETFRAGMENT, &fragment_value))
		{
			fprintf(stderr, "SNDCTL_DSP_SETFRAGMENT fails\n");
		} else if ((0 !=
				ioctl(audio_fd, SNDCTL_DSP_CHANNELS, &channels_value))
			|| (channels_value != 1))
		{
			fprintf(stderr, "SNDCTL_DSP_CHANNELS fails\n");
		} else if ((0 !=
				ioctl(audio_fd, SNDCTL_DSP_SETFMT, &fmt_value))
			|| (fmt_value != DesiredFormat))
		{
			fprintf(stderr, "SNDCTL_DSP_SETFMT fails\n");
		} else if ((0 !=
				ioctl(audio_fd, SNDCTL_DSP_SPEED, &speed_value))
			|| (speed_value != SOUND_SAMPLERATE))
		{
			fprintf(stderr, "SNDCTL_DSP_SPEED fails\n");
		} else
		{
			IsOk = true;
		}

		if (! IsOk) {
			(void) close(audio_fd);
			audio_fd = -1;
		}
	}

	return true; /* keep going, even if no sound */
}

LOCALPROC Sound_UnInit(void)
{
	if (audio_fd >= 0) {
		if (close(audio_fd) != 0) {
			fprintf(stderr, "close /dev/dsp fails\n");
		}
		audio_fd = -1;
	}
}

GLOBALOSGLUPROC Sound_EndWrite(uint16_t actL)
{
	if (Sound_EndWrite0(actL)) {
		ConvertSoundBlockToNative(TheSoundBuffer
			+ ((TheFillOffset - kOneBuffLen) & kAllBuffMask));
		if (audio_fd >= 0) {
			Sound_WriteOut();
		}
	}
}

LOCALPROC Sound_SecondNotify(void)
{
	if (audio_fd >= 0) {
		Sound_SecondNotify0();
	}
}
