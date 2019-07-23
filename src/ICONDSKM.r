/*
	DskIcon.r

	Copyright (C) 2003 Philip Cummins, Richard F. Bannister,
		Paul C. Pratt

	You can redistribute this file and/or modify it under the terms
	of version 2 of the GNU General Public License as published by
	the Free Software Foundation.  You should have received a copy
	of the license along with this file; see the file COPYING.

	This file is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	license for more details.
*/

#if SmallIconAPIAvail
resource 'ics#' (DskIconId, purgeable) {
	{ /* array: 2 elements */
		/* [1] */
		$"7FE0 4030 4028 403C 4004 4004 4004 4FC4"
		$"4AA4 4BA4 4824 4BA4 4AA4 4FE4 4004 7FFC",
		/* [2] */
		$"7FE0 7FF0 7FF8 7FFC 7FFC 7FFC 7FFC 7FFC"
		$"7FFC 7FFC 7FFC 7FFC 7FFC 7FFC 7FFC 7FFC"
	}
};
#endif

#if ColorIconAPIAvail
resource 'ics8' (DskIconId, purgeable) {
	$"00FF FFFF FFFF FFFF FFFF FF00 0000 0000"
	$"00FF 0000 0000 0000 0000 FFFF 0000 0000"
	$"00FF 0000 0000 0000 0000 FF2A FF00 0000"
	$"00FF 0000 0000 0000 0000 FFFF FFFF 0000"
	$"00FF 0000 0000 0000 0000 00FA FAFF 0000"
	$"00FF 0000 0000 0000 0000 0000 00FF 0000"
	$"00FF 0000 0000 0000 0000 0000 00FF 0000"
	$"00FF 0000 E0E0 E0E0 E0E0 0000 00FF 0000"
	$"00FF 0000 E054 AB2A AB54 E000 00FF 0000"
	$"00FF 0000 E054 ABAB AB54 E000 00FF 0000"
	$"00FF 0000 E054 5454 5454 E000 00FF 0000"
	$"00FF 0000 E054 ABAB AB54 E000 00FF 0000"
	$"00FF 0000 E054 AB2A AB54 E000 00FF 0000"
	$"00FF 0000 E0FF E0E0 E0E0 E000 00FF 0000"
	$"00FF 0000 0000 0000 0000 0000 00FF 0000"
	$"00FF FFFF FFFF FFFF FFFF FFFF FFFF"
};
#endif

#if ColorIconAPIAvail
resource 'ics4' (DskIconId, purgeable) {
	$"0FFF FFFF FFF0 0000 0F00 0000 00FF 0000"
	$"0F00 0000 00FC F000 0F00 0000 00FF FF00"
	$"0F00 0000 000D DF00 0F00 0000 0000 0F00"
	$"0F00 0000 0000 0F00 0F00 FFFF FF00 0F00"
	$"0F00 FCE0 ECF0 0F00 0F00 FCEE ECF0 0F00"
	$"0F00 FCCC CCF0 0F00 0F00 FCEE ECF0 0F00"
	$"0F00 FCE0 ECF0 0F00 0F00 FFFF FFF0 0F00"
	$"0F00 0000 0000 0F00 0FFF FFFF FFFF FF"
};
#endif

resource 'ICN#' (DskIconId, purgeable) {
	{ /* array: 2 elements */
		/* [1] */
		$"1FFF F800 1000 0C00 1000 0A00 1000 0900"
		$"1000 0880 1000 0840 1000 0820 1000 0FF0"
		$"1000 0010 1000 0010 1000 0010 1000 0010"
		$"1000 0010 10FF FC10 1120 9210 1121 5110"
		$"1121 5110 1121 5110 1120 9110 111F E110"
		$"1100 0110 1100 0110 111F F110 1120 0910"
		$"1120 0910 1122 8910 1123 0910 1122 0910"
		$"1120 0910 10FF FE10 1000 0010 1FFF FFF0",
		/* [2] */
		$"1FFF F800 1FFF FC00 1FFF FE00 1FFF FF00"
		$"1FFF FF80 1FFF FFC0 1FFF FFE0 1FFF FFF0"
		$"1FFF FFF0 1FFF FFF0 1FFF FFF0 1FFF FFF0"
		$"1FFF FFF0 1FFF FFF0 1FFF FFF0 1FFF FFF0"
		$"1FFF FFF0 1FFF FFF0 1FFF FFF0 1FFF FFF0"
		$"1FFF FFF0 1FFF FFF0 1FFF FFF0 1FFF FFF0"
		$"1FFF FFF0 1FFF FFF0 1FFF FFF0 1FFF FFF0"
		$"1FFF FFF0 1FFF FFF0 1FFF FFF0 1FFF FFF0"
	}
};

#if ColorIconAPIAvail
resource 'icl8' (DskIconId, purgeable) {
	$"0000 00FF FFFF FFFF FFFF FFFF FFFF FFFF"
	$"FFFF FFFF FF00 0000 0000 0000 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 FFFF 0000 0000 0000 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 FF2A FF00 0000 0000 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 FF2A 2AFF 0000 0000 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 FF2A 2A2A FF00 0000 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 FF2A 2A2A 2AFF 0000 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 FF2A 2A2A 2A2A FF00 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 FFFF FFFF FFFF FFFF 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 00FA FAFA FAFA FAFF 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 00FF 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 00FF 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 00FF 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 00FF 0000 0000"
	$"0000 00FF 0000 00F5 E0FF E0E0 E0E0 E0E0"
	$"E0E0 E0E0 E0E0 0000 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A 2AFA"
	$"FFFA 2AAB 5454 E000 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A 2AFF"
	$"00FF 2AAB 5454 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A 2AFF"
	$"00FF 2AAB 5454 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A 2AFF"
	$"00FF 2AAB 5454 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A 2AFA"
	$"FFFA 2AAB 5454 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 54AB ABAB ABAB"
	$"ABAB AB54 5454 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 5454 5454 5454"
	$"5454 5454 5454 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 5454 5454 5454"
	$"5454 5454 5454 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 54AB ABAB ABAB"
	$"ABAB ABAB 5454 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A 2A2A"
	$"2A2A 2A2A AB54 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A 2A2A"
	$"2A2A 2A2A AB54 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A EC2A"
	$"EC2A 2A2A AB54 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A ECEC"
	$"2A2A 2A2A AB54 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A EC2A"
	$"2A2A 2A2A AB54 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00E0 5454 AB2A 2A2A 2A2A"
	$"2A2A 2A2A AB54 54E0 0000 00FF 0000 0000"
	$"0000 00FF 0000 00F5 FFFF E0E0 E0E0 E0E0"
	$"E0E0 E0E0 FFE0 E0F5 0000 00FF 0000 0000"
	$"0000 00FF 0000 0000 0000 0000 0000 0000"
	$"0000 0000 0000 0000 0000 00FF 0000 0000"
	$"0000 00FF FFFF FFFF FFFF FFFF FFFF FFFF"
	$"FFFF FFFF FFFF FFFF FFFF FFFF"
};
#endif

#if ColorIconAPIAvail
resource 'icl4' (DskIconId, purgeable) {
	$"000F FFFF FFFF FFFF FFFF F000 0000 0000"
	$"000F 0000 0000 0000 0000 FF00 0000 0000"
	$"000F 0000 0000 0000 0000 F0F0 0000 0000"
	$"000F 0000 0000 0000 0000 FC0F 0000 0000"
	$"000F 0000 0000 0000 0000 F0C0 F000 0000"
	$"000F 0000 0000 0000 0000 FC0C 0F00 0000"
	$"000F 0000 0000 0000 0000 F0C0 C0F0 0000"
	$"000F 0000 0000 0000 0000 FFFF FFFF 0000"
	$"000F 0000 0000 0000 0000 0DDD DDDF 0000"
	$"000F 0000 0000 0000 0000 0000 000F 0000"
	$"000F 0000 0000 0000 0000 0000 000F 0000"
	$"000F 0000 0000 0000 0000 0000 000F 0000"
	$"000F 0000 0000 0000 0000 0000 000F 0000"
	$"000F 0000 FFFF FFFF FFFF FF00 000F 0000"
	$"000F 000F CCEC 0C0D FD0E CCF0 000F 0000"
	$"000F 000F CCE0 C0CF 0FCE CCCF 000F 0000"
	$"000F 000F CCEC 0C0F 0F0E CCCF 000F 0000"
	$"000F 000F CCE0 C0CF 0FCE CCCF 000F 0000"
	$"000F 000F CCEC 0C0D FD0E CCCF 000F 0000"
	$"000F 000F CCCE EEEE EEEC CCCF 000F 0000"
	$"000F 000F CCCC CCCC CCCC CCCF 000F 0000"
	$"000F 000F CCCC CCCC CCCC CCCF 000F 0000"
	$"000F 000F CCCE EEEE EEEE CCCF 000F 0000"
	$"000F 000F CCEC 0C0C 0C0C ECCF 000F 0000"
	$"000F 000F CCE0 C0C0 C0C0 ECCF 000F 0000"
	$"000F 000F CCEC 0C6C 6C0C ECCF 000F 0000"
	$"000F 000F CCE0 C066 C0C0 ECCF 000F 0000"
	$"000F 000F CCEC 0C6C 0C0C ECCF 000F 0000"
	$"000F 000F CCE0 C0C0 C0C0 ECCF 000F 0000"
	$"000F 0000 FFFF FFFF FFFF FFF0 000F 0000"
	$"000F 0000 0000 0000 0000 0000 000F 0000"
	$"000F FFFF FFFF FFFF FFFF FFFF FFFF"
};
#endif
