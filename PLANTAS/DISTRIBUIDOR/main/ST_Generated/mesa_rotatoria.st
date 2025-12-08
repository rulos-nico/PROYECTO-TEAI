FUNCTION_BLOCK random_number
	VAR_INPUT
		IN : BOOL;
	END_VAR
	VAR
		M : BOOL;
		INIT : BOOL;
	END_VAR
	VAR_OUTPUT
		OUT : DINT;
	END_VAR

	IF INIT = 0 THEN
		{#include <stdio.h>}
		{#include <stdlib.h>}
		IN := 1;
	END_IF;
	IF M = 0 and IN = 1 THEN
		{SetFbVar(OUT,rand())}
	END_IF;
END_FUNCTION_BLOCK
PROGRAM tesis0
	VAR
		random : random_number;
		random_num : DINT;
		initial : BOOL;
		state : ARRAY [0..7] OF DINT;
		slt0 : ARRAY [0..896] OF DINT;
		RE_START : R_TRIG;
		FE_INICIO_L1 : F_TRIG;
		FE_INICIO_L2 : F_TRIG;
		FE_L1 : F_TRIG;
		FE_L2 : F_TRIG;
		FE_AZUL : F_TRIG;
		FE_VERDE : F_TRIG;
		FE_GIRO_A : F_TRIG;
		FE_GIRO_R : F_TRIG;
		FE_DESC_A : F_TRIG;
		FE_DESC_R : F_TRIG;
		FE_FIN_L1 : F_TRIG;
		FE_FIN_L2 : F_TRIG;
		FE_CI1 : F_TRIG;
		FE_CI2 : F_TRIG;
		FE_CS1 : F_TRIG;
		FE_CS2 : F_TRIG;
		FE_CA : F_TRIG;
		FE_CR : F_TRIG;
	END_VAR
	VAR
		GD_OUT_0 AT %QX100.0 : BOOL;
		GD_OUT_1 AT %QX100.1 : BOOL;
		GD_OUT_2 AT %QX100.2 : BOOL;
		GD_OUT_3 AT %QX100.3 : BOOL;
		GD_OUT_4 AT %QX100.4 : BOOL;
		GD_OUT_5 AT %QX100.5 : BOOL;
		GD_OUT_6 AT %QX100.6 : BOOL;
		GD_OUT_7 AT %QX100.7 : BOOL;
		GD_OUT_8 AT %QX101.0 : BOOL;
		GD_OUT_9 AT %QX101.1 : BOOL;
		GD_OUT_10 AT %QX101.2 : BOOL;
		GD_OUT_11 AT %QX101.3 : BOOL;
		GD_IN_0 AT %IX100.0 : BOOL;
		GD_IN_1 AT %IX100.1 : BOOL;
		GD_IN_2 AT %IX100.2 : BOOL;
		GD_IN_3 AT %IX100.3 : BOOL;
		GD_IN_4 AT %IX100.4 : BOOL;
		GD_IN_5 AT %IX100.5 : BOOL;
		GD_IN_6 AT %IX100.6 : BOOL;
		GD_IN_7 AT %IX100.7 : BOOL;
		GD_IN_8 AT %IX101.0 : BOOL;
		GD_IN_9 AT %IX101.1 : BOOL;
		GD_IN_10 AT %IX101.2 : BOOL;
		GD_IN_11 AT %IX101.3 : BOOL;
		GD_IN_12 AT %IX101.4 : BOOL;
		GD_IN_13 AT %IX101.5 : BOOL;
		GD_IN_14 AT %IX101.6 : BOOL;
		GD_IN_15 AT %IX101.7 : BOOL;
		GD_IN_16 AT %IX102.0 : BOOL;
		GD_IN_17 AT %IX102.1 : BOOL;
		GD_IN_18 AT %IX102.2 : BOOL;
	END_VAR
	RE_START(CLK:= GD_IN_0);
	FE_INICIO_L1(CLK:= GD_IN_1);
	FE_INICIO_L2(CLK:= GD_IN_2);
	FE_L1(CLK:= GD_IN_3);
	FE_L2(CLK:= GD_IN_4);
	FE_AZUL(CLK:= GD_IN_5);
	FE_VERDE(CLK:= GD_IN_6);
	FE_GIRO_A(CLK:= GD_IN_7);
	FE_GIRO_R(CLK:= GD_IN_8);
	FE_DESC_A(CLK:= GD_IN_9);
	FE_DESC_R(CLK:= GD_IN_10);
	FE_FIN_L1(CLK:= GD_IN_11);
	FE_FIN_L2(CLK:= GD_IN_12);
	FE_CI1(CLK:= GD_IN_13);
	FE_CI2(CLK:= GD_IN_14);
	FE_CS1(CLK:= GD_IN_15);
	FE_CS2(CLK:= GD_IN_16);
	FE_CA(CLK:= GD_IN_17);
	FE_CR(CLK:= GD_IN_18);
	random(
		IN := True,
		OUT => random_num);
	IF NOT initial THEN
		IF RE_START THEN
			initial := 1;
		END_IF;
	ELSIF initial THEN
		IF state[0] = 0 & RE_START.Q THEN
	  		state[0] := 1;
	  	ELSIF state[0] = 0 & FE_INICIO_L1.Q THEN
	  		state[0] := 2;
	  	ELSIF state[0] = 0 & FE_INICIO_L2.Q THEN
	  		state[0] := 3;
	  	ELSIF state[0] = 1 & FE_INICIO_L1.Q THEN
	  		state[0] := 4;
	  	ELSIF state[0] = 1 & FE_INICIO_L2.Q THEN
	  		state[0] := 5;
	  	ELSIF state[0] = 2 & RE_START.Q THEN
	  		state[0] := 4;
	  	ELSIF state[0] = 2 & FE_FIN_L1.Q THEN
	  		state[0] := 6;
	  	ELSIF state[0] = 2 & FE_INICIO_L2.Q THEN
	  		state[0] := 7;
	  	ELSIF state[0] = 3 & RE_START.Q THEN
	  		state[0] := 5;
	  	ELSIF state[0] = 3 & FE_INICIO_L1.Q THEN
	  		state[0] := 7;
	  	ELSIF state[0] = 3 & FE_FIN_L2.Q THEN
	  		state[0] := 8;
	  	ELSIF state[0] = 4 & FE_FIN_L1.Q THEN
	  		state[0] := 9;
	  	ELSIF state[0] = 4 & FE_INICIO_L2.Q THEN
	  		state[0] := 10;
	  	ELSIF state[0] = 5 & FE_INICIO_L1.Q THEN
	  		state[0] := 10;
	  	ELSIF state[0] = 5 & FE_FIN_L2.Q THEN
	  		state[0] := 11;
	  	ELSIF state[0] = 6 & RE_START.Q THEN
	  		state[0] := 9;
	  	ELSIF state[0] = 6 & FE_INICIO_L1.Q THEN
	  		state[0] := 12;
	  	ELSIF state[0] = 6 & FE_INICIO_L2.Q THEN
	  		state[0] := 13;
	  	ELSIF state[0] = 7 & RE_START.Q THEN
	  		state[0] := 10;
	  	ELSIF state[0] = 7 & FE_FIN_L1.Q THEN
	  		state[0] := 13;
	  	ELSIF state[0] = 7 & FE_FIN_L2.Q THEN
	  		state[0] := 14;
	  	ELSIF state[0] = 8 & RE_START.Q THEN
	  		state[0] := 11;
	  	ELSIF state[0] = 8 & FE_INICIO_L1.Q THEN
	  		state[0] := 14;
	  	ELSIF state[0] = 8 & FE_INICIO_L2.Q THEN
	  		state[0] := 15;
	  	ELSIF state[0] = 9 & FE_L1.Q THEN
	  		state[0] := 16;
	  	ELSIF state[0] = 9 & FE_INICIO_L1.Q THEN
	  		state[0] := 17;
	  	ELSIF state[0] = 9 & FE_INICIO_L2.Q THEN
	  		state[0] := 18;
	  	ELSIF state[0] = 10 & FE_FIN_L1.Q THEN
	  		state[0] := 18;
	  	ELSIF state[0] = 10 & FE_FIN_L2.Q THEN
	  		state[0] := 19;
	  	ELSIF state[0] = 11 & FE_L2.Q THEN
	  		state[0] := 20;
	  	ELSIF state[0] = 11 & FE_INICIO_L1.Q THEN
	  		state[0] := 19;
	  	ELSIF state[0] = 11 & FE_INICIO_L2.Q THEN
	  		state[0] := 21;
	  	ELSIF state[0] = 12 & RE_START.Q THEN
	  		state[0] := 17;
	  	ELSIF state[0] = 12 & FE_FIN_L1.Q THEN
	  		state[0] := 22;
	  	ELSIF state[0] = 12 & FE_INICIO_L2.Q THEN
	  		state[0] := 23;
	  	ELSIF state[0] = 13 & RE_START.Q THEN
	  		state[0] := 18;
	  	ELSIF state[0] = 13 & FE_INICIO_L1.Q THEN
	  		state[0] := 23;
	  	ELSIF state[0] = 13 & FE_FIN_L2.Q THEN
	  		state[0] := 24;
	  	ELSIF state[0] = 14 & RE_START.Q THEN
	  		state[0] := 19;
	  	ELSIF state[0] = 14 & FE_FIN_L1.Q THEN
	  		state[0] := 24;
	  	ELSIF state[0] = 14 & FE_INICIO_L2.Q THEN
	  		state[0] := 25;
	  	ELSIF state[0] = 15 & RE_START.Q THEN
	  		state[0] := 21;
	  	ELSIF state[0] = 15 & FE_INICIO_L1.Q THEN
	  		state[0] := 25;
	  	ELSIF state[0] = 15 & FE_FIN_L2.Q THEN
	  		state[0] := 26;
	  	ELSIF state[0] = 16 & FE_AZUL.Q THEN
	  		state[0] := 27;
	  	ELSIF state[0] = 16 & FE_VERDE.Q THEN
	  		state[0] := 28;
	  	ELSIF state[0] = 16 & FE_INICIO_L1.Q THEN
	  		state[0] := 29;
	  	ELSIF state[0] = 16 & FE_INICIO_L2.Q THEN
	  		state[0] := 30;
	  	ELSIF state[0] = 17 & FE_L1.Q THEN
	  		state[0] := 29;
	  	ELSIF state[0] = 17 & FE_FIN_L1.Q THEN
	  		state[0] := 31;
	  	ELSIF state[0] = 17 & FE_INICIO_L2.Q THEN
	  		state[0] := 32;
	  	ELSIF state[0] = 18 & FE_L1.Q THEN
	  		state[0] := 30;
	  	ELSIF state[0] = 18 & FE_INICIO_L1.Q THEN
	  		state[0] := 32;
	  	ELSIF state[0] = 18 & FE_FIN_L2.Q THEN
	  		state[0] := 33;
	  	ELSIF state[0] = 19 & FE_L2.Q THEN
	  		state[0] := 34;
	  	ELSIF state[0] = 19 & FE_FIN_L1.Q THEN
	  		state[0] := 33;
	  	ELSIF state[0] = 19 & FE_INICIO_L2.Q THEN
	  		state[0] := 35;
	  	ELSIF state[0] = 20 & FE_AZUL.Q THEN
	  		state[0] := 36;
	  	ELSIF state[0] = 20 & FE_VERDE.Q THEN
	  		state[0] := 37;
	  	ELSIF state[0] = 20 & FE_INICIO_L1.Q THEN
	  		state[0] := 34;
	  	ELSIF state[0] = 20 & FE_INICIO_L2.Q THEN
	  		state[0] := 38;
	  	ELSIF state[0] = 21 & FE_L2.Q THEN
	  		state[0] := 38;
	  	ELSIF state[0] = 21 & FE_INICIO_L1.Q THEN
	  		state[0] := 35;
	  	ELSIF state[0] = 21 & FE_FIN_L2.Q THEN
	  		state[0] := 39;
	  	ELSIF state[0] = 22 & RE_START.Q THEN
	  		state[0] := 31;
	  	ELSIF state[0] = 22 & FE_INICIO_L1.Q THEN
	  		state[0] := 40;
	  	ELSIF state[0] = 22 & FE_INICIO_L2.Q THEN
	  		state[0] := 41;
	  	ELSIF state[0] = 23 & RE_START.Q THEN
	  		state[0] := 32;
	  	ELSIF state[0] = 23 & FE_FIN_L1.Q THEN
	  		state[0] := 41;
	  	ELSIF state[0] = 23 & FE_FIN_L2.Q THEN
	  		state[0] := 42;
	  	ELSIF state[0] = 24 & RE_START.Q THEN
	  		state[0] := 33;
	  	ELSIF state[0] = 24 & FE_INICIO_L1.Q THEN
	  		state[0] := 42;
	  	ELSIF state[0] = 24 & FE_INICIO_L2.Q THEN
	  		state[0] := 43;
	  	ELSIF state[0] = 25 & RE_START.Q THEN
	  		state[0] := 35;
	  	ELSIF state[0] = 25 & FE_FIN_L1.Q THEN
	  		state[0] := 43;
	  	ELSIF state[0] = 25 & FE_FIN_L2.Q THEN
	  		state[0] := 44;
	  	ELSIF state[0] = 26 & RE_START.Q THEN
	  		state[0] := 39;
	  	ELSIF state[0] = 26 & FE_INICIO_L1.Q THEN
	  		state[0] := 44;
	  	ELSIF state[0] = 26 & FE_INICIO_L2.Q THEN
	  		state[0] := 45;
	  	ELSIF state[0] = 27 & FE_INICIO_L1.Q THEN
	  		state[0] := 48;
	  	ELSIF state[0] = 27 & FE_INICIO_L2.Q THEN
	  		state[0] := 49;
	  	ELSIF state[0] = 28 & FE_INICIO_L1.Q THEN
	  		state[0] := 51;
	  	ELSIF state[0] = 28 & FE_INICIO_L2.Q THEN
	  		state[0] := 52;
	  	ELSIF state[0] = 29 & FE_AZUL.Q THEN
	  		state[0] := 48;
	  	ELSIF state[0] = 29 & FE_VERDE.Q THEN
	  		state[0] := 51;
	  	ELSIF state[0] = 29 & FE_FIN_L1.Q THEN
	  		state[0] := 53;
	  	ELSIF state[0] = 29 & FE_INICIO_L2.Q THEN
	  		state[0] := 54;
	  	ELSIF state[0] = 30 & FE_AZUL.Q THEN
	  		state[0] := 49;
	  	ELSIF state[0] = 30 & FE_VERDE.Q THEN
	  		state[0] := 52;
	  	ELSIF state[0] = 30 & FE_INICIO_L1.Q THEN
	  		state[0] := 54;
	  	ELSIF state[0] = 30 & FE_FIN_L2.Q THEN
	  		state[0] := 55;
	  	ELSIF state[0] = 31 & FE_L1.Q THEN
	  		state[0] := 53;
	  	ELSIF state[0] = 31 & FE_INICIO_L1.Q THEN
	  		state[0] := 56;
	  	ELSIF state[0] = 31 & FE_INICIO_L2.Q THEN
	  		state[0] := 57;
	  	ELSIF state[0] = 32 & FE_L1.Q THEN
	  		state[0] := 54;
	  	ELSIF state[0] = 32 & FE_FIN_L1.Q THEN
	  		state[0] := 57;
	  	ELSIF state[0] = 32 & FE_FIN_L2.Q THEN
	  		state[0] := 58;
	  	ELSIF state[0] = 33 & FE_L1.Q THEN
	  		state[0] := 55;
	  	ELSIF state[0] = 33 & FE_L2.Q THEN
	  		state[0] := 59;
	  	ELSIF state[0] = 33 & FE_INICIO_L1.Q THEN
	  		state[0] := 58;
	  	ELSIF state[0] = 33 & FE_INICIO_L2.Q THEN
	  		state[0] := 60;
	  	ELSIF state[0] = 34 & FE_AZUL.Q THEN
	  		state[0] := 61;
	  	ELSIF state[0] = 34 & FE_VERDE.Q THEN
	  		state[0] := 62;
	  	ELSIF state[0] = 34 & FE_FIN_L1.Q THEN
	  		state[0] := 59;
	  	ELSIF state[0] = 34 & FE_INICIO_L2.Q THEN
	  		state[0] := 63;
	  	ELSIF state[0] = 35 & FE_L2.Q THEN
	  		state[0] := 63;
	  	ELSIF state[0] = 35 & FE_FIN_L1.Q THEN
	  		state[0] := 60;
	  	ELSIF state[0] = 35 & FE_FIN_L2.Q THEN
	  		state[0] := 64;
	  	ELSIF state[0] = 36 & FE_INICIO_L1.Q THEN
	  		state[0] := 61;
	  	ELSIF state[0] = 36 & FE_INICIO_L2.Q THEN
	  		state[0] := 67;
	  	ELSIF state[0] = 37 & FE_INICIO_L1.Q THEN
	  		state[0] := 62;
	  	ELSIF state[0] = 37 & FE_INICIO_L2.Q THEN
	  		state[0] := 69;
	  	ELSIF state[0] = 38 & FE_AZUL.Q THEN
	  		state[0] := 67;
	  	ELSIF state[0] = 38 & FE_VERDE.Q THEN
	  		state[0] := 69;
	  	ELSIF state[0] = 38 & FE_INICIO_L1.Q THEN
	  		state[0] := 63;
	  	ELSIF state[0] = 38 & FE_FIN_L2.Q THEN
	  		state[0] := 70;
	  	ELSIF state[0] = 39 & FE_L2.Q THEN
	  		state[0] := 70;
	  	ELSIF state[0] = 39 & FE_INICIO_L1.Q THEN
	  		state[0] := 64;
	  	ELSIF state[0] = 39 & FE_INICIO_L2.Q THEN
	  		state[0] := 71;
	  	ELSIF state[0] = 40 & RE_START.Q THEN
	  		state[0] := 56;
	  	ELSIF state[0] = 40 & FE_INICIO_L2.Q THEN
	  		state[0] := 72;
	  	ELSIF state[0] = 41 & RE_START.Q THEN
	  		state[0] := 57;
	  	ELSIF state[0] = 41 & FE_INICIO_L1.Q THEN
	  		state[0] := 72;
	  	ELSIF state[0] = 41 & FE_FIN_L2.Q THEN
	  		state[0] := 73;
	  	ELSIF state[0] = 42 & RE_START.Q THEN
	  		state[0] := 58;
	  	ELSIF state[0] = 42 & FE_FIN_L1.Q THEN
	  		state[0] := 73;
	  	ELSIF state[0] = 42 & FE_INICIO_L2.Q THEN
	  		state[0] := 74;
	  	ELSIF state[0] = 43 & RE_START.Q THEN
	  		state[0] := 60;
	  	ELSIF state[0] = 43 & FE_INICIO_L1.Q THEN
	  		state[0] := 74;
	  	ELSIF state[0] = 43 & FE_FIN_L2.Q THEN
	  		state[0] := 75;
	  	ELSIF state[0] = 44 & RE_START.Q THEN
	  		state[0] := 64;
	  	ELSIF state[0] = 44 & FE_FIN_L1.Q THEN
	  		state[0] := 75;
	  	ELSIF state[0] = 44 & FE_INICIO_L2.Q THEN
	  		state[0] := 76;
	  	ELSIF state[0] = 45 & RE_START.Q THEN
	  		state[0] := 71;
	  	ELSIF state[0] = 45 & FE_INICIO_L1.Q THEN
	  		state[0] := 76;
	  	ELSIF state[0] = 46 & FE_GIRO_A.Q THEN
	  		state[0] := 77;
	  	ELSIF state[0] = 46 & FE_INICIO_L1.Q THEN
	  		state[0] := 78;
	  	ELSIF state[0] = 46 & FE_INICIO_L2.Q THEN
	  		state[0] := 79;
	  	ELSIF state[0] = 47 & FE_GIRO_R.Q THEN
	  		state[0] := 80;
	  	ELSIF state[0] = 47 & FE_INICIO_L1.Q THEN
	  		state[0] := 81;
	  	ELSIF state[0] = 47 & FE_INICIO_L2.Q THEN
	  		state[0] := 82;
	  	ELSIF state[0] = 48 & FE_FIN_L1.Q THEN
	  		state[0] := 83;
	  	ELSIF state[0] = 48 & FE_INICIO_L2.Q THEN
	  		state[0] := 84;
	  	ELSIF state[0] = 49 & FE_INICIO_L1.Q THEN
	  		state[0] := 84;
	  	ELSIF state[0] = 49 & FE_FIN_L2.Q THEN
	  		state[0] := 85;
	  	ELSIF state[0] = 50 & FE_GIRO_A.Q THEN
	  		state[0] := 86;
	  	ELSIF state[0] = 50 & FE_INICIO_L1.Q THEN
	  		state[0] := 87;
	  	ELSIF state[0] = 50 & FE_INICIO_L2.Q THEN
	  		state[0] := 88;
	  	ELSIF state[0] = 51 & FE_FIN_L1.Q THEN
	  		state[0] := 89;
	  	ELSIF state[0] = 51 & FE_INICIO_L2.Q THEN
	  		state[0] := 90;
	  	ELSIF state[0] = 52 & FE_INICIO_L1.Q THEN
	  		state[0] := 90;
	  	ELSIF state[0] = 52 & FE_FIN_L2.Q THEN
	  		state[0] := 91;
	  	ELSIF state[0] = 53 & FE_AZUL.Q THEN
	  		state[0] := 83;
	  	ELSIF state[0] = 53 & FE_VERDE.Q THEN
	  		state[0] := 89;
	  	ELSIF state[0] = 53 & FE_INICIO_L1.Q THEN
	  		state[0] := 92;
	  	ELSIF state[0] = 53 & FE_INICIO_L2.Q THEN
	  		state[0] := 93;
	  	ELSIF state[0] = 54 & FE_AZUL.Q THEN
	  		state[0] := 84;
	  	ELSIF state[0] = 54 & FE_VERDE.Q THEN
	  		state[0] := 90;
	  	ELSIF state[0] = 54 & FE_FIN_L1.Q THEN
	  		state[0] := 93;
	  	ELSIF state[0] = 54 & FE_FIN_L2.Q THEN
	  		state[0] := 94;
	  	ELSIF state[0] = 55 & FE_AZUL.Q THEN
	  		state[0] := 85;
	  	ELSIF state[0] = 55 & FE_VERDE.Q THEN
	  		state[0] := 91;
	  	ELSIF state[0] = 55 & FE_INICIO_L1.Q THEN
	  		state[0] := 94;
	  	ELSIF state[0] = 55 & FE_INICIO_L2.Q THEN
	  		state[0] := 95;
	  	ELSIF state[0] = 56 & FE_L1.Q THEN
	  		state[0] := 92;
	  	ELSIF state[0] = 56 & FE_INICIO_L2.Q THEN
	  		state[0] := 96;
	  	ELSIF state[0] = 57 & FE_L1.Q THEN
	  		state[0] := 93;
	  	ELSIF state[0] = 57 & FE_INICIO_L1.Q THEN
	  		state[0] := 96;
	  	ELSIF state[0] = 57 & FE_FIN_L2.Q THEN
	  		state[0] := 97;
	  	ELSIF state[0] = 58 & FE_L1.Q THEN
	  		state[0] := 94;
	  	ELSIF state[0] = 58 & FE_L2.Q THEN
	  		state[0] := 98;
	  	ELSIF state[0] = 58 & FE_FIN_L1.Q THEN
	  		state[0] := 97;
	  	ELSIF state[0] = 58 & FE_INICIO_L2.Q THEN
	  		state[0] := 99;
	  	ELSIF state[0] = 59 & FE_AZUL.Q THEN
	  		state[0] := 100;
	  	ELSIF state[0] = 59 & FE_VERDE.Q THEN
	  		state[0] := 101;
	  	ELSIF state[0] = 59 & FE_INICIO_L1.Q THEN
	  		state[0] := 98;
	  	ELSIF state[0] = 59 & FE_INICIO_L2.Q THEN
	  		state[0] := 102;
	  	ELSIF state[0] = 60 & FE_L1.Q THEN
	  		state[0] := 95;
	  	ELSIF state[0] = 60 & FE_L2.Q THEN
	  		state[0] := 102;
	  	ELSIF state[0] = 60 & FE_INICIO_L1.Q THEN
	  		state[0] := 99;
	  	ELSIF state[0] = 60 & FE_FIN_L2.Q THEN
	  		state[0] := 103;
	  	ELSIF state[0] = 61 & FE_FIN_L1.Q THEN
	  		state[0] := 100;
	  	ELSIF state[0] = 61 & FE_INICIO_L2.Q THEN
	  		state[0] := 106;
	  	ELSIF state[0] = 62 & FE_FIN_L1.Q THEN
	  		state[0] := 101;
	  	ELSIF state[0] = 62 & FE_INICIO_L2.Q THEN
	  		state[0] := 108;
	  	ELSIF state[0] = 63 & FE_AZUL.Q THEN
	  		state[0] := 106;
	  	ELSIF state[0] = 63 & FE_VERDE.Q THEN
	  		state[0] := 108;
	  	ELSIF state[0] = 63 & FE_FIN_L1.Q THEN
	  		state[0] := 102;
	  	ELSIF state[0] = 63 & FE_FIN_L2.Q THEN
	  		state[0] := 109;
	  	ELSIF state[0] = 64 & FE_L2.Q THEN
	  		state[0] := 109;
	  	ELSIF state[0] = 64 & FE_FIN_L1.Q THEN
	  		state[0] := 103;
	  	ELSIF state[0] = 64 & FE_INICIO_L2.Q THEN
	  		state[0] := 110;
	  	ELSIF state[0] = 65 & FE_GIRO_A.Q THEN
	  		state[0] := 111;
	  	ELSIF state[0] = 65 & FE_INICIO_L1.Q THEN
	  		state[0] := 104;
	  	ELSIF state[0] = 65 & FE_INICIO_L2.Q THEN
	  		state[0] := 112;
	  	ELSIF state[0] = 66 & FE_GIRO_R.Q THEN
	  		state[0] := 113;
	  	ELSIF state[0] = 66 & FE_INICIO_L1.Q THEN
	  		state[0] := 105;
	  	ELSIF state[0] = 66 & FE_INICIO_L2.Q THEN
	  		state[0] := 114;
	  	ELSIF state[0] = 67 & FE_INICIO_L1.Q THEN
	  		state[0] := 106;
	  	ELSIF state[0] = 67 & FE_FIN_L2.Q THEN
	  		state[0] := 115;
	  	ELSIF state[0] = 68 & FE_GIRO_A.Q THEN
	  		state[0] := 116;
	  	ELSIF state[0] = 68 & FE_INICIO_L1.Q THEN
	  		state[0] := 107;
	  	ELSIF state[0] = 68 & FE_INICIO_L2.Q THEN
	  		state[0] := 117;
	  	ELSIF state[0] = 69 & FE_INICIO_L1.Q THEN
	  		state[0] := 108;
	  	ELSIF state[0] = 69 & FE_FIN_L2.Q THEN
	  		state[0] := 118;
	  	ELSIF state[0] = 70 & FE_AZUL.Q THEN
	  		state[0] := 115;
	  	ELSIF state[0] = 70 & FE_VERDE.Q THEN
	  		state[0] := 118;
	  	ELSIF state[0] = 70 & FE_INICIO_L1.Q THEN
	  		state[0] := 109;
	  	ELSIF state[0] = 70 & FE_INICIO_L2.Q THEN
	  		state[0] := 119;
	  	ELSIF state[0] = 71 & FE_L2.Q THEN
	  		state[0] := 119;
	  	ELSIF state[0] = 71 & FE_INICIO_L1.Q THEN
	  		state[0] := 110;
	  	ELSIF state[0] = 72 & RE_START.Q THEN
	  		state[0] := 96;
	  	ELSIF state[0] = 72 & FE_FIN_L2.Q THEN
	  		state[0] := 120;
	  	ELSIF state[0] = 73 & RE_START.Q THEN
	  		state[0] := 97;
	  	ELSIF state[0] = 73 & FE_INICIO_L1.Q THEN
	  		state[0] := 120;
	  	ELSIF state[0] = 73 & FE_INICIO_L2.Q THEN
	  		state[0] := 121;
	  	ELSIF state[0] = 74 & RE_START.Q THEN
	  		state[0] := 99;
	  	ELSIF state[0] = 74 & FE_FIN_L1.Q THEN
	  		state[0] := 121;
	  	ELSIF state[0] = 74 & FE_FIN_L2.Q THEN
	  		state[0] := 122;
	  	ELSIF state[0] = 75 & RE_START.Q THEN
	  		state[0] := 103;
	  	ELSIF state[0] = 75 & FE_INICIO_L1.Q THEN
	  		state[0] := 122;
	  	ELSIF state[0] = 75 & FE_INICIO_L2.Q THEN
	  		state[0] := 123;
	  	ELSIF state[0] = 76 & RE_START.Q THEN
	  		state[0] := 110;
	  	ELSIF state[0] = 76 & FE_FIN_L1.Q THEN
	  		state[0] := 123;
	  	ELSIF state[0] = 77 & FE_DESC_A.Q THEN
	  		state[0] := 124;
	  	ELSIF state[0] = 77 & FE_INICIO_L1.Q THEN
	  		state[0] := 125;
	  	ELSIF state[0] = 77 & FE_INICIO_L2.Q THEN
	  		state[0] := 126;
	  	ELSIF state[0] = 78 & FE_GIRO_A.Q THEN
	  		state[0] := 125;
	  	ELSIF state[0] = 78 & FE_FIN_L1.Q THEN
	  		state[0] := 127;
	  	ELSIF state[0] = 78 & FE_INICIO_L2.Q THEN
	  		state[0] := 128;
	  	ELSIF state[0] = 79 & FE_GIRO_A.Q THEN
	  		state[0] := 126;
	  	ELSIF state[0] = 79 & FE_INICIO_L1.Q THEN
	  		state[0] := 128;
	  	ELSIF state[0] = 79 & FE_FIN_L2.Q THEN
	  		state[0] := 129;
	  	ELSIF state[0] = 80 & FE_DESC_R.Q THEN
	  		state[0] := 1;
	  	ELSIF state[0] = 80 & FE_INICIO_L1.Q THEN
	  		state[0] := 130;
	  	ELSIF state[0] = 80 & FE_INICIO_L2.Q THEN
	  		state[0] := 131;
	  	ELSIF state[0] = 81 & FE_GIRO_R.Q THEN
	  		state[0] := 130;
	  	ELSIF state[0] = 81 & FE_FIN_L1.Q THEN
	  		state[0] := 132;
	  	ELSIF state[0] = 81 & FE_INICIO_L2.Q THEN
	  		state[0] := 133;
	  	ELSIF state[0] = 82 & FE_GIRO_R.Q THEN
	  		state[0] := 131;
	  	ELSIF state[0] = 82 & FE_INICIO_L1.Q THEN
	  		state[0] := 133;
	  	ELSIF state[0] = 82 & FE_FIN_L2.Q THEN
	  		state[0] := 134;
	  	ELSIF state[0] = 83 & FE_INICIO_L1.Q THEN
	  		state[0] := 135;
	  	ELSIF state[0] = 83 & FE_INICIO_L2.Q THEN
	  		state[0] := 136;
	  	ELSIF state[0] = 84 & FE_FIN_L1.Q THEN
	  		state[0] := 136;
	  	ELSIF state[0] = 84 & FE_FIN_L2.Q THEN
	  		state[0] := 137;
	  	ELSIF state[0] = 85 & FE_INICIO_L1.Q THEN
	  		state[0] := 137;
	  	ELSIF state[0] = 85 & FE_INICIO_L2.Q THEN
	  		state[0] := 138;
	  	ELSIF state[0] = 86 & FE_DESC_A.Q THEN
	  		state[0] := 139;
	  	ELSIF state[0] = 86 & FE_INICIO_L1.Q THEN
	  		state[0] := 140;
	  	ELSIF state[0] = 86 & FE_INICIO_L2.Q THEN
	  		state[0] := 141;
	  	ELSIF state[0] = 87 & FE_GIRO_A.Q THEN
	  		state[0] := 140;
	  	ELSIF state[0] = 87 & FE_FIN_L1.Q THEN
	  		state[0] := 142;
	  	ELSIF state[0] = 87 & FE_INICIO_L2.Q THEN
	  		state[0] := 143;
	  	ELSIF state[0] = 88 & FE_GIRO_A.Q THEN
	  		state[0] := 141;
	  	ELSIF state[0] = 88 & FE_INICIO_L1.Q THEN
	  		state[0] := 143;
	  	ELSIF state[0] = 88 & FE_FIN_L2.Q THEN
	  		state[0] := 144;
	  	ELSIF state[0] = 89 & FE_INICIO_L1.Q THEN
	  		state[0] := 145;
	  	ELSIF state[0] = 89 & FE_INICIO_L2.Q THEN
	  		state[0] := 146;
	  	ELSIF state[0] = 90 & FE_FIN_L1.Q THEN
	  		state[0] := 146;
	  	ELSIF state[0] = 90 & FE_FIN_L2.Q THEN
	  		state[0] := 147;
	  	ELSIF state[0] = 91 & FE_INICIO_L1.Q THEN
	  		state[0] := 147;
	  	ELSIF state[0] = 91 & FE_INICIO_L2.Q THEN
	  		state[0] := 148;
	  	ELSIF state[0] = 92 & FE_AZUL.Q THEN
	  		state[0] := 135;
	  	ELSIF state[0] = 92 & FE_VERDE.Q THEN
	  		state[0] := 145;
	  	ELSIF state[0] = 92 & FE_FIN_L1.Q THEN
	  		state[0] := 149;
	  	ELSIF state[0] = 92 & FE_INICIO_L2.Q THEN
	  		state[0] := 150;
	  	ELSIF state[0] = 93 & FE_AZUL.Q THEN
	  		state[0] := 136;
	  	ELSIF state[0] = 93 & FE_VERDE.Q THEN
	  		state[0] := 146;
	  	ELSIF state[0] = 93 & FE_INICIO_L1.Q THEN
	  		state[0] := 150;
	  	ELSIF state[0] = 93 & FE_FIN_L2.Q THEN
	  		state[0] := 151;
	  	ELSIF state[0] = 94 & FE_AZUL.Q THEN
	  		state[0] := 137;
	  	ELSIF state[0] = 94 & FE_VERDE.Q THEN
	  		state[0] := 147;
	  	ELSIF state[0] = 94 & FE_FIN_L1.Q THEN
	  		state[0] := 151;
	  	ELSIF state[0] = 94 & FE_INICIO_L2.Q THEN
	  		state[0] := 152;
	  	ELSIF state[0] = 95 & FE_AZUL.Q THEN
	  		state[0] := 138;
	  	ELSIF state[0] = 95 & FE_VERDE.Q THEN
	  		state[0] := 148;
	  	ELSIF state[0] = 95 & FE_INICIO_L1.Q THEN
	  		state[0] := 152;
	  	ELSIF state[0] = 95 & FE_FIN_L2.Q THEN
	  		state[0] := 153;
	  	ELSIF state[0] = 96 & FE_L1.Q THEN
	  		state[0] := 150;
	  	ELSIF state[0] = 96 & FE_FIN_L2.Q THEN
	  		state[0] := 154;
	  	ELSIF state[0] = 97 & FE_L1.Q THEN
	  		state[0] := 151;
	  	ELSIF state[0] = 97 & FE_L2.Q THEN
	  		state[0] := 155;
	  	ELSIF state[0] = 97 & FE_INICIO_L1.Q THEN
	  		state[0] := 154;
	  	ELSIF state[0] = 97 & FE_INICIO_L2.Q THEN
	  		state[0] := 156;
	  	ELSIF state[0] = 98 & FE_AZUL.Q THEN
	  		state[0] := 157;
	  	ELSIF state[0] = 98 & FE_VERDE.Q THEN
	  		state[0] := 158;
	  	ELSIF state[0] = 98 & FE_FIN_L1.Q THEN
	  		state[0] := 155;
	  	ELSIF state[0] = 98 & FE_INICIO_L2.Q THEN
	  		state[0] := 159;
	  	ELSIF state[0] = 99 & FE_L1.Q THEN
	  		state[0] := 152;
	  	ELSIF state[0] = 99 & FE_L2.Q THEN
	  		state[0] := 159;
	  	ELSIF state[0] = 99 & FE_FIN_L1.Q THEN
	  		state[0] := 156;
	  	ELSIF state[0] = 99 & FE_FIN_L2.Q THEN
	  		state[0] := 160;
	  	ELSIF state[0] = 100 & FE_INICIO_L1.Q THEN
	  		state[0] := 157;
	  	ELSIF state[0] = 100 & FE_INICIO_L2.Q THEN
	  		state[0] := 163;
	  	ELSIF state[0] = 101 & FE_INICIO_L1.Q THEN
	  		state[0] := 158;
	  	ELSIF state[0] = 101 & FE_INICIO_L2.Q THEN
	  		state[0] := 165;
	  	ELSIF state[0] = 102 & FE_AZUL.Q THEN
	  		state[0] := 163;
	  	ELSIF state[0] = 102 & FE_VERDE.Q THEN
	  		state[0] := 165;
	  	ELSIF state[0] = 102 & FE_INICIO_L1.Q THEN
	  		state[0] := 159;
	  	ELSIF state[0] = 102 & FE_FIN_L2.Q THEN
	  		state[0] := 166;
	  	ELSIF state[0] = 103 & FE_L1.Q THEN
	  		state[0] := 153;
	  	ELSIF state[0] = 103 & FE_L2.Q THEN
	  		state[0] := 166;
	  	ELSIF state[0] = 103 & FE_INICIO_L1.Q THEN
	  		state[0] := 160;
	  	ELSIF state[0] = 103 & FE_INICIO_L2.Q THEN
	  		state[0] := 167;
	  	ELSIF state[0] = 104 & FE_GIRO_A.Q THEN
	  		state[0] := 168;
	  	ELSIF state[0] = 104 & FE_FIN_L1.Q THEN
	  		state[0] := 161;
	  	ELSIF state[0] = 104 & FE_INICIO_L2.Q THEN
	  		state[0] := 169;
	  	ELSIF state[0] = 105 & FE_GIRO_R.Q THEN
	  		state[0] := 170;
	  	ELSIF state[0] = 105 & FE_FIN_L1.Q THEN
	  		state[0] := 162;
	  	ELSIF state[0] = 105 & FE_INICIO_L2.Q THEN
	  		state[0] := 171;
	  	ELSIF state[0] = 106 & FE_FIN_L1.Q THEN
	  		state[0] := 163;
	  	ELSIF state[0] = 106 & FE_FIN_L2.Q THEN
	  		state[0] := 172;
	  	ELSIF state[0] = 107 & FE_GIRO_A.Q THEN
	  		state[0] := 173;
	  	ELSIF state[0] = 107 & FE_FIN_L1.Q THEN
	  		state[0] := 164;
	  	ELSIF state[0] = 107 & FE_INICIO_L2.Q THEN
	  		state[0] := 174;
	  	ELSIF state[0] = 108 & FE_FIN_L1.Q THEN
	  		state[0] := 165;
	  	ELSIF state[0] = 108 & FE_FIN_L2.Q THEN
	  		state[0] := 175;
	  	ELSIF state[0] = 109 & FE_AZUL.Q THEN
	  		state[0] := 172;
	  	ELSIF state[0] = 109 & FE_VERDE.Q THEN
	  		state[0] := 175;
	  	ELSIF state[0] = 109 & FE_FIN_L1.Q THEN
	  		state[0] := 166;
	  	ELSIF state[0] = 109 & FE_INICIO_L2.Q THEN
	  		state[0] := 176;
	  	ELSIF state[0] = 110 & FE_L2.Q THEN
	  		state[0] := 176;
	  	ELSIF state[0] = 110 & FE_FIN_L1.Q THEN
	  		state[0] := 167;
	  	ELSIF state[0] = 111 & FE_DESC_A.Q THEN
	  		state[0] := 124;
	  	ELSIF state[0] = 111 & FE_INICIO_L1.Q THEN
	  		state[0] := 168;
	  	ELSIF state[0] = 111 & FE_INICIO_L2.Q THEN
	  		state[0] := 177;
	  	ELSIF state[0] = 112 & FE_GIRO_A.Q THEN
	  		state[0] := 177;
	  	ELSIF state[0] = 112 & FE_INICIO_L1.Q THEN
	  		state[0] := 169;
	  	ELSIF state[0] = 112 & FE_FIN_L2.Q THEN
	  		state[0] := 178;
	  	ELSIF state[0] = 113 & FE_DESC_R.Q THEN
	  		state[0] := 1;
	  	ELSIF state[0] = 113 & FE_INICIO_L1.Q THEN
	  		state[0] := 170;
	  	ELSIF state[0] = 113 & FE_INICIO_L2.Q THEN
	  		state[0] := 179;
	  	ELSIF state[0] = 114 & FE_GIRO_R.Q THEN
	  		state[0] := 179;
	  	ELSIF state[0] = 114 & FE_INICIO_L1.Q THEN
	  		state[0] := 171;
	  	ELSIF state[0] = 114 & FE_FIN_L2.Q THEN
	  		state[0] := 180;
	  	ELSIF state[0] = 115 & FE_INICIO_L1.Q THEN
	  		state[0] := 172;
	  	ELSIF state[0] = 115 & FE_INICIO_L2.Q THEN
	  		state[0] := 181;
	  	ELSIF state[0] = 116 & FE_DESC_A.Q THEN
	  		state[0] := 139;
	  	ELSIF state[0] = 116 & FE_INICIO_L1.Q THEN
	  		state[0] := 173;
	  	ELSIF state[0] = 116 & FE_INICIO_L2.Q THEN
	  		state[0] := 182;
	  	ELSIF state[0] = 117 & FE_GIRO_A.Q THEN
	  		state[0] := 182;
	  	ELSIF state[0] = 117 & FE_INICIO_L1.Q THEN
	  		state[0] := 174;
	  	ELSIF state[0] = 117 & FE_FIN_L2.Q THEN
	  		state[0] := 183;
	  	ELSIF state[0] = 118 & FE_INICIO_L1.Q THEN
	  		state[0] := 175;
	  	ELSIF state[0] = 118 & FE_INICIO_L2.Q THEN
	  		state[0] := 184;
	  	ELSIF state[0] = 119 & FE_AZUL.Q THEN
	  		state[0] := 181;
	  	ELSIF state[0] = 119 & FE_VERDE.Q THEN
	  		state[0] := 184;
	  	ELSIF state[0] = 119 & FE_INICIO_L1.Q THEN
	  		state[0] := 176;
	  	ELSIF state[0] = 119 & FE_FIN_L2.Q THEN
	  		state[0] := 185;
	  	ELSIF state[0] = 120 & RE_START.Q THEN
	  		state[0] := 154;
	  	ELSIF state[0] = 120 & FE_INICIO_L2.Q THEN
	  		state[0] := 186;
	  	ELSIF state[0] = 121 & RE_START.Q THEN
	  		state[0] := 156;
	  	ELSIF state[0] = 121 & FE_INICIO_L1.Q THEN
	  		state[0] := 186;
	  	ELSIF state[0] = 121 & FE_FIN_L2.Q THEN
	  		state[0] := 187;
	  	ELSIF state[0] = 122 & RE_START.Q THEN
	  		state[0] := 160;
	  	ELSIF state[0] = 122 & FE_FIN_L1.Q THEN
	  		state[0] := 187;
	  	ELSIF state[0] = 122 & FE_INICIO_L2.Q THEN
	  		state[0] := 188;
	  	ELSIF state[0] = 123 & RE_START.Q THEN
	  		state[0] := 167;
	  	ELSIF state[0] = 123 & FE_INICIO_L1.Q THEN
	  		state[0] := 188;
	  	ELSIF state[0] = 124 & FE_INICIO_L1.Q THEN
	  		state[0] := 189;
	  	ELSIF state[0] = 124 & FE_INICIO_L2.Q THEN
	  		state[0] := 190;
	  	ELSIF state[0] = 125 & FE_DESC_A.Q THEN
	  		state[0] := 189;
	  	ELSIF state[0] = 125 & FE_FIN_L1.Q THEN
	  		state[0] := 191;
	  	ELSIF state[0] = 125 & FE_INICIO_L2.Q THEN
	  		state[0] := 192;
	  	ELSIF state[0] = 126 & FE_DESC_A.Q THEN
	  		state[0] := 190;
	  	ELSIF state[0] = 126 & FE_INICIO_L1.Q THEN
	  		state[0] := 192;
	  	ELSIF state[0] = 126 & FE_FIN_L2.Q THEN
	  		state[0] := 193;
	  	ELSIF state[0] = 127 & FE_GIRO_A.Q THEN
	  		state[0] := 191;
	  	ELSIF state[0] = 127 & FE_INICIO_L1.Q THEN
	  		state[0] := 194;
	  	ELSIF state[0] = 127 & FE_INICIO_L2.Q THEN
	  		state[0] := 195;
	  	ELSIF state[0] = 128 & FE_GIRO_A.Q THEN
	  		state[0] := 192;
	  	ELSIF state[0] = 128 & FE_FIN_L1.Q THEN
	  		state[0] := 195;
	  	ELSIF state[0] = 128 & FE_FIN_L2.Q THEN
	  		state[0] := 196;
	  	ELSIF state[0] = 129 & FE_GIRO_A.Q THEN
	  		state[0] := 193;
	  	ELSIF state[0] = 129 & FE_INICIO_L1.Q THEN
	  		state[0] := 196;
	  	ELSIF state[0] = 129 & FE_INICIO_L2.Q THEN
	  		state[0] := 197;
	  	ELSIF state[0] = 130 & FE_DESC_R.Q THEN
	  		state[0] := 4;
	  	ELSIF state[0] = 130 & FE_FIN_L1.Q THEN
	  		state[0] := 198;
	  	ELSIF state[0] = 130 & FE_INICIO_L2.Q THEN
	  		state[0] := 199;
	  	ELSIF state[0] = 131 & FE_DESC_R.Q THEN
	  		state[0] := 5;
	  	ELSIF state[0] = 131 & FE_INICIO_L1.Q THEN
	  		state[0] := 199;
	  	ELSIF state[0] = 131 & FE_FIN_L2.Q THEN
	  		state[0] := 200;
	  	ELSIF state[0] = 132 & FE_GIRO_R.Q THEN
	  		state[0] := 198;
	  	ELSIF state[0] = 132 & FE_INICIO_L1.Q THEN
	  		state[0] := 201;
	  	ELSIF state[0] = 132 & FE_INICIO_L2.Q THEN
	  		state[0] := 202;
	  	ELSIF state[0] = 133 & FE_GIRO_R.Q THEN
	  		state[0] := 199;
	  	ELSIF state[0] = 133 & FE_FIN_L1.Q THEN
	  		state[0] := 202;
	  	ELSIF state[0] = 133 & FE_FIN_L2.Q THEN
	  		state[0] := 203;
	  	ELSIF state[0] = 134 & FE_GIRO_R.Q THEN
	  		state[0] := 200;
	  	ELSIF state[0] = 134 & FE_INICIO_L1.Q THEN
	  		state[0] := 203;
	  	ELSIF state[0] = 134 & FE_INICIO_L2.Q THEN
	  		state[0] := 204;
	  	ELSIF state[0] = 135 & FE_FIN_L1.Q THEN
	  		state[0] := 205;
	  	ELSIF state[0] = 135 & FE_INICIO_L2.Q THEN
	  		state[0] := 206;
	  	ELSIF state[0] = 136 & FE_INICIO_L1.Q THEN
	  		state[0] := 206;
	  	ELSIF state[0] = 136 & FE_FIN_L2.Q THEN
	  		state[0] := 207;
	  	ELSIF state[0] = 137 & FE_FIN_L1.Q THEN
	  		state[0] := 207;
	  	ELSIF state[0] = 137 & FE_INICIO_L2.Q THEN
	  		state[0] := 208;
	  	ELSIF state[0] = 138 & FE_INICIO_L1.Q THEN
	  		state[0] := 208;
	  	ELSIF state[0] = 138 & FE_FIN_L2.Q THEN
	  		state[0] := 209;
	  	ELSIF state[0] = 139 & FE_INICIO_L1.Q THEN
	  		state[0] := 210;
	  	ELSIF state[0] = 139 & FE_INICIO_L2.Q THEN
	  		state[0] := 211;
	  	ELSIF state[0] = 140 & FE_DESC_A.Q THEN
	  		state[0] := 210;
	  	ELSIF state[0] = 140 & FE_FIN_L1.Q THEN
	  		state[0] := 212;
	  	ELSIF state[0] = 140 & FE_INICIO_L2.Q THEN
	  		state[0] := 213;
	  	ELSIF state[0] = 141 & FE_DESC_A.Q THEN
	  		state[0] := 211;
	  	ELSIF state[0] = 141 & FE_INICIO_L1.Q THEN
	  		state[0] := 213;
	  	ELSIF state[0] = 141 & FE_FIN_L2.Q THEN
	  		state[0] := 214;
	  	ELSIF state[0] = 142 & FE_GIRO_A.Q THEN
	  		state[0] := 212;
	  	ELSIF state[0] = 142 & FE_INICIO_L1.Q THEN
	  		state[0] := 215;
	  	ELSIF state[0] = 142 & FE_INICIO_L2.Q THEN
	  		state[0] := 216;
	  	ELSIF state[0] = 143 & FE_GIRO_A.Q THEN
	  		state[0] := 213;
	  	ELSIF state[0] = 143 & FE_FIN_L1.Q THEN
	  		state[0] := 216;
	  	ELSIF state[0] = 143 & FE_FIN_L2.Q THEN
	  		state[0] := 217;
	  	ELSIF state[0] = 144 & FE_GIRO_A.Q THEN
	  		state[0] := 214;
	  	ELSIF state[0] = 144 & FE_INICIO_L1.Q THEN
	  		state[0] := 217;
	  	ELSIF state[0] = 144 & FE_INICIO_L2.Q THEN
	  		state[0] := 218;
	  	ELSIF state[0] = 145 & FE_FIN_L1.Q THEN
	  		state[0] := 219;
	  	ELSIF state[0] = 145 & FE_INICIO_L2.Q THEN
	  		state[0] := 220;
	  	ELSIF state[0] = 146 & FE_INICIO_L1.Q THEN
	  		state[0] := 220;
	  	ELSIF state[0] = 146 & FE_FIN_L2.Q THEN
	  		state[0] := 221;
	  	ELSIF state[0] = 147 & FE_FIN_L1.Q THEN
	  		state[0] := 221;
	  	ELSIF state[0] = 147 & FE_INICIO_L2.Q THEN
	  		state[0] := 222;
	  	ELSIF state[0] = 148 & FE_INICIO_L1.Q THEN
	  		state[0] := 222;
	  	ELSIF state[0] = 148 & FE_FIN_L2.Q THEN
	  		state[0] := 223;
	  	ELSIF state[0] = 149 & FE_AZUL.Q THEN
	  		state[0] := 205;
	  	ELSIF state[0] = 149 & FE_VERDE.Q THEN
	  		state[0] := 219;
	  	ELSIF state[0] = 149 & FE_INICIO_L1.Q THEN
	  		state[0] := 224;
	  	ELSIF state[0] = 149 & FE_INICIO_L2.Q THEN
	  		state[0] := 225;
	  	ELSIF state[0] = 150 & FE_AZUL.Q THEN
	  		state[0] := 206;
	  	ELSIF state[0] = 150 & FE_VERDE.Q THEN
	  		state[0] := 220;
	  	ELSIF state[0] = 150 & FE_FIN_L1.Q THEN
	  		state[0] := 225;
	  	ELSIF state[0] = 150 & FE_FIN_L2.Q THEN
	  		state[0] := 226;
	  	ELSIF state[0] = 151 & FE_AZUL.Q THEN
	  		state[0] := 207;
	  	ELSIF state[0] = 151 & FE_VERDE.Q THEN
	  		state[0] := 221;
	  	ELSIF state[0] = 151 & FE_INICIO_L1.Q THEN
	  		state[0] := 226;
	  	ELSIF state[0] = 151 & FE_INICIO_L2.Q THEN
	  		state[0] := 227;
	  	ELSIF state[0] = 152 & FE_AZUL.Q THEN
	  		state[0] := 208;
	  	ELSIF state[0] = 152 & FE_VERDE.Q THEN
	  		state[0] := 222;
	  	ELSIF state[0] = 152 & FE_FIN_L1.Q THEN
	  		state[0] := 227;
	  	ELSIF state[0] = 152 & FE_FIN_L2.Q THEN
	  		state[0] := 228;
	  	ELSIF state[0] = 153 & FE_AZUL.Q THEN
	  		state[0] := 209;
	  	ELSIF state[0] = 153 & FE_VERDE.Q THEN
	  		state[0] := 223;
	  	ELSIF state[0] = 153 & FE_INICIO_L1.Q THEN
	  		state[0] := 228;
	  	ELSIF state[0] = 153 & FE_INICIO_L2.Q THEN
	  		state[0] := 229;
	  	ELSIF state[0] = 154 & FE_L1.Q THEN
	  		state[0] := 226;
	  	ELSIF state[0] = 154 & FE_L2.Q THEN
	  		state[0] := 230;
	  	ELSIF state[0] = 154 & FE_INICIO_L2.Q THEN
	  		state[0] := 231;
	  	ELSIF state[0] = 155 & FE_AZUL.Q THEN
	  		state[0] := 232;
	  	ELSIF state[0] = 155 & FE_VERDE.Q THEN
	  		state[0] := 233;
	  	ELSIF state[0] = 155 & FE_INICIO_L1.Q THEN
	  		state[0] := 230;
	  	ELSIF state[0] = 155 & FE_INICIO_L2.Q THEN
	  		state[0] := 234;
	  	ELSIF state[0] = 156 & FE_L1.Q THEN
	  		state[0] := 227;
	  	ELSIF state[0] = 156 & FE_L2.Q THEN
	  		state[0] := 234;
	  	ELSIF state[0] = 156 & FE_INICIO_L1.Q THEN
	  		state[0] := 231;
	  	ELSIF state[0] = 156 & FE_FIN_L2.Q THEN
	  		state[0] := 235;
	  	ELSIF state[0] = 157 & FE_FIN_L1.Q THEN
	  		state[0] := 232;
	  	ELSIF state[0] = 157 & FE_INICIO_L2.Q THEN
	  		state[0] := 238;
	  	ELSIF state[0] = 158 & FE_FIN_L1.Q THEN
	  		state[0] := 233;
	  	ELSIF state[0] = 158 & FE_INICIO_L2.Q THEN
	  		state[0] := 240;
	  	ELSIF state[0] = 159 & FE_AZUL.Q THEN
	  		state[0] := 238;
	  	ELSIF state[0] = 159 & FE_VERDE.Q THEN
	  		state[0] := 240;
	  	ELSIF state[0] = 159 & FE_FIN_L1.Q THEN
	  		state[0] := 234;
	  	ELSIF state[0] = 159 & FE_FIN_L2.Q THEN
	  		state[0] := 241;
	  	ELSIF state[0] = 160 & FE_L1.Q THEN
	  		state[0] := 228;
	  	ELSIF state[0] = 160 & FE_L2.Q THEN
	  		state[0] := 241;
	  	ELSIF state[0] = 160 & FE_FIN_L1.Q THEN
	  		state[0] := 235;
	  	ELSIF state[0] = 160 & FE_INICIO_L2.Q THEN
	  		state[0] := 242;
	  	ELSIF state[0] = 161 & FE_GIRO_A.Q THEN
	  		state[0] := 243;
	  	ELSIF state[0] = 161 & FE_INICIO_L1.Q THEN
	  		state[0] := 236;
	  	ELSIF state[0] = 161 & FE_INICIO_L2.Q THEN
	  		state[0] := 244;
	  	ELSIF state[0] = 162 & FE_GIRO_R.Q THEN
	  		state[0] := 245;
	  	ELSIF state[0] = 162 & FE_INICIO_L1.Q THEN
	  		state[0] := 237;
	  	ELSIF state[0] = 162 & FE_INICIO_L2.Q THEN
	  		state[0] := 246;
	  	ELSIF state[0] = 163 & FE_INICIO_L1.Q THEN
	  		state[0] := 238;
	  	ELSIF state[0] = 163 & FE_FIN_L2.Q THEN
	  		state[0] := 247;
	  	ELSIF state[0] = 164 & FE_GIRO_A.Q THEN
	  		state[0] := 248;
	  	ELSIF state[0] = 164 & FE_INICIO_L1.Q THEN
	  		state[0] := 239;
	  	ELSIF state[0] = 164 & FE_INICIO_L2.Q THEN
	  		state[0] := 249;
	  	ELSIF state[0] = 165 & FE_INICIO_L1.Q THEN
	  		state[0] := 240;
	  	ELSIF state[0] = 165 & FE_FIN_L2.Q THEN
	  		state[0] := 250;
	  	ELSIF state[0] = 166 & FE_AZUL.Q THEN
	  		state[0] := 247;
	  	ELSIF state[0] = 166 & FE_VERDE.Q THEN
	  		state[0] := 250;
	  	ELSIF state[0] = 166 & FE_INICIO_L1.Q THEN
	  		state[0] := 241;
	  	ELSIF state[0] = 166 & FE_INICIO_L2.Q THEN
	  		state[0] := 251;
	  	ELSIF state[0] = 167 & FE_L1.Q THEN
	  		state[0] := 229;
	  	ELSIF state[0] = 167 & FE_L2.Q THEN
	  		state[0] := 251;
	  	ELSIF state[0] = 167 & FE_INICIO_L1.Q THEN
	  		state[0] := 242;
	  	ELSIF state[0] = 168 & FE_DESC_A.Q THEN
	  		state[0] := 189;
	  	ELSIF state[0] = 168 & FE_FIN_L1.Q THEN
	  		state[0] := 243;
	  	ELSIF state[0] = 168 & FE_INICIO_L2.Q THEN
	  		state[0] := 252;
	  	ELSIF state[0] = 169 & FE_GIRO_A.Q THEN
	  		state[0] := 252;
	  	ELSIF state[0] = 169 & FE_FIN_L1.Q THEN
	  		state[0] := 244;
	  	ELSIF state[0] = 169 & FE_FIN_L2.Q THEN
	  		state[0] := 253;
	  	ELSIF state[0] = 170 & FE_DESC_R.Q THEN
	  		state[0] := 4;
	  	ELSIF state[0] = 170 & FE_FIN_L1.Q THEN
	  		state[0] := 245;
	  	ELSIF state[0] = 170 & FE_INICIO_L2.Q THEN
	  		state[0] := 254;
	  	ELSIF state[0] = 171 & FE_GIRO_R.Q THEN
	  		state[0] := 254;
	  	ELSIF state[0] = 171 & FE_FIN_L1.Q THEN
	  		state[0] := 246;
	  	ELSIF state[0] = 171 & FE_FIN_L2.Q THEN
	  		state[0] := 255;
	  	ELSIF state[0] = 172 & FE_FIN_L1.Q THEN
	  		state[0] := 247;
	  	ELSIF state[0] = 172 & FE_INICIO_L2.Q THEN
	  		state[0] := 256;
	  	ELSIF state[0] = 173 & FE_DESC_A.Q THEN
	  		state[0] := 210;
	  	ELSIF state[0] = 173 & FE_FIN_L1.Q THEN
	  		state[0] := 248;
	  	ELSIF state[0] = 173 & FE_INICIO_L2.Q THEN
	  		state[0] := 257;
	  	ELSIF state[0] = 174 & FE_GIRO_A.Q THEN
	  		state[0] := 257;
	  	ELSIF state[0] = 174 & FE_FIN_L1.Q THEN
	  		state[0] := 249;
	  	ELSIF state[0] = 174 & FE_FIN_L2.Q THEN
	  		state[0] := 258;
	  	ELSIF state[0] = 175 & FE_FIN_L1.Q THEN
	  		state[0] := 250;
	  	ELSIF state[0] = 175 & FE_INICIO_L2.Q THEN
	  		state[0] := 259;
	  	ELSIF state[0] = 176 & FE_AZUL.Q THEN
	  		state[0] := 256;
	  	ELSIF state[0] = 176 & FE_VERDE.Q THEN
	  		state[0] := 259;
	  	ELSIF state[0] = 176 & FE_FIN_L1.Q THEN
	  		state[0] := 251;
	  	ELSIF state[0] = 176 & FE_FIN_L2.Q THEN
	  		state[0] := 260;
	  	ELSIF state[0] = 177 & FE_DESC_A.Q THEN
	  		state[0] := 190;
	  	ELSIF state[0] = 177 & FE_INICIO_L1.Q THEN
	  		state[0] := 252;
	  	ELSIF state[0] = 177 & FE_FIN_L2.Q THEN
	  		state[0] := 261;
	  	ELSIF state[0] = 178 & FE_GIRO_A.Q THEN
	  		state[0] := 261;
	  	ELSIF state[0] = 178 & FE_INICIO_L1.Q THEN
	  		state[0] := 253;
	  	ELSIF state[0] = 178 & FE_INICIO_L2.Q THEN
	  		state[0] := 262;
	  	ELSIF state[0] = 179 & FE_DESC_R.Q THEN
	  		state[0] := 5;
	  	ELSIF state[0] = 179 & FE_INICIO_L1.Q THEN
	  		state[0] := 254;
	  	ELSIF state[0] = 179 & FE_FIN_L2.Q THEN
	  		state[0] := 263;
	  	ELSIF state[0] = 180 & FE_GIRO_R.Q THEN
	  		state[0] := 263;
	  	ELSIF state[0] = 180 & FE_INICIO_L1.Q THEN
	  		state[0] := 255;
	  	ELSIF state[0] = 180 & FE_INICIO_L2.Q THEN
	  		state[0] := 264;
	  	ELSIF state[0] = 181 & FE_INICIO_L1.Q THEN
	  		state[0] := 256;
	  	ELSIF state[0] = 181 & FE_FIN_L2.Q THEN
	  		state[0] := 265;
	  	ELSIF state[0] = 182 & FE_DESC_A.Q THEN
	  		state[0] := 211;
	  	ELSIF state[0] = 182 & FE_INICIO_L1.Q THEN
	  		state[0] := 257;
	  	ELSIF state[0] = 182 & FE_FIN_L2.Q THEN
	  		state[0] := 266;
	  	ELSIF state[0] = 183 & FE_GIRO_A.Q THEN
	  		state[0] := 266;
	  	ELSIF state[0] = 183 & FE_INICIO_L1.Q THEN
	  		state[0] := 258;
	  	ELSIF state[0] = 183 & FE_INICIO_L2.Q THEN
	  		state[0] := 267;
	  	ELSIF state[0] = 184 & FE_INICIO_L1.Q THEN
	  		state[0] := 259;
	  	ELSIF state[0] = 184 & FE_FIN_L2.Q THEN
	  		state[0] := 268;
	  	ELSIF state[0] = 185 & FE_AZUL.Q THEN
	  		state[0] := 265;
	  	ELSIF state[0] = 185 & FE_VERDE.Q THEN
	  		state[0] := 268;
	  	ELSIF state[0] = 185 & FE_INICIO_L1.Q THEN
	  		state[0] := 260;
	  	ELSIF state[0] = 185 & FE_INICIO_L2.Q THEN
	  		state[0] := 269;
	  	ELSIF state[0] = 186 & RE_START.Q THEN
	  		state[0] := 231;
	  	ELSIF state[0] = 186 & FE_FIN_L2.Q THEN
	  		state[0] := 270;
	  	ELSIF state[0] = 187 & RE_START.Q THEN
	  		state[0] := 235;
	  	ELSIF state[0] = 187 & FE_INICIO_L1.Q THEN
	  		state[0] := 270;
	  	ELSIF state[0] = 187 & FE_INICIO_L2.Q THEN
	  		state[0] := 271;
	  	ELSIF state[0] = 188 & RE_START.Q THEN
	  		state[0] := 242;
	  	ELSIF state[0] = 188 & FE_FIN_L1.Q THEN
	  		state[0] := 271;
	  	ELSIF state[0] = 189 & FE_FIN_L1.Q THEN
	  		state[0] := 272;
	  	ELSIF state[0] = 189 & FE_INICIO_L2.Q THEN
	  		state[0] := 273;
	  	ELSIF state[0] = 190 & FE_INICIO_L1.Q THEN
	  		state[0] := 273;
	  	ELSIF state[0] = 190 & FE_FIN_L2.Q THEN
	  		state[0] := 274;
	  	ELSIF state[0] = 191 & FE_DESC_A.Q THEN
	  		state[0] := 272;
	  	ELSIF state[0] = 191 & FE_INICIO_L1.Q THEN
	  		state[0] := 275;
	  	ELSIF state[0] = 191 & FE_INICIO_L2.Q THEN
	  		state[0] := 276;
	  	ELSIF state[0] = 192 & FE_DESC_A.Q THEN
	  		state[0] := 273;
	  	ELSIF state[0] = 192 & FE_FIN_L1.Q THEN
	  		state[0] := 276;
	  	ELSIF state[0] = 192 & FE_FIN_L2.Q THEN
	  		state[0] := 277;
	  	ELSIF state[0] = 193 & FE_DESC_A.Q THEN
	  		state[0] := 274;
	  	ELSIF state[0] = 193 & FE_INICIO_L1.Q THEN
	  		state[0] := 277;
	  	ELSIF state[0] = 193 & FE_INICIO_L2.Q THEN
	  		state[0] := 278;
	  	ELSIF state[0] = 194 & FE_GIRO_A.Q THEN
	  		state[0] := 275;
	  	ELSIF state[0] = 194 & FE_FIN_L1.Q THEN
	  		state[0] := 279;
	  	ELSIF state[0] = 194 & FE_INICIO_L2.Q THEN
	  		state[0] := 280;
	  	ELSIF state[0] = 195 & FE_GIRO_A.Q THEN
	  		state[0] := 276;
	  	ELSIF state[0] = 195 & FE_INICIO_L1.Q THEN
	  		state[0] := 280;
	  	ELSIF state[0] = 195 & FE_FIN_L2.Q THEN
	  		state[0] := 281;
	  	ELSIF state[0] = 196 & FE_GIRO_A.Q THEN
	  		state[0] := 277;
	  	ELSIF state[0] = 196 & FE_FIN_L1.Q THEN
	  		state[0] := 281;
	  	ELSIF state[0] = 196 & FE_INICIO_L2.Q THEN
	  		state[0] := 282;
	  	ELSIF state[0] = 197 & FE_GIRO_A.Q THEN
	  		state[0] := 278;
	  	ELSIF state[0] = 197 & FE_INICIO_L1.Q THEN
	  		state[0] := 282;
	  	ELSIF state[0] = 197 & FE_FIN_L2.Q THEN
	  		state[0] := 283;
	  	ELSIF state[0] = 198 & FE_DESC_R.Q THEN
	  		state[0] := 9;
	  	ELSIF state[0] = 198 & FE_INICIO_L1.Q THEN
	  		state[0] := 284;
	  	ELSIF state[0] = 198 & FE_INICIO_L2.Q THEN
	  		state[0] := 285;
	  	ELSIF state[0] = 199 & FE_DESC_R.Q THEN
	  		state[0] := 10;
	  	ELSIF state[0] = 199 & FE_FIN_L1.Q THEN
	  		state[0] := 285;
	  	ELSIF state[0] = 199 & FE_FIN_L2.Q THEN
	  		state[0] := 286;
	  	ELSIF state[0] = 200 & FE_DESC_R.Q THEN
	  		state[0] := 11;
	  	ELSIF state[0] = 200 & FE_INICIO_L1.Q THEN
	  		state[0] := 286;
	  	ELSIF state[0] = 200 & FE_INICIO_L2.Q THEN
	  		state[0] := 287;
	  	ELSIF state[0] = 201 & FE_GIRO_R.Q THEN
	  		state[0] := 284;
	  	ELSIF state[0] = 201 & FE_FIN_L1.Q THEN
	  		state[0] := 288;
	  	ELSIF state[0] = 201 & FE_INICIO_L2.Q THEN
	  		state[0] := 289;
	  	ELSIF state[0] = 202 & FE_GIRO_R.Q THEN
	  		state[0] := 285;
	  	ELSIF state[0] = 202 & FE_INICIO_L1.Q THEN
	  		state[0] := 289;
	  	ELSIF state[0] = 202 & FE_FIN_L2.Q THEN
	  		state[0] := 290;
	  	ELSIF state[0] = 203 & FE_GIRO_R.Q THEN
	  		state[0] := 286;
	  	ELSIF state[0] = 203 & FE_FIN_L1.Q THEN
	  		state[0] := 290;
	  	ELSIF state[0] = 203 & FE_INICIO_L2.Q THEN
	  		state[0] := 291;
	  	ELSIF state[0] = 204 & FE_GIRO_R.Q THEN
	  		state[0] := 287;
	  	ELSIF state[0] = 204 & FE_INICIO_L1.Q THEN
	  		state[0] := 291;
	  	ELSIF state[0] = 204 & FE_FIN_L2.Q THEN
	  		state[0] := 292;
	  	ELSIF state[0] = 205 & FE_INICIO_L1.Q THEN
	  		state[0] := 293;
	  	ELSIF state[0] = 205 & FE_INICIO_L2.Q THEN
	  		state[0] := 294;
	  	ELSIF state[0] = 206 & FE_FIN_L1.Q THEN
	  		state[0] := 294;
	  	ELSIF state[0] = 206 & FE_FIN_L2.Q THEN
	  		state[0] := 295;
	  	ELSIF state[0] = 207 & FE_INICIO_L1.Q THEN
	  		state[0] := 295;
	  	ELSIF state[0] = 207 & FE_INICIO_L2.Q THEN
	  		state[0] := 296;
	  	ELSIF state[0] = 208 & FE_FIN_L1.Q THEN
	  		state[0] := 296;
	  	ELSIF state[0] = 208 & FE_FIN_L2.Q THEN
	  		state[0] := 297;
	  	ELSIF state[0] = 209 & FE_INICIO_L1.Q THEN
	  		state[0] := 297;
	  	ELSIF state[0] = 209 & FE_INICIO_L2.Q THEN
	  		state[0] := 298;
	  	ELSIF state[0] = 210 & FE_FIN_L1.Q THEN
	  		state[0] := 299;
	  	ELSIF state[0] = 210 & FE_INICIO_L2.Q THEN
	  		state[0] := 300;
	  	ELSIF state[0] = 211 & FE_INICIO_L1.Q THEN
	  		state[0] := 300;
	  	ELSIF state[0] = 211 & FE_FIN_L2.Q THEN
	  		state[0] := 301;
	  	ELSIF state[0] = 212 & FE_DESC_A.Q THEN
	  		state[0] := 299;
	  	ELSIF state[0] = 212 & FE_INICIO_L1.Q THEN
	  		state[0] := 302;
	  	ELSIF state[0] = 212 & FE_INICIO_L2.Q THEN
	  		state[0] := 303;
	  	ELSIF state[0] = 213 & FE_DESC_A.Q THEN
	  		state[0] := 300;
	  	ELSIF state[0] = 213 & FE_FIN_L1.Q THEN
	  		state[0] := 303;
	  	ELSIF state[0] = 213 & FE_FIN_L2.Q THEN
	  		state[0] := 304;
	  	ELSIF state[0] = 214 & FE_DESC_A.Q THEN
	  		state[0] := 301;
	  	ELSIF state[0] = 214 & FE_INICIO_L1.Q THEN
	  		state[0] := 304;
	  	ELSIF state[0] = 214 & FE_INICIO_L2.Q THEN
	  		state[0] := 305;
	  	ELSIF state[0] = 215 & FE_GIRO_A.Q THEN
	  		state[0] := 302;
	  	ELSIF state[0] = 215 & FE_FIN_L1.Q THEN
	  		state[0] := 306;
	  	ELSIF state[0] = 215 & FE_INICIO_L2.Q THEN
	  		state[0] := 307;
	  	ELSIF state[0] = 216 & FE_GIRO_A.Q THEN
	  		state[0] := 303;
	  	ELSIF state[0] = 216 & FE_INICIO_L1.Q THEN
	  		state[0] := 307;
	  	ELSIF state[0] = 216 & FE_FIN_L2.Q THEN
	  		state[0] := 308;
	  	ELSIF state[0] = 217 & FE_GIRO_A.Q THEN
	  		state[0] := 304;
	  	ELSIF state[0] = 217 & FE_FIN_L1.Q THEN
	  		state[0] := 308;
	  	ELSIF state[0] = 217 & FE_INICIO_L2.Q THEN
	  		state[0] := 309;
	  	ELSIF state[0] = 218 & FE_GIRO_A.Q THEN
	  		state[0] := 305;
	  	ELSIF state[0] = 218 & FE_INICIO_L1.Q THEN
	  		state[0] := 309;
	  	ELSIF state[0] = 218 & FE_FIN_L2.Q THEN
	  		state[0] := 310;
	  	ELSIF state[0] = 219 & FE_INICIO_L1.Q THEN
	  		state[0] := 311;
	  	ELSIF state[0] = 219 & FE_INICIO_L2.Q THEN
	  		state[0] := 312;
	  	ELSIF state[0] = 220 & FE_FIN_L1.Q THEN
	  		state[0] := 312;
	  	ELSIF state[0] = 220 & FE_FIN_L2.Q THEN
	  		state[0] := 313;
	  	ELSIF state[0] = 221 & FE_INICIO_L1.Q THEN
	  		state[0] := 313;
	  	ELSIF state[0] = 221 & FE_INICIO_L2.Q THEN
	  		state[0] := 314;
	  	ELSIF state[0] = 222 & FE_FIN_L1.Q THEN
	  		state[0] := 314;
	  	ELSIF state[0] = 222 & FE_FIN_L2.Q THEN
	  		state[0] := 315;
	  	ELSIF state[0] = 223 & FE_INICIO_L1.Q THEN
	  		state[0] := 315;
	  	ELSIF state[0] = 223 & FE_INICIO_L2.Q THEN
	  		state[0] := 316;
	  	ELSIF state[0] = 224 & FE_AZUL.Q THEN
	  		state[0] := 293;
	  	ELSIF state[0] = 224 & FE_VERDE.Q THEN
	  		state[0] := 311;
	  	ELSIF state[0] = 224 & FE_INICIO_L2.Q THEN
	  		state[0] := 317;
	  	ELSIF state[0] = 225 & FE_AZUL.Q THEN
	  		state[0] := 294;
	  	ELSIF state[0] = 225 & FE_VERDE.Q THEN
	  		state[0] := 312;
	  	ELSIF state[0] = 225 & FE_INICIO_L1.Q THEN
	  		state[0] := 317;
	  	ELSIF state[0] = 225 & FE_FIN_L2.Q THEN
	  		state[0] := 318;
	  	ELSIF state[0] = 226 & FE_AZUL.Q THEN
	  		state[0] := 295;
	  	ELSIF state[0] = 226 & FE_VERDE.Q THEN
	  		state[0] := 313;
	  	ELSIF state[0] = 226 & FE_FIN_L1.Q THEN
	  		state[0] := 318;
	  	ELSIF state[0] = 226 & FE_INICIO_L2.Q THEN
	  		state[0] := 319;
	  	ELSIF state[0] = 227 & FE_AZUL.Q THEN
	  		state[0] := 296;
	  	ELSIF state[0] = 227 & FE_VERDE.Q THEN
	  		state[0] := 314;
	  	ELSIF state[0] = 227 & FE_INICIO_L1.Q THEN
	  		state[0] := 319;
	  	ELSIF state[0] = 227 & FE_FIN_L2.Q THEN
	  		state[0] := 320;
	  	ELSIF state[0] = 228 & FE_AZUL.Q THEN
	  		state[0] := 297;
	  	ELSIF state[0] = 228 & FE_VERDE.Q THEN
	  		state[0] := 315;
	  	ELSIF state[0] = 228 & FE_FIN_L1.Q THEN
	  		state[0] := 320;
	  	ELSIF state[0] = 228 & FE_INICIO_L2.Q THEN
	  		state[0] := 321;
	  	ELSIF state[0] = 229 & FE_AZUL.Q THEN
	  		state[0] := 298;
	  	ELSIF state[0] = 229 & FE_VERDE.Q THEN
	  		state[0] := 316;
	  	ELSIF state[0] = 229 & FE_INICIO_L1.Q THEN
	  		state[0] := 321;
	  	ELSIF state[0] = 230 & FE_AZUL.Q THEN
	  		state[0] := 322;
	  	ELSIF state[0] = 230 & FE_VERDE.Q THEN
	  		state[0] := 323;
	  	ELSIF state[0] = 230 & FE_INICIO_L2.Q THEN
	  		state[0] := 324;
	  	ELSIF state[0] = 231 & FE_L1.Q THEN
	  		state[0] := 319;
	  	ELSIF state[0] = 231 & FE_L2.Q THEN
	  		state[0] := 324;
	  	ELSIF state[0] = 231 & FE_FIN_L2.Q THEN
	  		state[0] := 325;
	  	ELSIF state[0] = 232 & FE_INICIO_L1.Q THEN
	  		state[0] := 322;
	  	ELSIF state[0] = 232 & FE_INICIO_L2.Q THEN
	  		state[0] := 328;
	  	ELSIF state[0] = 233 & FE_INICIO_L1.Q THEN
	  		state[0] := 323;
	  	ELSIF state[0] = 233 & FE_INICIO_L2.Q THEN
	  		state[0] := 330;
	  	ELSIF state[0] = 234 & FE_AZUL.Q THEN
	  		state[0] := 328;
	  	ELSIF state[0] = 234 & FE_VERDE.Q THEN
	  		state[0] := 330;
	  	ELSIF state[0] = 234 & FE_INICIO_L1.Q THEN
	  		state[0] := 324;
	  	ELSIF state[0] = 234 & FE_FIN_L2.Q THEN
	  		state[0] := 331;
	  	ELSIF state[0] = 235 & FE_L1.Q THEN
	  		state[0] := 320;
	  	ELSIF state[0] = 235 & FE_L2.Q THEN
	  		state[0] := 331;
	  	ELSIF state[0] = 235 & FE_INICIO_L1.Q THEN
	  		state[0] := 325;
	  	ELSIF state[0] = 235 & FE_INICIO_L2.Q THEN
	  		state[0] := 332;
	  	ELSIF state[0] = 236 & FE_GIRO_A.Q THEN
	  		state[0] := 333;
	  	ELSIF state[0] = 236 & FE_FIN_L1.Q THEN
	  		state[0] := 326;
	  	ELSIF state[0] = 236 & FE_INICIO_L2.Q THEN
	  		state[0] := 334;
	  	ELSIF state[0] = 237 & FE_GIRO_R.Q THEN
	  		state[0] := 335;
	  	ELSIF state[0] = 237 & FE_FIN_L1.Q THEN
	  		state[0] := 327;
	  	ELSIF state[0] = 237 & FE_INICIO_L2.Q THEN
	  		state[0] := 336;
	  	ELSIF state[0] = 238 & FE_FIN_L1.Q THEN
	  		state[0] := 328;
	  	ELSIF state[0] = 238 & FE_FIN_L2.Q THEN
	  		state[0] := 337;
	  	ELSIF state[0] = 239 & FE_GIRO_A.Q THEN
	  		state[0] := 338;
	  	ELSIF state[0] = 239 & FE_FIN_L1.Q THEN
	  		state[0] := 329;
	  	ELSIF state[0] = 239 & FE_INICIO_L2.Q THEN
	  		state[0] := 339;
	  	ELSIF state[0] = 240 & FE_FIN_L1.Q THEN
	  		state[0] := 330;
	  	ELSIF state[0] = 240 & FE_FIN_L2.Q THEN
	  		state[0] := 340;
	  	ELSIF state[0] = 241 & FE_AZUL.Q THEN
	  		state[0] := 337;
	  	ELSIF state[0] = 241 & FE_VERDE.Q THEN
	  		state[0] := 340;
	  	ELSIF state[0] = 241 & FE_FIN_L1.Q THEN
	  		state[0] := 331;
	  	ELSIF state[0] = 241 & FE_INICIO_L2.Q THEN
	  		state[0] := 341;
	  	ELSIF state[0] = 242 & FE_L1.Q THEN
	  		state[0] := 321;
	  	ELSIF state[0] = 242 & FE_L2.Q THEN
	  		state[0] := 341;
	  	ELSIF state[0] = 242 & FE_FIN_L1.Q THEN
	  		state[0] := 332;
	  	ELSIF state[0] = 243 & FE_DESC_A.Q THEN
	  		state[0] := 272;
	  	ELSIF state[0] = 243 & FE_INICIO_L1.Q THEN
	  		state[0] := 333;
	  	ELSIF state[0] = 243 & FE_INICIO_L2.Q THEN
	  		state[0] := 342;
	  	ELSIF state[0] = 244 & FE_GIRO_A.Q THEN
	  		state[0] := 342;
	  	ELSIF state[0] = 244 & FE_INICIO_L1.Q THEN
	  		state[0] := 334;
	  	ELSIF state[0] = 244 & FE_FIN_L2.Q THEN
	  		state[0] := 343;
	  	ELSIF state[0] = 245 & FE_DESC_R.Q THEN
	  		state[0] := 9;
	  	ELSIF state[0] = 245 & FE_INICIO_L1.Q THEN
	  		state[0] := 335;
	  	ELSIF state[0] = 245 & FE_INICIO_L2.Q THEN
	  		state[0] := 344;
	  	ELSIF state[0] = 246 & FE_GIRO_R.Q THEN
	  		state[0] := 344;
	  	ELSIF state[0] = 246 & FE_INICIO_L1.Q THEN
	  		state[0] := 336;
	  	ELSIF state[0] = 246 & FE_FIN_L2.Q THEN
	  		state[0] := 345;
	  	ELSIF state[0] = 247 & FE_INICIO_L1.Q THEN
	  		state[0] := 337;
	  	ELSIF state[0] = 247 & FE_INICIO_L2.Q THEN
	  		state[0] := 346;
	  	ELSIF state[0] = 248 & FE_DESC_A.Q THEN
	  		state[0] := 299;
	  	ELSIF state[0] = 248 & FE_INICIO_L1.Q THEN
	  		state[0] := 338;
	  	ELSIF state[0] = 248 & FE_INICIO_L2.Q THEN
	  		state[0] := 347;
	  	ELSIF state[0] = 249 & FE_GIRO_A.Q THEN
	  		state[0] := 347;
	  	ELSIF state[0] = 249 & FE_INICIO_L1.Q THEN
	  		state[0] := 339;
	  	ELSIF state[0] = 249 & FE_FIN_L2.Q THEN
	  		state[0] := 348;
	  	ELSIF state[0] = 250 & FE_INICIO_L1.Q THEN
	  		state[0] := 340;
	  	ELSIF state[0] = 250 & FE_INICIO_L2.Q THEN
	  		state[0] := 349;
	  	ELSIF state[0] = 251 & FE_AZUL.Q THEN
	  		state[0] := 346;
	  	ELSIF state[0] = 251 & FE_VERDE.Q THEN
	  		state[0] := 349;
	  	ELSIF state[0] = 251 & FE_INICIO_L1.Q THEN
	  		state[0] := 341;
	  	ELSIF state[0] = 251 & FE_FIN_L2.Q THEN
	  		state[0] := 350;
	  	ELSIF state[0] = 252 & FE_DESC_A.Q THEN
	  		state[0] := 273;
	  	ELSIF state[0] = 252 & FE_FIN_L1.Q THEN
	  		state[0] := 342;
	  	ELSIF state[0] = 252 & FE_FIN_L2.Q THEN
	  		state[0] := 351;
	  	ELSIF state[0] = 253 & FE_GIRO_A.Q THEN
	  		state[0] := 351;
	  	ELSIF state[0] = 253 & FE_FIN_L1.Q THEN
	  		state[0] := 343;
	  	ELSIF state[0] = 253 & FE_INICIO_L2.Q THEN
	  		state[0] := 352;
	  	ELSIF state[0] = 254 & FE_DESC_R.Q THEN
	  		state[0] := 10;
	  	ELSIF state[0] = 254 & FE_FIN_L1.Q THEN
	  		state[0] := 344;
	  	ELSIF state[0] = 254 & FE_FIN_L2.Q THEN
	  		state[0] := 353;
	  	ELSIF state[0] = 255 & FE_GIRO_R.Q THEN
	  		state[0] := 353;
	  	ELSIF state[0] = 255 & FE_FIN_L1.Q THEN
	  		state[0] := 345;
	  	ELSIF state[0] = 255 & FE_INICIO_L2.Q THEN
	  		state[0] := 354;
	  	ELSIF state[0] = 256 & FE_FIN_L1.Q THEN
	  		state[0] := 346;
	  	ELSIF state[0] = 256 & FE_FIN_L2.Q THEN
	  		state[0] := 355;
	  	ELSIF state[0] = 257 & FE_DESC_A.Q THEN
	  		state[0] := 300;
	  	ELSIF state[0] = 257 & FE_FIN_L1.Q THEN
	  		state[0] := 347;
	  	ELSIF state[0] = 257 & FE_FIN_L2.Q THEN
	  		state[0] := 356;
	  	ELSIF state[0] = 258 & FE_GIRO_A.Q THEN
	  		state[0] := 356;
	  	ELSIF state[0] = 258 & FE_FIN_L1.Q THEN
	  		state[0] := 348;
	  	ELSIF state[0] = 258 & FE_INICIO_L2.Q THEN
	  		state[0] := 357;
	  	ELSIF state[0] = 259 & FE_FIN_L1.Q THEN
	  		state[0] := 349;
	  	ELSIF state[0] = 259 & FE_FIN_L2.Q THEN
	  		state[0] := 358;
	  	ELSIF state[0] = 260 & FE_AZUL.Q THEN
	  		state[0] := 355;
	  	ELSIF state[0] = 260 & FE_VERDE.Q THEN
	  		state[0] := 358;
	  	ELSIF state[0] = 260 & FE_FIN_L1.Q THEN
	  		state[0] := 350;
	  	ELSIF state[0] = 260 & FE_INICIO_L2.Q THEN
	  		state[0] := 359;
	  	ELSIF state[0] = 261 & FE_DESC_A.Q THEN
	  		state[0] := 274;
	  	ELSIF state[0] = 261 & FE_INICIO_L1.Q THEN
	  		state[0] := 351;
	  	ELSIF state[0] = 261 & FE_INICIO_L2.Q THEN
	  		state[0] := 360;
	  	ELSIF state[0] = 262 & FE_GIRO_A.Q THEN
	  		state[0] := 360;
	  	ELSIF state[0] = 262 & FE_INICIO_L1.Q THEN
	  		state[0] := 352;
	  	ELSIF state[0] = 262 & FE_FIN_L2.Q THEN
	  		state[0] := 361;
	  	ELSIF state[0] = 263 & FE_DESC_R.Q THEN
	  		state[0] := 11;
	  	ELSIF state[0] = 263 & FE_INICIO_L1.Q THEN
	  		state[0] := 353;
	  	ELSIF state[0] = 263 & FE_INICIO_L2.Q THEN
	  		state[0] := 362;
	  	ELSIF state[0] = 264 & FE_GIRO_R.Q THEN
	  		state[0] := 362;
	  	ELSIF state[0] = 264 & FE_INICIO_L1.Q THEN
	  		state[0] := 354;
	  	ELSIF state[0] = 264 & FE_FIN_L2.Q THEN
	  		state[0] := 363;
	  	ELSIF state[0] = 265 & FE_INICIO_L1.Q THEN
	  		state[0] := 355;
	  	ELSIF state[0] = 265 & FE_INICIO_L2.Q THEN
	  		state[0] := 364;
	  	ELSIF state[0] = 266 & FE_DESC_A.Q THEN
	  		state[0] := 301;
	  	ELSIF state[0] = 266 & FE_INICIO_L1.Q THEN
	  		state[0] := 356;
	  	ELSIF state[0] = 266 & FE_INICIO_L2.Q THEN
	  		state[0] := 365;
	  	ELSIF state[0] = 267 & FE_GIRO_A.Q THEN
	  		state[0] := 365;
	  	ELSIF state[0] = 267 & FE_INICIO_L1.Q THEN
	  		state[0] := 357;
	  	ELSIF state[0] = 267 & FE_FIN_L2.Q THEN
	  		state[0] := 366;
	  	ELSIF state[0] = 268 & FE_INICIO_L1.Q THEN
	  		state[0] := 358;
	  	ELSIF state[0] = 268 & FE_INICIO_L2.Q THEN
	  		state[0] := 367;
	  	ELSIF state[0] = 269 & FE_AZUL.Q THEN
	  		state[0] := 364;
	  	ELSIF state[0] = 269 & FE_VERDE.Q THEN
	  		state[0] := 367;
	  	ELSIF state[0] = 269 & FE_INICIO_L1.Q THEN
	  		state[0] := 359;
	  	ELSIF state[0] = 270 & RE_START.Q THEN
	  		state[0] := 325;
	  	ELSIF state[0] = 270 & FE_INICIO_L2.Q THEN
	  		state[0] := 368;
	  	ELSIF state[0] = 271 & RE_START.Q THEN
	  		state[0] := 332;
	  	ELSIF state[0] = 271 & FE_INICIO_L1.Q THEN
	  		state[0] := 368;
	  	ELSIF state[0] = 272 & FE_L1.Q THEN
	  		state[0] := 369;
	  	ELSIF state[0] = 272 & FE_INICIO_L1.Q THEN
	  		state[0] := 370;
	  	ELSIF state[0] = 272 & FE_INICIO_L2.Q THEN
	  		state[0] := 371;
	  	ELSIF state[0] = 273 & FE_FIN_L1.Q THEN
	  		state[0] := 371;
	  	ELSIF state[0] = 273 & FE_FIN_L2.Q THEN
	  		state[0] := 372;
	  	ELSIF state[0] = 274 & FE_L2.Q THEN
	  		state[0] := 373;
	  	ELSIF state[0] = 274 & FE_INICIO_L1.Q THEN
	  		state[0] := 372;
	  	ELSIF state[0] = 274 & FE_INICIO_L2.Q THEN
	  		state[0] := 374;
	  	ELSIF state[0] = 275 & FE_DESC_A.Q THEN
	  		state[0] := 370;
	  	ELSIF state[0] = 275 & FE_FIN_L1.Q THEN
	  		state[0] := 375;
	  	ELSIF state[0] = 275 & FE_INICIO_L2.Q THEN
	  		state[0] := 376;
	  	ELSIF state[0] = 276 & FE_DESC_A.Q THEN
	  		state[0] := 371;
	  	ELSIF state[0] = 276 & FE_INICIO_L1.Q THEN
	  		state[0] := 376;
	  	ELSIF state[0] = 276 & FE_FIN_L2.Q THEN
	  		state[0] := 377;
	  	ELSIF state[0] = 277 & FE_DESC_A.Q THEN
	  		state[0] := 372;
	  	ELSIF state[0] = 277 & FE_FIN_L1.Q THEN
	  		state[0] := 377;
	  	ELSIF state[0] = 277 & FE_INICIO_L2.Q THEN
	  		state[0] := 378;
	  	ELSIF state[0] = 278 & FE_DESC_A.Q THEN
	  		state[0] := 374;
	  	ELSIF state[0] = 278 & FE_INICIO_L1.Q THEN
	  		state[0] := 378;
	  	ELSIF state[0] = 278 & FE_FIN_L2.Q THEN
	  		state[0] := 379;
	  	ELSIF state[0] = 279 & FE_GIRO_A.Q THEN
	  		state[0] := 375;
	  	ELSIF state[0] = 279 & FE_INICIO_L1.Q THEN
	  		state[0] := 380;
	  	ELSIF state[0] = 279 & FE_INICIO_L2.Q THEN
	  		state[0] := 381;
	  	ELSIF state[0] = 280 & FE_GIRO_A.Q THEN
	  		state[0] := 376;
	  	ELSIF state[0] = 280 & FE_FIN_L1.Q THEN
	  		state[0] := 381;
	  	ELSIF state[0] = 280 & FE_FIN_L2.Q THEN
	  		state[0] := 382;
	  	ELSIF state[0] = 281 & FE_GIRO_A.Q THEN
	  		state[0] := 377;
	  	ELSIF state[0] = 281 & FE_INICIO_L1.Q THEN
	  		state[0] := 382;
	  	ELSIF state[0] = 281 & FE_INICIO_L2.Q THEN
	  		state[0] := 383;
	  	ELSIF state[0] = 282 & FE_GIRO_A.Q THEN
	  		state[0] := 378;
	  	ELSIF state[0] = 282 & FE_FIN_L1.Q THEN
	  		state[0] := 383;
	  	ELSIF state[0] = 282 & FE_FIN_L2.Q THEN
	  		state[0] := 384;
	  	ELSIF state[0] = 283 & FE_GIRO_A.Q THEN
	  		state[0] := 379;
	  	ELSIF state[0] = 283 & FE_INICIO_L1.Q THEN
	  		state[0] := 384;
	  	ELSIF state[0] = 283 & FE_INICIO_L2.Q THEN
	  		state[0] := 385;
	  	ELSIF state[0] = 284 & FE_DESC_R.Q THEN
	  		state[0] := 17;
	  	ELSIF state[0] = 284 & FE_FIN_L1.Q THEN
	  		state[0] := 386;
	  	ELSIF state[0] = 284 & FE_INICIO_L2.Q THEN
	  		state[0] := 387;
	  	ELSIF state[0] = 285 & FE_DESC_R.Q THEN
	  		state[0] := 18;
	  	ELSIF state[0] = 285 & FE_INICIO_L1.Q THEN
	  		state[0] := 387;
	  	ELSIF state[0] = 285 & FE_FIN_L2.Q THEN
	  		state[0] := 388;
	  	ELSIF state[0] = 286 & FE_DESC_R.Q THEN
	  		state[0] := 19;
	  	ELSIF state[0] = 286 & FE_FIN_L1.Q THEN
	  		state[0] := 388;
	  	ELSIF state[0] = 286 & FE_INICIO_L2.Q THEN
	  		state[0] := 389;
	  	ELSIF state[0] = 287 & FE_DESC_R.Q THEN
	  		state[0] := 21;
	  	ELSIF state[0] = 287 & FE_INICIO_L1.Q THEN
	  		state[0] := 389;
	  	ELSIF state[0] = 287 & FE_FIN_L2.Q THEN
	  		state[0] := 390;
	  	ELSIF state[0] = 288 & FE_GIRO_R.Q THEN
	  		state[0] := 386;
	  	ELSIF state[0] = 288 & FE_INICIO_L1.Q THEN
	  		state[0] := 391;
	  	ELSIF state[0] = 288 & FE_INICIO_L2.Q THEN
	  		state[0] := 392;
	  	ELSIF state[0] = 289 & FE_GIRO_R.Q THEN
	  		state[0] := 387;
	  	ELSIF state[0] = 289 & FE_FIN_L1.Q THEN
	  		state[0] := 392;
	  	ELSIF state[0] = 289 & FE_FIN_L2.Q THEN
	  		state[0] := 393;
	  	ELSIF state[0] = 290 & FE_GIRO_R.Q THEN
	  		state[0] := 388;
	  	ELSIF state[0] = 290 & FE_INICIO_L1.Q THEN
	  		state[0] := 393;
	  	ELSIF state[0] = 290 & FE_INICIO_L2.Q THEN
	  		state[0] := 394;
	  	ELSIF state[0] = 291 & FE_GIRO_R.Q THEN
	  		state[0] := 389;
	  	ELSIF state[0] = 291 & FE_FIN_L1.Q THEN
	  		state[0] := 394;
	  	ELSIF state[0] = 291 & FE_FIN_L2.Q THEN
	  		state[0] := 395;
	  	ELSIF state[0] = 292 & FE_GIRO_R.Q THEN
	  		state[0] := 390;
	  	ELSIF state[0] = 292 & FE_INICIO_L1.Q THEN
	  		state[0] := 395;
	  	ELSIF state[0] = 292 & FE_INICIO_L2.Q THEN
	  		state[0] := 396;
	  	ELSIF state[0] = 293 & FE_INICIO_L2.Q THEN
	  		state[0] := 397;
	  	ELSIF state[0] = 294 & FE_INICIO_L1.Q THEN
	  		state[0] := 397;
	  	ELSIF state[0] = 294 & FE_FIN_L2.Q THEN
	  		state[0] := 398;
	  	ELSIF state[0] = 295 & FE_FIN_L1.Q THEN
	  		state[0] := 398;
	  	ELSIF state[0] = 295 & FE_INICIO_L2.Q THEN
	  		state[0] := 399;
	  	ELSIF state[0] = 296 & FE_INICIO_L1.Q THEN
	  		state[0] := 399;
	  	ELSIF state[0] = 296 & FE_FIN_L2.Q THEN
	  		state[0] := 400;
	  	ELSIF state[0] = 297 & FE_FIN_L1.Q THEN
	  		state[0] := 400;
	  	ELSIF state[0] = 297 & FE_INICIO_L2.Q THEN
	  		state[0] := 401;
	  	ELSIF state[0] = 298 & FE_INICIO_L1.Q THEN
	  		state[0] := 401;
	  	ELSIF state[0] = 299 & FE_L1.Q THEN
	  		state[0] := 402;
	  	ELSIF state[0] = 299 & FE_INICIO_L1.Q THEN
	  		state[0] := 403;
	  	ELSIF state[0] = 299 & FE_INICIO_L2.Q THEN
	  		state[0] := 404;
	  	ELSIF state[0] = 300 & FE_FIN_L1.Q THEN
	  		state[0] := 404;
	  	ELSIF state[0] = 300 & FE_FIN_L2.Q THEN
	  		state[0] := 405;
	  	ELSIF state[0] = 301 & FE_L2.Q THEN
	  		state[0] := 406;
	  	ELSIF state[0] = 301 & FE_INICIO_L1.Q THEN
	  		state[0] := 405;
	  	ELSIF state[0] = 301 & FE_INICIO_L2.Q THEN
	  		state[0] := 407;
	  	ELSIF state[0] = 302 & FE_DESC_A.Q THEN
	  		state[0] := 403;
	  	ELSIF state[0] = 302 & FE_FIN_L1.Q THEN
	  		state[0] := 408;
	  	ELSIF state[0] = 302 & FE_INICIO_L2.Q THEN
	  		state[0] := 409;
	  	ELSIF state[0] = 303 & FE_DESC_A.Q THEN
	  		state[0] := 404;
	  	ELSIF state[0] = 303 & FE_INICIO_L1.Q THEN
	  		state[0] := 409;
	  	ELSIF state[0] = 303 & FE_FIN_L2.Q THEN
	  		state[0] := 410;
	  	ELSIF state[0] = 304 & FE_DESC_A.Q THEN
	  		state[0] := 405;
	  	ELSIF state[0] = 304 & FE_FIN_L1.Q THEN
	  		state[0] := 410;
	  	ELSIF state[0] = 304 & FE_INICIO_L2.Q THEN
	  		state[0] := 411;
	  	ELSIF state[0] = 305 & FE_DESC_A.Q THEN
	  		state[0] := 407;
	  	ELSIF state[0] = 305 & FE_INICIO_L1.Q THEN
	  		state[0] := 411;
	  	ELSIF state[0] = 305 & FE_FIN_L2.Q THEN
	  		state[0] := 412;
	  	ELSIF state[0] = 306 & FE_GIRO_A.Q THEN
	  		state[0] := 408;
	  	ELSIF state[0] = 306 & FE_INICIO_L1.Q THEN
	  		state[0] := 413;
	  	ELSIF state[0] = 306 & FE_INICIO_L2.Q THEN
	  		state[0] := 414;
	  	ELSIF state[0] = 307 & FE_GIRO_A.Q THEN
	  		state[0] := 409;
	  	ELSIF state[0] = 307 & FE_FIN_L1.Q THEN
	  		state[0] := 414;
	  	ELSIF state[0] = 307 & FE_FIN_L2.Q THEN
	  		state[0] := 415;
	  	ELSIF state[0] = 308 & FE_GIRO_A.Q THEN
	  		state[0] := 410;
	  	ELSIF state[0] = 308 & FE_INICIO_L1.Q THEN
	  		state[0] := 415;
	  	ELSIF state[0] = 308 & FE_INICIO_L2.Q THEN
	  		state[0] := 416;
	  	ELSIF state[0] = 309 & FE_GIRO_A.Q THEN
	  		state[0] := 411;
	  	ELSIF state[0] = 309 & FE_FIN_L1.Q THEN
	  		state[0] := 416;
	  	ELSIF state[0] = 309 & FE_FIN_L2.Q THEN
	  		state[0] := 417;
	  	ELSIF state[0] = 310 & FE_GIRO_A.Q THEN
	  		state[0] := 412;
	  	ELSIF state[0] = 310 & FE_INICIO_L1.Q THEN
	  		state[0] := 417;
	  	ELSIF state[0] = 310 & FE_INICIO_L2.Q THEN
	  		state[0] := 418;
	  	ELSIF state[0] = 311 & FE_INICIO_L2.Q THEN
	  		state[0] := 419;
	  	ELSIF state[0] = 312 & FE_INICIO_L1.Q THEN
	  		state[0] := 419;
	  	ELSIF state[0] = 312 & FE_FIN_L2.Q THEN
	  		state[0] := 420;
	  	ELSIF state[0] = 313 & FE_FIN_L1.Q THEN
	  		state[0] := 420;
	  	ELSIF state[0] = 313 & FE_INICIO_L2.Q THEN
	  		state[0] := 421;
	  	ELSIF state[0] = 314 & FE_INICIO_L1.Q THEN
	  		state[0] := 421;
	  	ELSIF state[0] = 314 & FE_FIN_L2.Q THEN
	  		state[0] := 422;
	  	ELSIF state[0] = 315 & FE_FIN_L1.Q THEN
	  		state[0] := 422;
	  	ELSIF state[0] = 315 & FE_INICIO_L2.Q THEN
	  		state[0] := 423;
	  	ELSIF state[0] = 316 & FE_INICIO_L1.Q THEN
	  		state[0] := 423;
	  	ELSIF state[0] = 317 & FE_AZUL.Q THEN
	  		state[0] := 397;
	  	ELSIF state[0] = 317 & FE_VERDE.Q THEN
	  		state[0] := 419;
	  	ELSIF state[0] = 317 & FE_FIN_L2.Q THEN
	  		state[0] := 424;
	  	ELSIF state[0] = 318 & FE_AZUL.Q THEN
	  		state[0] := 398;
	  	ELSIF state[0] = 318 & FE_VERDE.Q THEN
	  		state[0] := 420;
	  	ELSIF state[0] = 318 & FE_INICIO_L1.Q THEN
	  		state[0] := 424;
	  	ELSIF state[0] = 318 & FE_INICIO_L2.Q THEN
	  		state[0] := 425;
	  	ELSIF state[0] = 319 & FE_AZUL.Q THEN
	  		state[0] := 399;
	  	ELSIF state[0] = 319 & FE_VERDE.Q THEN
	  		state[0] := 421;
	  	ELSIF state[0] = 319 & FE_FIN_L1.Q THEN
	  		state[0] := 425;
	  	ELSIF state[0] = 319 & FE_FIN_L2.Q THEN
	  		state[0] := 426;
	  	ELSIF state[0] = 320 & FE_AZUL.Q THEN
	  		state[0] := 400;
	  	ELSIF state[0] = 320 & FE_VERDE.Q THEN
	  		state[0] := 422;
	  	ELSIF state[0] = 320 & FE_INICIO_L1.Q THEN
	  		state[0] := 426;
	  	ELSIF state[0] = 320 & FE_INICIO_L2.Q THEN
	  		state[0] := 427;
	  	ELSIF state[0] = 321 & FE_AZUL.Q THEN
	  		state[0] := 401;
	  	ELSIF state[0] = 321 & FE_VERDE.Q THEN
	  		state[0] := 423;
	  	ELSIF state[0] = 321 & FE_FIN_L1.Q THEN
	  		state[0] := 427;
	  	ELSIF state[0] = 322 & FE_INICIO_L2.Q THEN
	  		state[0] := 430;
	  	ELSIF state[0] = 323 & FE_INICIO_L2.Q THEN
	  		state[0] := 432;
	  	ELSIF state[0] = 324 & FE_AZUL.Q THEN
	  		state[0] := 430;
	  	ELSIF state[0] = 324 & FE_VERDE.Q THEN
	  		state[0] := 432;
	  	ELSIF state[0] = 324 & FE_FIN_L2.Q THEN
	  		state[0] := 433;
	  	ELSIF state[0] = 325 & FE_L1.Q THEN
	  		state[0] := 426;
	  	ELSIF state[0] = 325 & FE_L2.Q THEN
	  		state[0] := 433;
	  	ELSIF state[0] = 325 & FE_INICIO_L2.Q THEN
	  		state[0] := 434;
	  	ELSIF state[0] = 326 & FE_GIRO_A.Q THEN
	  		state[0] := 435;
	  	ELSIF state[0] = 326 & FE_INICIO_L1.Q THEN
	  		state[0] := 428;
	  	ELSIF state[0] = 326 & FE_INICIO_L2.Q THEN
	  		state[0] := 436;
	  	ELSIF state[0] = 327 & FE_GIRO_R.Q THEN
	  		state[0] := 437;
	  	ELSIF state[0] = 327 & FE_INICIO_L1.Q THEN
	  		state[0] := 429;
	  	ELSIF state[0] = 327 & FE_INICIO_L2.Q THEN
	  		state[0] := 438;
	  	ELSIF state[0] = 328 & FE_INICIO_L1.Q THEN
	  		state[0] := 430;
	  	ELSIF state[0] = 328 & FE_FIN_L2.Q THEN
	  		state[0] := 439;
	  	ELSIF state[0] = 329 & FE_GIRO_A.Q THEN
	  		state[0] := 440;
	  	ELSIF state[0] = 329 & FE_INICIO_L1.Q THEN
	  		state[0] := 431;
	  	ELSIF state[0] = 329 & FE_INICIO_L2.Q THEN
	  		state[0] := 441;
	  	ELSIF state[0] = 330 & FE_INICIO_L1.Q THEN
	  		state[0] := 432;
	  	ELSIF state[0] = 330 & FE_FIN_L2.Q THEN
	  		state[0] := 442;
	  	ELSIF state[0] = 331 & FE_AZUL.Q THEN
	  		state[0] := 439;
	  	ELSIF state[0] = 331 & FE_VERDE.Q THEN
	  		state[0] := 442;
	  	ELSIF state[0] = 331 & FE_INICIO_L1.Q THEN
	  		state[0] := 433;
	  	ELSIF state[0] = 331 & FE_INICIO_L2.Q THEN
	  		state[0] := 443;
	  	ELSIF state[0] = 332 & FE_L1.Q THEN
	  		state[0] := 427;
	  	ELSIF state[0] = 332 & FE_L2.Q THEN
	  		state[0] := 443;
	  	ELSIF state[0] = 332 & FE_INICIO_L1.Q THEN
	  		state[0] := 434;
	  	ELSIF state[0] = 333 & FE_DESC_A.Q THEN
	  		state[0] := 370;
	  	ELSIF state[0] = 333 & FE_FIN_L1.Q THEN
	  		state[0] := 435;
	  	ELSIF state[0] = 333 & FE_INICIO_L2.Q THEN
	  		state[0] := 444;
	  	ELSIF state[0] = 334 & FE_GIRO_A.Q THEN
	  		state[0] := 444;
	  	ELSIF state[0] = 334 & FE_FIN_L1.Q THEN
	  		state[0] := 436;
	  	ELSIF state[0] = 334 & FE_FIN_L2.Q THEN
	  		state[0] := 445;
	  	ELSIF state[0] = 335 & FE_DESC_R.Q THEN
	  		state[0] := 17;
	  	ELSIF state[0] = 335 & FE_FIN_L1.Q THEN
	  		state[0] := 437;
	  	ELSIF state[0] = 335 & FE_INICIO_L2.Q THEN
	  		state[0] := 446;
	  	ELSIF state[0] = 336 & FE_GIRO_R.Q THEN
	  		state[0] := 446;
	  	ELSIF state[0] = 336 & FE_FIN_L1.Q THEN
	  		state[0] := 438;
	  	ELSIF state[0] = 336 & FE_FIN_L2.Q THEN
	  		state[0] := 447;
	  	ELSIF state[0] = 337 & FE_FIN_L1.Q THEN
	  		state[0] := 439;
	  	ELSIF state[0] = 337 & FE_INICIO_L2.Q THEN
	  		state[0] := 448;
	  	ELSIF state[0] = 338 & FE_DESC_A.Q THEN
	  		state[0] := 403;
	  	ELSIF state[0] = 338 & FE_FIN_L1.Q THEN
	  		state[0] := 440;
	  	ELSIF state[0] = 338 & FE_INICIO_L2.Q THEN
	  		state[0] := 449;
	  	ELSIF state[0] = 339 & FE_GIRO_A.Q THEN
	  		state[0] := 449;
	  	ELSIF state[0] = 339 & FE_FIN_L1.Q THEN
	  		state[0] := 441;
	  	ELSIF state[0] = 339 & FE_FIN_L2.Q THEN
	  		state[0] := 450;
	  	ELSIF state[0] = 340 & FE_FIN_L1.Q THEN
	  		state[0] := 442;
	  	ELSIF state[0] = 340 & FE_INICIO_L2.Q THEN
	  		state[0] := 451;
	  	ELSIF state[0] = 341 & FE_AZUL.Q THEN
	  		state[0] := 448;
	  	ELSIF state[0] = 341 & FE_VERDE.Q THEN
	  		state[0] := 451;
	  	ELSIF state[0] = 341 & FE_FIN_L1.Q THEN
	  		state[0] := 443;
	  	ELSIF state[0] = 341 & FE_FIN_L2.Q THEN
	  		state[0] := 452;
	  	ELSIF state[0] = 342 & FE_DESC_A.Q THEN
	  		state[0] := 371;
	  	ELSIF state[0] = 342 & FE_INICIO_L1.Q THEN
	  		state[0] := 444;
	  	ELSIF state[0] = 342 & FE_FIN_L2.Q THEN
	  		state[0] := 453;
	  	ELSIF state[0] = 343 & FE_GIRO_A.Q THEN
	  		state[0] := 453;
	  	ELSIF state[0] = 343 & FE_INICIO_L1.Q THEN
	  		state[0] := 445;
	  	ELSIF state[0] = 343 & FE_INICIO_L2.Q THEN
	  		state[0] := 454;
	  	ELSIF state[0] = 344 & FE_DESC_R.Q THEN
	  		state[0] := 18;
	  	ELSIF state[0] = 344 & FE_INICIO_L1.Q THEN
	  		state[0] := 446;
	  	ELSIF state[0] = 344 & FE_FIN_L2.Q THEN
	  		state[0] := 455;
	  	ELSIF state[0] = 345 & FE_GIRO_R.Q THEN
	  		state[0] := 455;
	  	ELSIF state[0] = 345 & FE_INICIO_L1.Q THEN
	  		state[0] := 447;
	  	ELSIF state[0] = 345 & FE_INICIO_L2.Q THEN
	  		state[0] := 456;
	  	ELSIF state[0] = 346 & FE_INICIO_L1.Q THEN
	  		state[0] := 448;
	  	ELSIF state[0] = 346 & FE_FIN_L2.Q THEN
	  		state[0] := 457;
	  	ELSIF state[0] = 347 & FE_DESC_A.Q THEN
	  		state[0] := 404;
	  	ELSIF state[0] = 347 & FE_INICIO_L1.Q THEN
	  		state[0] := 449;
	  	ELSIF state[0] = 347 & FE_FIN_L2.Q THEN
	  		state[0] := 458;
	  	ELSIF state[0] = 348 & FE_GIRO_A.Q THEN
	  		state[0] := 458;
	  	ELSIF state[0] = 348 & FE_INICIO_L1.Q THEN
	  		state[0] := 450;
	  	ELSIF state[0] = 348 & FE_INICIO_L2.Q THEN
	  		state[0] := 459;
	  	ELSIF state[0] = 349 & FE_INICIO_L1.Q THEN
	  		state[0] := 451;
	  	ELSIF state[0] = 349 & FE_FIN_L2.Q THEN
	  		state[0] := 460;
	  	ELSIF state[0] = 350 & FE_AZUL.Q THEN
	  		state[0] := 457;
	  	ELSIF state[0] = 350 & FE_VERDE.Q THEN
	  		state[0] := 460;
	  	ELSIF state[0] = 350 & FE_INICIO_L1.Q THEN
	  		state[0] := 452;
	  	ELSIF state[0] = 350 & FE_INICIO_L2.Q THEN
	  		state[0] := 461;
	  	ELSIF state[0] = 351 & FE_DESC_A.Q THEN
	  		state[0] := 372;
	  	ELSIF state[0] = 351 & FE_FIN_L1.Q THEN
	  		state[0] := 453;
	  	ELSIF state[0] = 351 & FE_INICIO_L2.Q THEN
	  		state[0] := 462;
	  	ELSIF state[0] = 352 & FE_GIRO_A.Q THEN
	  		state[0] := 462;
	  	ELSIF state[0] = 352 & FE_FIN_L1.Q THEN
	  		state[0] := 454;
	  	ELSIF state[0] = 352 & FE_FIN_L2.Q THEN
	  		state[0] := 463;
	  	ELSIF state[0] = 353 & FE_DESC_R.Q THEN
	  		state[0] := 19;
	  	ELSIF state[0] = 353 & FE_FIN_L1.Q THEN
	  		state[0] := 455;
	  	ELSIF state[0] = 353 & FE_INICIO_L2.Q THEN
	  		state[0] := 464;
	  	ELSIF state[0] = 354 & FE_GIRO_R.Q THEN
	  		state[0] := 464;
	  	ELSIF state[0] = 354 & FE_FIN_L1.Q THEN
	  		state[0] := 456;
	  	ELSIF state[0] = 354 & FE_FIN_L2.Q THEN
	  		state[0] := 465;
	  	ELSIF state[0] = 355 & FE_FIN_L1.Q THEN
	  		state[0] := 457;
	  	ELSIF state[0] = 355 & FE_INICIO_L2.Q THEN
	  		state[0] := 466;
	  	ELSIF state[0] = 356 & FE_DESC_A.Q THEN
	  		state[0] := 405;
	  	ELSIF state[0] = 356 & FE_FIN_L1.Q THEN
	  		state[0] := 458;
	  	ELSIF state[0] = 356 & FE_INICIO_L2.Q THEN
	  		state[0] := 467;
	  	ELSIF state[0] = 357 & FE_GIRO_A.Q THEN
	  		state[0] := 467;
	  	ELSIF state[0] = 357 & FE_FIN_L1.Q THEN
	  		state[0] := 459;
	  	ELSIF state[0] = 357 & FE_FIN_L2.Q THEN
	  		state[0] := 468;
	  	ELSIF state[0] = 358 & FE_FIN_L1.Q THEN
	  		state[0] := 460;
	  	ELSIF state[0] = 358 & FE_INICIO_L2.Q THEN
	  		state[0] := 469;
	  	ELSIF state[0] = 359 & FE_AZUL.Q THEN
	  		state[0] := 466;
	  	ELSIF state[0] = 359 & FE_VERDE.Q THEN
	  		state[0] := 469;
	  	ELSIF state[0] = 359 & FE_FIN_L1.Q THEN
	  		state[0] := 461;
	  	ELSIF state[0] = 360 & FE_DESC_A.Q THEN
	  		state[0] := 374;
	  	ELSIF state[0] = 360 & FE_INICIO_L1.Q THEN
	  		state[0] := 462;
	  	ELSIF state[0] = 360 & FE_FIN_L2.Q THEN
	  		state[0] := 470;
	  	ELSIF state[0] = 361 & FE_GIRO_A.Q THEN
	  		state[0] := 470;
	  	ELSIF state[0] = 361 & FE_INICIO_L1.Q THEN
	  		state[0] := 463;
	  	ELSIF state[0] = 361 & FE_INICIO_L2.Q THEN
	  		state[0] := 471;
	  	ELSIF state[0] = 362 & FE_DESC_R.Q THEN
	  		state[0] := 21;
	  	ELSIF state[0] = 362 & FE_INICIO_L1.Q THEN
	  		state[0] := 464;
	  	ELSIF state[0] = 362 & FE_FIN_L2.Q THEN
	  		state[0] := 472;
	  	ELSIF state[0] = 363 & FE_GIRO_R.Q THEN
	  		state[0] := 472;
	  	ELSIF state[0] = 363 & FE_INICIO_L1.Q THEN
	  		state[0] := 465;
	  	ELSIF state[0] = 363 & FE_INICIO_L2.Q THEN
	  		state[0] := 473;
	  	ELSIF state[0] = 364 & FE_INICIO_L1.Q THEN
	  		state[0] := 466;
	  	ELSIF state[0] = 365 & FE_DESC_A.Q THEN
	  		state[0] := 407;
	  	ELSIF state[0] = 365 & FE_INICIO_L1.Q THEN
	  		state[0] := 467;
	  	ELSIF state[0] = 365 & FE_FIN_L2.Q THEN
	  		state[0] := 474;
	  	ELSIF state[0] = 366 & FE_GIRO_A.Q THEN
	  		state[0] := 474;
	  	ELSIF state[0] = 366 & FE_INICIO_L1.Q THEN
	  		state[0] := 468;
	  	ELSIF state[0] = 366 & FE_INICIO_L2.Q THEN
	  		state[0] := 475;
	  	ELSIF state[0] = 367 & FE_INICIO_L1.Q THEN
	  		state[0] := 469;
	  	ELSIF state[0] = 368 & RE_START.Q THEN
	  		state[0] := 434;
	  	ELSIF state[0] = 369 & FE_AZUL.Q THEN
	  		state[0] := 476;
	  	ELSIF state[0] = 369 & FE_VERDE.Q THEN
	  		state[0] := 477;
	  	ELSIF state[0] = 369 & FE_INICIO_L1.Q THEN
	  		state[0] := 478;
	  	ELSIF state[0] = 369 & FE_INICIO_L2.Q THEN
	  		state[0] := 479;
	  	ELSIF state[0] = 370 & FE_L1.Q THEN
	  		state[0] := 478;
	  	ELSIF state[0] = 370 & FE_FIN_L1.Q THEN
	  		state[0] := 480;
	  	ELSIF state[0] = 370 & FE_INICIO_L2.Q THEN
	  		state[0] := 481;
	  	ELSIF state[0] = 371 & FE_L1.Q THEN
	  		state[0] := 479;
	  	ELSIF state[0] = 371 & FE_INICIO_L1.Q THEN
	  		state[0] := 481;
	  	ELSIF state[0] = 371 & FE_FIN_L2.Q THEN
	  		state[0] := 482;
	  	ELSIF state[0] = 372 & FE_L2.Q THEN
	  		state[0] := 483;
	  	ELSIF state[0] = 372 & FE_FIN_L1.Q THEN
	  		state[0] := 482;
	  	ELSIF state[0] = 372 & FE_INICIO_L2.Q THEN
	  		state[0] := 484;
	  	ELSIF state[0] = 373 & FE_AZUL.Q THEN
	  		state[0] := 485;
	  	ELSIF state[0] = 373 & FE_VERDE.Q THEN
	  		state[0] := 486;
	  	ELSIF state[0] = 373 & FE_INICIO_L1.Q THEN
	  		state[0] := 483;
	  	ELSIF state[0] = 373 & FE_INICIO_L2.Q THEN
	  		state[0] := 487;
	  	ELSIF state[0] = 374 & FE_L2.Q THEN
	  		state[0] := 487;
	  	ELSIF state[0] = 374 & FE_INICIO_L1.Q THEN
	  		state[0] := 484;
	  	ELSIF state[0] = 374 & FE_FIN_L2.Q THEN
	  		state[0] := 488;
	  	ELSIF state[0] = 375 & FE_DESC_A.Q THEN
	  		state[0] := 480;
	  	ELSIF state[0] = 375 & FE_INICIO_L1.Q THEN
	  		state[0] := 489;
	  	ELSIF state[0] = 375 & FE_INICIO_L2.Q THEN
	  		state[0] := 490;
	  	ELSIF state[0] = 376 & FE_DESC_A.Q THEN
	  		state[0] := 481;
	  	ELSIF state[0] = 376 & FE_FIN_L1.Q THEN
	  		state[0] := 490;
	  	ELSIF state[0] = 376 & FE_FIN_L2.Q THEN
	  		state[0] := 491;
	  	ELSIF state[0] = 377 & FE_DESC_A.Q THEN
	  		state[0] := 482;
	  	ELSIF state[0] = 377 & FE_INICIO_L1.Q THEN
	  		state[0] := 491;
	  	ELSIF state[0] = 377 & FE_INICIO_L2.Q THEN
	  		state[0] := 492;
	  	ELSIF state[0] = 378 & FE_DESC_A.Q THEN
	  		state[0] := 484;
	  	ELSIF state[0] = 378 & FE_FIN_L1.Q THEN
	  		state[0] := 492;
	  	ELSIF state[0] = 378 & FE_FIN_L2.Q THEN
	  		state[0] := 493;
	  	ELSIF state[0] = 379 & FE_DESC_A.Q THEN
	  		state[0] := 488;
	  	ELSIF state[0] = 379 & FE_INICIO_L1.Q THEN
	  		state[0] := 493;
	  	ELSIF state[0] = 379 & FE_INICIO_L2.Q THEN
	  		state[0] := 494;
	  	ELSIF state[0] = 380 & FE_GIRO_A.Q THEN
	  		state[0] := 489;
	  	ELSIF state[0] = 380 & FE_INICIO_L2.Q THEN
	  		state[0] := 495;
	  	ELSIF state[0] = 381 & FE_GIRO_A.Q THEN
	  		state[0] := 490;
	  	ELSIF state[0] = 381 & FE_INICIO_L1.Q THEN
	  		state[0] := 495;
	  	ELSIF state[0] = 381 & FE_FIN_L2.Q THEN
	  		state[0] := 496;
	  	ELSIF state[0] = 382 & FE_GIRO_A.Q THEN
	  		state[0] := 491;
	  	ELSIF state[0] = 382 & FE_FIN_L1.Q THEN
	  		state[0] := 496;
	  	ELSIF state[0] = 382 & FE_INICIO_L2.Q THEN
	  		state[0] := 497;
	  	ELSIF state[0] = 383 & FE_GIRO_A.Q THEN
	  		state[0] := 492;
	  	ELSIF state[0] = 383 & FE_INICIO_L1.Q THEN
	  		state[0] := 497;
	  	ELSIF state[0] = 383 & FE_FIN_L2.Q THEN
	  		state[0] := 498;
	  	ELSIF state[0] = 384 & FE_GIRO_A.Q THEN
	  		state[0] := 493;
	  	ELSIF state[0] = 384 & FE_FIN_L1.Q THEN
	  		state[0] := 498;
	  	ELSIF state[0] = 384 & FE_INICIO_L2.Q THEN
	  		state[0] := 499;
	  	ELSIF state[0] = 385 & FE_GIRO_A.Q THEN
	  		state[0] := 494;
	  	ELSIF state[0] = 385 & FE_INICIO_L1.Q THEN
	  		state[0] := 499;
	  	ELSIF state[0] = 386 & FE_DESC_R.Q THEN
	  		state[0] := 31;
	  	ELSIF state[0] = 386 & FE_INICIO_L1.Q THEN
	  		state[0] := 500;
	  	ELSIF state[0] = 386 & FE_INICIO_L2.Q THEN
	  		state[0] := 501;
	  	ELSIF state[0] = 387 & FE_DESC_R.Q THEN
	  		state[0] := 32;
	  	ELSIF state[0] = 387 & FE_FIN_L1.Q THEN
	  		state[0] := 501;
	  	ELSIF state[0] = 387 & FE_FIN_L2.Q THEN
	  		state[0] := 502;
	  	ELSIF state[0] = 388 & FE_DESC_R.Q THEN
	  		state[0] := 33;
	  	ELSIF state[0] = 388 & FE_INICIO_L1.Q THEN
	  		state[0] := 502;
	  	ELSIF state[0] = 388 & FE_INICIO_L2.Q THEN
	  		state[0] := 503;
	  	ELSIF state[0] = 389 & FE_DESC_R.Q THEN
	  		state[0] := 35;
	  	ELSIF state[0] = 389 & FE_FIN_L1.Q THEN
	  		state[0] := 503;
	  	ELSIF state[0] = 389 & FE_FIN_L2.Q THEN
	  		state[0] := 504;
	  	ELSIF state[0] = 390 & FE_DESC_R.Q THEN
	  		state[0] := 39;
	  	ELSIF state[0] = 390 & FE_INICIO_L1.Q THEN
	  		state[0] := 504;
	  	ELSIF state[0] = 390 & FE_INICIO_L2.Q THEN
	  		state[0] := 505;
	  	ELSIF state[0] = 391 & FE_GIRO_R.Q THEN
	  		state[0] := 500;
	  	ELSIF state[0] = 391 & FE_INICIO_L2.Q THEN
	  		state[0] := 506;
	  	ELSIF state[0] = 392 & FE_GIRO_R.Q THEN
	  		state[0] := 501;
	  	ELSIF state[0] = 392 & FE_INICIO_L1.Q THEN
	  		state[0] := 506;
	  	ELSIF state[0] = 392 & FE_FIN_L2.Q THEN
	  		state[0] := 507;
	  	ELSIF state[0] = 393 & FE_GIRO_R.Q THEN
	  		state[0] := 502;
	  	ELSIF state[0] = 393 & FE_FIN_L1.Q THEN
	  		state[0] := 507;
	  	ELSIF state[0] = 393 & FE_INICIO_L2.Q THEN
	  		state[0] := 508;
	  	ELSIF state[0] = 394 & FE_GIRO_R.Q THEN
	  		state[0] := 503;
	  	ELSIF state[0] = 394 & FE_INICIO_L1.Q THEN
	  		state[0] := 508;
	  	ELSIF state[0] = 394 & FE_FIN_L2.Q THEN
	  		state[0] := 509;
	  	ELSIF state[0] = 395 & FE_GIRO_R.Q THEN
	  		state[0] := 504;
	  	ELSIF state[0] = 395 & FE_FIN_L1.Q THEN
	  		state[0] := 509;
	  	ELSIF state[0] = 395 & FE_INICIO_L2.Q THEN
	  		state[0] := 510;
	  	ELSIF state[0] = 396 & FE_GIRO_R.Q THEN
	  		state[0] := 505;
	  	ELSIF state[0] = 396 & FE_INICIO_L1.Q THEN
	  		state[0] := 510;
	  	ELSIF state[0] = 397 & FE_FIN_L2.Q THEN
	  		state[0] := 511;
	  	ELSIF state[0] = 398 & FE_INICIO_L1.Q THEN
	  		state[0] := 511;
	  	ELSIF state[0] = 398 & FE_INICIO_L2.Q THEN
	  		state[0] := 512;
	  	ELSIF state[0] = 399 & FE_FIN_L1.Q THEN
	  		state[0] := 512;
	  	ELSIF state[0] = 399 & FE_FIN_L2.Q THEN
	  		state[0] := 513;
	  	ELSIF state[0] = 400 & FE_INICIO_L1.Q THEN
	  		state[0] := 513;
	  	ELSIF state[0] = 400 & FE_INICIO_L2.Q THEN
	  		state[0] := 514;
	  	ELSIF state[0] = 401 & FE_FIN_L1.Q THEN
	  		state[0] := 514;
	  	ELSIF state[0] = 402 & FE_AZUL.Q THEN
	  		state[0] := 515;
	  	ELSIF state[0] = 402 & FE_VERDE.Q THEN
	  		state[0] := 516;
	  	ELSIF state[0] = 402 & FE_INICIO_L1.Q THEN
	  		state[0] := 517;
	  	ELSIF state[0] = 402 & FE_INICIO_L2.Q THEN
	  		state[0] := 518;
	  	ELSIF state[0] = 403 & FE_L1.Q THEN
	  		state[0] := 517;
	  	ELSIF state[0] = 403 & FE_FIN_L1.Q THEN
	  		state[0] := 519;
	  	ELSIF state[0] = 403 & FE_INICIO_L2.Q THEN
	  		state[0] := 520;
	  	ELSIF state[0] = 404 & FE_L1.Q THEN
	  		state[0] := 518;
	  	ELSIF state[0] = 404 & FE_INICIO_L1.Q THEN
	  		state[0] := 520;
	  	ELSIF state[0] = 404 & FE_FIN_L2.Q THEN
	  		state[0] := 521;
	  	ELSIF state[0] = 405 & FE_L2.Q THEN
	  		state[0] := 522;
	  	ELSIF state[0] = 405 & FE_FIN_L1.Q THEN
	  		state[0] := 521;
	  	ELSIF state[0] = 405 & FE_INICIO_L2.Q THEN
	  		state[0] := 523;
	  	ELSIF state[0] = 406 & FE_AZUL.Q THEN
	  		state[0] := 524;
	  	ELSIF state[0] = 406 & FE_VERDE.Q THEN
	  		state[0] := 525;
	  	ELSIF state[0] = 406 & FE_INICIO_L1.Q THEN
	  		state[0] := 522;
	  	ELSIF state[0] = 406 & FE_INICIO_L2.Q THEN
	  		state[0] := 526;
	  	ELSIF state[0] = 407 & FE_L2.Q THEN
	  		state[0] := 526;
	  	ELSIF state[0] = 407 & FE_INICIO_L1.Q THEN
	  		state[0] := 523;
	  	ELSIF state[0] = 407 & FE_FIN_L2.Q THEN
	  		state[0] := 527;
	  	ELSIF state[0] = 408 & FE_DESC_A.Q THEN
	  		state[0] := 519;
	  	ELSIF state[0] = 408 & FE_INICIO_L1.Q THEN
	  		state[0] := 528;
	  	ELSIF state[0] = 408 & FE_INICIO_L2.Q THEN
	  		state[0] := 529;
	  	ELSIF state[0] = 409 & FE_DESC_A.Q THEN
	  		state[0] := 520;
	  	ELSIF state[0] = 409 & FE_FIN_L1.Q THEN
	  		state[0] := 529;
	  	ELSIF state[0] = 409 & FE_FIN_L2.Q THEN
	  		state[0] := 530;
	  	ELSIF state[0] = 410 & FE_DESC_A.Q THEN
	  		state[0] := 521;
	  	ELSIF state[0] = 410 & FE_INICIO_L1.Q THEN
	  		state[0] := 530;
	  	ELSIF state[0] = 410 & FE_INICIO_L2.Q THEN
	  		state[0] := 531;
	  	ELSIF state[0] = 411 & FE_DESC_A.Q THEN
	  		state[0] := 523;
	  	ELSIF state[0] = 411 & FE_FIN_L1.Q THEN
	  		state[0] := 531;
	  	ELSIF state[0] = 411 & FE_FIN_L2.Q THEN
	  		state[0] := 532;
	  	ELSIF state[0] = 412 & FE_DESC_A.Q THEN
	  		state[0] := 527;
	  	ELSIF state[0] = 412 & FE_INICIO_L1.Q THEN
	  		state[0] := 532;
	  	ELSIF state[0] = 412 & FE_INICIO_L2.Q THEN
	  		state[0] := 533;
	  	ELSIF state[0] = 413 & FE_GIRO_A.Q THEN
	  		state[0] := 528;
	  	ELSIF state[0] = 413 & FE_INICIO_L2.Q THEN
	  		state[0] := 534;
	  	ELSIF state[0] = 414 & FE_GIRO_A.Q THEN
	  		state[0] := 529;
	  	ELSIF state[0] = 414 & FE_INICIO_L1.Q THEN
	  		state[0] := 534;
	  	ELSIF state[0] = 414 & FE_FIN_L2.Q THEN
	  		state[0] := 535;
	  	ELSIF state[0] = 415 & FE_GIRO_A.Q THEN
	  		state[0] := 530;
	  	ELSIF state[0] = 415 & FE_FIN_L1.Q THEN
	  		state[0] := 535;
	  	ELSIF state[0] = 415 & FE_INICIO_L2.Q THEN
	  		state[0] := 536;
	  	ELSIF state[0] = 416 & FE_GIRO_A.Q THEN
	  		state[0] := 531;
	  	ELSIF state[0] = 416 & FE_INICIO_L1.Q THEN
	  		state[0] := 536;
	  	ELSIF state[0] = 416 & FE_FIN_L2.Q THEN
	  		state[0] := 537;
	  	ELSIF state[0] = 417 & FE_GIRO_A.Q THEN
	  		state[0] := 532;
	  	ELSIF state[0] = 417 & FE_FIN_L1.Q THEN
	  		state[0] := 537;
	  	ELSIF state[0] = 417 & FE_INICIO_L2.Q THEN
	  		state[0] := 538;
	  	ELSIF state[0] = 418 & FE_GIRO_A.Q THEN
	  		state[0] := 533;
	  	ELSIF state[0] = 418 & FE_INICIO_L1.Q THEN
	  		state[0] := 538;
	  	ELSIF state[0] = 419 & FE_FIN_L2.Q THEN
	  		state[0] := 539;
	  	ELSIF state[0] = 420 & FE_INICIO_L1.Q THEN
	  		state[0] := 539;
	  	ELSIF state[0] = 420 & FE_INICIO_L2.Q THEN
	  		state[0] := 540;
	  	ELSIF state[0] = 421 & FE_FIN_L1.Q THEN
	  		state[0] := 540;
	  	ELSIF state[0] = 421 & FE_FIN_L2.Q THEN
	  		state[0] := 541;
	  	ELSIF state[0] = 422 & FE_INICIO_L1.Q THEN
	  		state[0] := 541;
	  	ELSIF state[0] = 422 & FE_INICIO_L2.Q THEN
	  		state[0] := 542;
	  	ELSIF state[0] = 423 & FE_FIN_L1.Q THEN
	  		state[0] := 542;
	  	ELSIF state[0] = 424 & FE_AZUL.Q THEN
	  		state[0] := 511;
	  	ELSIF state[0] = 424 & FE_VERDE.Q THEN
	  		state[0] := 539;
	  	ELSIF state[0] = 424 & FE_INICIO_L2.Q THEN
	  		state[0] := 543;
	  	ELSIF state[0] = 425 & FE_AZUL.Q THEN
	  		state[0] := 512;
	  	ELSIF state[0] = 425 & FE_VERDE.Q THEN
	  		state[0] := 540;
	  	ELSIF state[0] = 425 & FE_INICIO_L1.Q THEN
	  		state[0] := 543;
	  	ELSIF state[0] = 425 & FE_FIN_L2.Q THEN
	  		state[0] := 544;
	  	ELSIF state[0] = 426 & FE_AZUL.Q THEN
	  		state[0] := 513;
	  	ELSIF state[0] = 426 & FE_VERDE.Q THEN
	  		state[0] := 541;
	  	ELSIF state[0] = 426 & FE_FIN_L1.Q THEN
	  		state[0] := 544;
	  	ELSIF state[0] = 426 & FE_INICIO_L2.Q THEN
	  		state[0] := 545;
	  	ELSIF state[0] = 427 & FE_AZUL.Q THEN
	  		state[0] := 514;
	  	ELSIF state[0] = 427 & FE_VERDE.Q THEN
	  		state[0] := 542;
	  	ELSIF state[0] = 427 & FE_INICIO_L1.Q THEN
	  		state[0] := 545;
	  	ELSIF state[0] = 428 & FE_GIRO_A.Q THEN
	  		state[0] := 546;
	  	ELSIF state[0] = 428 & FE_INICIO_L2.Q THEN
	  		state[0] := 547;
	  	ELSIF state[0] = 429 & FE_GIRO_R.Q THEN
	  		state[0] := 548;
	  	ELSIF state[0] = 429 & FE_INICIO_L2.Q THEN
	  		state[0] := 549;
	  	ELSIF state[0] = 430 & FE_FIN_L2.Q THEN
	  		state[0] := 550;
	  	ELSIF state[0] = 431 & FE_GIRO_A.Q THEN
	  		state[0] := 551;
	  	ELSIF state[0] = 431 & FE_INICIO_L2.Q THEN
	  		state[0] := 552;
	  	ELSIF state[0] = 432 & FE_FIN_L2.Q THEN
	  		state[0] := 553;
	  	ELSIF state[0] = 433 & FE_AZUL.Q THEN
	  		state[0] := 550;
	  	ELSIF state[0] = 433 & FE_VERDE.Q THEN
	  		state[0] := 553;
	  	ELSIF state[0] = 433 & FE_INICIO_L2.Q THEN
	  		state[0] := 554;
	  	ELSIF state[0] = 434 & FE_L1.Q THEN
	  		state[0] := 545;
	  	ELSIF state[0] = 434 & FE_L2.Q THEN
	  		state[0] := 554;
	  	ELSIF state[0] = 435 & FE_DESC_A.Q THEN
	  		state[0] := 480;
	  	ELSIF state[0] = 435 & FE_INICIO_L1.Q THEN
	  		state[0] := 546;
	  	ELSIF state[0] = 435 & FE_INICIO_L2.Q THEN
	  		state[0] := 555;
	  	ELSIF state[0] = 436 & FE_GIRO_A.Q THEN
	  		state[0] := 555;
	  	ELSIF state[0] = 436 & FE_INICIO_L1.Q THEN
	  		state[0] := 547;
	  	ELSIF state[0] = 436 & FE_FIN_L2.Q THEN
	  		state[0] := 556;
	  	ELSIF state[0] = 437 & FE_DESC_R.Q THEN
	  		state[0] := 31;
	  	ELSIF state[0] = 437 & FE_INICIO_L1.Q THEN
	  		state[0] := 548;
	  	ELSIF state[0] = 437 & FE_INICIO_L2.Q THEN
	  		state[0] := 557;
	  	ELSIF state[0] = 438 & FE_GIRO_R.Q THEN
	  		state[0] := 557;
	  	ELSIF state[0] = 438 & FE_INICIO_L1.Q THEN
	  		state[0] := 549;
	  	ELSIF state[0] = 438 & FE_FIN_L2.Q THEN
	  		state[0] := 558;
	  	ELSIF state[0] = 439 & FE_INICIO_L1.Q THEN
	  		state[0] := 550;
	  	ELSIF state[0] = 439 & FE_INICIO_L2.Q THEN
	  		state[0] := 559;
	  	ELSIF state[0] = 440 & FE_DESC_A.Q THEN
	  		state[0] := 519;
	  	ELSIF state[0] = 440 & FE_INICIO_L1.Q THEN
	  		state[0] := 551;
	  	ELSIF state[0] = 440 & FE_INICIO_L2.Q THEN
	  		state[0] := 560;
	  	ELSIF state[0] = 441 & FE_GIRO_A.Q THEN
	  		state[0] := 560;
	  	ELSIF state[0] = 441 & FE_INICIO_L1.Q THEN
	  		state[0] := 552;
	  	ELSIF state[0] = 441 & FE_FIN_L2.Q THEN
	  		state[0] := 561;
	  	ELSIF state[0] = 442 & FE_INICIO_L1.Q THEN
	  		state[0] := 553;
	  	ELSIF state[0] = 442 & FE_INICIO_L2.Q THEN
	  		state[0] := 562;
	  	ELSIF state[0] = 443 & FE_AZUL.Q THEN
	  		state[0] := 559;
	  	ELSIF state[0] = 443 & FE_VERDE.Q THEN
	  		state[0] := 562;
	  	ELSIF state[0] = 443 & FE_INICIO_L1.Q THEN
	  		state[0] := 554;
	  	ELSIF state[0] = 443 & FE_FIN_L2.Q THEN
	  		state[0] := 563;
	  	ELSIF state[0] = 444 & FE_DESC_A.Q THEN
	  		state[0] := 481;
	  	ELSIF state[0] = 444 & FE_FIN_L1.Q THEN
	  		state[0] := 555;
	  	ELSIF state[0] = 444 & FE_FIN_L2.Q THEN
	  		state[0] := 564;
	  	ELSIF state[0] = 445 & FE_GIRO_A.Q THEN
	  		state[0] := 564;
	  	ELSIF state[0] = 445 & FE_FIN_L1.Q THEN
	  		state[0] := 556;
	  	ELSIF state[0] = 445 & FE_INICIO_L2.Q THEN
	  		state[0] := 565;
	  	ELSIF state[0] = 446 & FE_DESC_R.Q THEN
	  		state[0] := 32;
	  	ELSIF state[0] = 446 & FE_FIN_L1.Q THEN
	  		state[0] := 557;
	  	ELSIF state[0] = 446 & FE_FIN_L2.Q THEN
	  		state[0] := 566;
	  	ELSIF state[0] = 447 & FE_GIRO_R.Q THEN
	  		state[0] := 566;
	  	ELSIF state[0] = 447 & FE_FIN_L1.Q THEN
	  		state[0] := 558;
	  	ELSIF state[0] = 447 & FE_INICIO_L2.Q THEN
	  		state[0] := 567;
	  	ELSIF state[0] = 448 & FE_FIN_L1.Q THEN
	  		state[0] := 559;
	  	ELSIF state[0] = 448 & FE_FIN_L2.Q THEN
	  		state[0] := 568;
	  	ELSIF state[0] = 449 & FE_DESC_A.Q THEN
	  		state[0] := 520;
	  	ELSIF state[0] = 449 & FE_FIN_L1.Q THEN
	  		state[0] := 560;
	  	ELSIF state[0] = 449 & FE_FIN_L2.Q THEN
	  		state[0] := 569;
	  	ELSIF state[0] = 450 & FE_GIRO_A.Q THEN
	  		state[0] := 569;
	  	ELSIF state[0] = 450 & FE_FIN_L1.Q THEN
	  		state[0] := 561;
	  	ELSIF state[0] = 450 & FE_INICIO_L2.Q THEN
	  		state[0] := 570;
	  	ELSIF state[0] = 451 & FE_FIN_L1.Q THEN
	  		state[0] := 562;
	  	ELSIF state[0] = 451 & FE_FIN_L2.Q THEN
	  		state[0] := 571;
	  	ELSIF state[0] = 452 & FE_AZUL.Q THEN
	  		state[0] := 568;
	  	ELSIF state[0] = 452 & FE_VERDE.Q THEN
	  		state[0] := 571;
	  	ELSIF state[0] = 452 & FE_FIN_L1.Q THEN
	  		state[0] := 563;
	  	ELSIF state[0] = 452 & FE_INICIO_L2.Q THEN
	  		state[0] := 572;
	  	ELSIF state[0] = 453 & FE_DESC_A.Q THEN
	  		state[0] := 482;
	  	ELSIF state[0] = 453 & FE_INICIO_L1.Q THEN
	  		state[0] := 564;
	  	ELSIF state[0] = 453 & FE_INICIO_L2.Q THEN
	  		state[0] := 573;
	  	ELSIF state[0] = 454 & FE_GIRO_A.Q THEN
	  		state[0] := 573;
	  	ELSIF state[0] = 454 & FE_INICIO_L1.Q THEN
	  		state[0] := 565;
	  	ELSIF state[0] = 454 & FE_FIN_L2.Q THEN
	  		state[0] := 574;
	  	ELSIF state[0] = 455 & FE_DESC_R.Q THEN
	  		state[0] := 33;
	  	ELSIF state[0] = 455 & FE_INICIO_L1.Q THEN
	  		state[0] := 566;
	  	ELSIF state[0] = 455 & FE_INICIO_L2.Q THEN
	  		state[0] := 575;
	  	ELSIF state[0] = 456 & FE_GIRO_R.Q THEN
	  		state[0] := 575;
	  	ELSIF state[0] = 456 & FE_INICIO_L1.Q THEN
	  		state[0] := 567;
	  	ELSIF state[0] = 456 & FE_FIN_L2.Q THEN
	  		state[0] := 576;
	  	ELSIF state[0] = 457 & FE_INICIO_L1.Q THEN
	  		state[0] := 568;
	  	ELSIF state[0] = 457 & FE_INICIO_L2.Q THEN
	  		state[0] := 577;
	  	ELSIF state[0] = 458 & FE_DESC_A.Q THEN
	  		state[0] := 521;
	  	ELSIF state[0] = 458 & FE_INICIO_L1.Q THEN
	  		state[0] := 569;
	  	ELSIF state[0] = 458 & FE_INICIO_L2.Q THEN
	  		state[0] := 578;
	  	ELSIF state[0] = 459 & FE_GIRO_A.Q THEN
	  		state[0] := 578;
	  	ELSIF state[0] = 459 & FE_INICIO_L1.Q THEN
	  		state[0] := 570;
	  	ELSIF state[0] = 459 & FE_FIN_L2.Q THEN
	  		state[0] := 579;
	  	ELSIF state[0] = 460 & FE_INICIO_L1.Q THEN
	  		state[0] := 571;
	  	ELSIF state[0] = 460 & FE_INICIO_L2.Q THEN
	  		state[0] := 580;
	  	ELSIF state[0] = 461 & FE_AZUL.Q THEN
	  		state[0] := 577;
	  	ELSIF state[0] = 461 & FE_VERDE.Q THEN
	  		state[0] := 580;
	  	ELSIF state[0] = 461 & FE_INICIO_L1.Q THEN
	  		state[0] := 572;
	  	ELSIF state[0] = 462 & FE_DESC_A.Q THEN
	  		state[0] := 484;
	  	ELSIF state[0] = 462 & FE_FIN_L1.Q THEN
	  		state[0] := 573;
	  	ELSIF state[0] = 462 & FE_FIN_L2.Q THEN
	  		state[0] := 581;
	  	ELSIF state[0] = 463 & FE_GIRO_A.Q THEN
	  		state[0] := 581;
	  	ELSIF state[0] = 463 & FE_FIN_L1.Q THEN
	  		state[0] := 574;
	  	ELSIF state[0] = 463 & FE_INICIO_L2.Q THEN
	  		state[0] := 582;
	  	ELSIF state[0] = 464 & FE_DESC_R.Q THEN
	  		state[0] := 35;
	  	ELSIF state[0] = 464 & FE_FIN_L1.Q THEN
	  		state[0] := 575;
	  	ELSIF state[0] = 464 & FE_FIN_L2.Q THEN
	  		state[0] := 583;
	  	ELSIF state[0] = 465 & FE_GIRO_R.Q THEN
	  		state[0] := 583;
	  	ELSIF state[0] = 465 & FE_FIN_L1.Q THEN
	  		state[0] := 576;
	  	ELSIF state[0] = 465 & FE_INICIO_L2.Q THEN
	  		state[0] := 584;
	  	ELSIF state[0] = 466 & FE_FIN_L1.Q THEN
	  		state[0] := 577;
	  	ELSIF state[0] = 467 & FE_DESC_A.Q THEN
	  		state[0] := 523;
	  	ELSIF state[0] = 467 & FE_FIN_L1.Q THEN
	  		state[0] := 578;
	  	ELSIF state[0] = 467 & FE_FIN_L2.Q THEN
	  		state[0] := 585;
	  	ELSIF state[0] = 468 & FE_GIRO_A.Q THEN
	  		state[0] := 585;
	  	ELSIF state[0] = 468 & FE_FIN_L1.Q THEN
	  		state[0] := 579;
	  	ELSIF state[0] = 468 & FE_INICIO_L2.Q THEN
	  		state[0] := 586;
	  	ELSIF state[0] = 469 & FE_FIN_L1.Q THEN
	  		state[0] := 580;
	  	ELSIF state[0] = 470 & FE_DESC_A.Q THEN
	  		state[0] := 488;
	  	ELSIF state[0] = 470 & FE_INICIO_L1.Q THEN
	  		state[0] := 581;
	  	ELSIF state[0] = 470 & FE_INICIO_L2.Q THEN
	  		state[0] := 587;
	  	ELSIF state[0] = 471 & FE_GIRO_A.Q THEN
	  		state[0] := 587;
	  	ELSIF state[0] = 471 & FE_INICIO_L1.Q THEN
	  		state[0] := 582;
	  	ELSIF state[0] = 472 & FE_DESC_R.Q THEN
	  		state[0] := 39;
	  	ELSIF state[0] = 472 & FE_INICIO_L1.Q THEN
	  		state[0] := 583;
	  	ELSIF state[0] = 472 & FE_INICIO_L2.Q THEN
	  		state[0] := 588;
	  	ELSIF state[0] = 473 & FE_GIRO_R.Q THEN
	  		state[0] := 588;
	  	ELSIF state[0] = 473 & FE_INICIO_L1.Q THEN
	  		state[0] := 584;
	  	ELSIF state[0] = 474 & FE_DESC_A.Q THEN
	  		state[0] := 527;
	  	ELSIF state[0] = 474 & FE_INICIO_L1.Q THEN
	  		state[0] := 585;
	  	ELSIF state[0] = 474 & FE_INICIO_L2.Q THEN
	  		state[0] := 589;
	  	ELSIF state[0] = 475 & FE_GIRO_A.Q THEN
	  		state[0] := 589;
	  	ELSIF state[0] = 475 & FE_INICIO_L1.Q THEN
	  		state[0] := 586;
	  	ELSIF state[0] = 476 & FE_INICIO_L1.Q THEN
	  		state[0] := 591;
	  	ELSIF state[0] = 476 & FE_INICIO_L2.Q THEN
	  		state[0] := 592;
	  	ELSIF state[0] = 477 & FE_INICIO_L1.Q THEN
	  		state[0] := 593;
	  	ELSIF state[0] = 477 & FE_INICIO_L2.Q THEN
	  		state[0] := 594;
	  	ELSIF state[0] = 478 & FE_AZUL.Q THEN
	  		state[0] := 591;
	  	ELSIF state[0] = 478 & FE_VERDE.Q THEN
	  		state[0] := 593;
	  	ELSIF state[0] = 478 & FE_FIN_L1.Q THEN
	  		state[0] := 595;
	  	ELSIF state[0] = 478 & FE_INICIO_L2.Q THEN
	  		state[0] := 596;
	  	ELSIF state[0] = 479 & FE_AZUL.Q THEN
	  		state[0] := 592;
	  	ELSIF state[0] = 479 & FE_VERDE.Q THEN
	  		state[0] := 594;
	  	ELSIF state[0] = 479 & FE_INICIO_L1.Q THEN
	  		state[0] := 596;
	  	ELSIF state[0] = 479 & FE_FIN_L2.Q THEN
	  		state[0] := 597;
	  	ELSIF state[0] = 480 & FE_L1.Q THEN
	  		state[0] := 595;
	  	ELSIF state[0] = 480 & FE_INICIO_L1.Q THEN
	  		state[0] := 598;
	  	ELSIF state[0] = 480 & FE_INICIO_L2.Q THEN
	  		state[0] := 599;
	  	ELSIF state[0] = 481 & FE_L1.Q THEN
	  		state[0] := 596;
	  	ELSIF state[0] = 481 & FE_FIN_L1.Q THEN
	  		state[0] := 599;
	  	ELSIF state[0] = 481 & FE_FIN_L2.Q THEN
	  		state[0] := 600;
	  	ELSIF state[0] = 482 & FE_L1.Q THEN
	  		state[0] := 597;
	  	ELSIF state[0] = 482 & FE_L2.Q THEN
	  		state[0] := 601;
	  	ELSIF state[0] = 482 & FE_INICIO_L1.Q THEN
	  		state[0] := 600;
	  	ELSIF state[0] = 482 & FE_INICIO_L2.Q THEN
	  		state[0] := 602;
	  	ELSIF state[0] = 483 & FE_AZUL.Q THEN
	  		state[0] := 603;
	  	ELSIF state[0] = 483 & FE_VERDE.Q THEN
	  		state[0] := 604;
	  	ELSIF state[0] = 483 & FE_FIN_L1.Q THEN
	  		state[0] := 601;
	  	ELSIF state[0] = 483 & FE_INICIO_L2.Q THEN
	  		state[0] := 605;
	  	ELSIF state[0] = 484 & FE_L2.Q THEN
	  		state[0] := 605;
	  	ELSIF state[0] = 484 & FE_FIN_L1.Q THEN
	  		state[0] := 602;
	  	ELSIF state[0] = 484 & FE_FIN_L2.Q THEN
	  		state[0] := 606;
	  	ELSIF state[0] = 485 & FE_INICIO_L1.Q THEN
	  		state[0] := 603;
	  	ELSIF state[0] = 485 & FE_INICIO_L2.Q THEN
	  		state[0] := 608;
	  	ELSIF state[0] = 486 & FE_INICIO_L1.Q THEN
	  		state[0] := 604;
	  	ELSIF state[0] = 486 & FE_INICIO_L2.Q THEN
	  		state[0] := 609;
	  	ELSIF state[0] = 487 & FE_AZUL.Q THEN
	  		state[0] := 608;
	  	ELSIF state[0] = 487 & FE_VERDE.Q THEN
	  		state[0] := 609;
	  	ELSIF state[0] = 487 & FE_INICIO_L1.Q THEN
	  		state[0] := 605;
	  	ELSIF state[0] = 487 & FE_FIN_L2.Q THEN
	  		state[0] := 610;
	  	ELSIF state[0] = 488 & FE_L2.Q THEN
	  		state[0] := 610;
	  	ELSIF state[0] = 488 & FE_INICIO_L1.Q THEN
	  		state[0] := 606;
	  	ELSIF state[0] = 488 & FE_INICIO_L2.Q THEN
	  		state[0] := 611;
	  	ELSIF state[0] = 489 & FE_DESC_A.Q THEN
	  		state[0] := 598;
	  	ELSIF state[0] = 489 & FE_INICIO_L2.Q THEN
	  		state[0] := 612;
	  	ELSIF state[0] = 490 & FE_DESC_A.Q THEN
	  		state[0] := 599;
	  	ELSIF state[0] = 490 & FE_INICIO_L1.Q THEN
	  		state[0] := 612;
	  	ELSIF state[0] = 490 & FE_FIN_L2.Q THEN
	  		state[0] := 613;
	  	ELSIF state[0] = 491 & FE_DESC_A.Q THEN
	  		state[0] := 600;
	  	ELSIF state[0] = 491 & FE_FIN_L1.Q THEN
	  		state[0] := 613;
	  	ELSIF state[0] = 491 & FE_INICIO_L2.Q THEN
	  		state[0] := 614;
	  	ELSIF state[0] = 492 & FE_DESC_A.Q THEN
	  		state[0] := 602;
	  	ELSIF state[0] = 492 & FE_INICIO_L1.Q THEN
	  		state[0] := 614;
	  	ELSIF state[0] = 492 & FE_FIN_L2.Q THEN
	  		state[0] := 615;
	  	ELSIF state[0] = 493 & FE_DESC_A.Q THEN
	  		state[0] := 606;
	  	ELSIF state[0] = 493 & FE_FIN_L1.Q THEN
	  		state[0] := 615;
	  	ELSIF state[0] = 493 & FE_INICIO_L2.Q THEN
	  		state[0] := 616;
	  	ELSIF state[0] = 494 & FE_DESC_A.Q THEN
	  		state[0] := 611;
	  	ELSIF state[0] = 494 & FE_INICIO_L1.Q THEN
	  		state[0] := 616;
	  	ELSIF state[0] = 495 & FE_GIRO_A.Q THEN
	  		state[0] := 612;
	  	ELSIF state[0] = 495 & FE_FIN_L2.Q THEN
	  		state[0] := 617;
	  	ELSIF state[0] = 496 & FE_GIRO_A.Q THEN
	  		state[0] := 613;
	  	ELSIF state[0] = 496 & FE_INICIO_L1.Q THEN
	  		state[0] := 617;
	  	ELSIF state[0] = 496 & FE_INICIO_L2.Q THEN
	  		state[0] := 618;
	  	ELSIF state[0] = 497 & FE_GIRO_A.Q THEN
	  		state[0] := 614;
	  	ELSIF state[0] = 497 & FE_FIN_L1.Q THEN
	  		state[0] := 618;
	  	ELSIF state[0] = 497 & FE_FIN_L2.Q THEN
	  		state[0] := 619;
	  	ELSIF state[0] = 498 & FE_GIRO_A.Q THEN
	  		state[0] := 615;
	  	ELSIF state[0] = 498 & FE_INICIO_L1.Q THEN
	  		state[0] := 619;
	  	ELSIF state[0] = 498 & FE_INICIO_L2.Q THEN
	  		state[0] := 620;
	  	ELSIF state[0] = 499 & FE_GIRO_A.Q THEN
	  		state[0] := 616;
	  	ELSIF state[0] = 499 & FE_FIN_L1.Q THEN
	  		state[0] := 620;
	  	ELSIF state[0] = 500 & FE_DESC_R.Q THEN
	  		state[0] := 56;
	  	ELSIF state[0] = 500 & FE_INICIO_L2.Q THEN
	  		state[0] := 621;
	  	ELSIF state[0] = 501 & FE_DESC_R.Q THEN
	  		state[0] := 57;
	  	ELSIF state[0] = 501 & FE_INICIO_L1.Q THEN
	  		state[0] := 621;
	  	ELSIF state[0] = 501 & FE_FIN_L2.Q THEN
	  		state[0] := 622;
	  	ELSIF state[0] = 502 & FE_DESC_R.Q THEN
	  		state[0] := 58;
	  	ELSIF state[0] = 502 & FE_FIN_L1.Q THEN
	  		state[0] := 622;
	  	ELSIF state[0] = 502 & FE_INICIO_L2.Q THEN
	  		state[0] := 623;
	  	ELSIF state[0] = 503 & FE_DESC_R.Q THEN
	  		state[0] := 60;
	  	ELSIF state[0] = 503 & FE_INICIO_L1.Q THEN
	  		state[0] := 623;
	  	ELSIF state[0] = 503 & FE_FIN_L2.Q THEN
	  		state[0] := 624;
	  	ELSIF state[0] = 504 & FE_DESC_R.Q THEN
	  		state[0] := 64;
	  	ELSIF state[0] = 504 & FE_FIN_L1.Q THEN
	  		state[0] := 624;
	  	ELSIF state[0] = 504 & FE_INICIO_L2.Q THEN
	  		state[0] := 625;
	  	ELSIF state[0] = 505 & FE_DESC_R.Q THEN
	  		state[0] := 71;
	  	ELSIF state[0] = 505 & FE_INICIO_L1.Q THEN
	  		state[0] := 625;
	  	ELSIF state[0] = 506 & FE_GIRO_R.Q THEN
	  		state[0] := 621;
	  	ELSIF state[0] = 506 & FE_FIN_L2.Q THEN
	  		state[0] := 626;
	  	ELSIF state[0] = 507 & FE_GIRO_R.Q THEN
	  		state[0] := 622;
	  	ELSIF state[0] = 507 & FE_INICIO_L1.Q THEN
	  		state[0] := 626;
	  	ELSIF state[0] = 507 & FE_INICIO_L2.Q THEN
	  		state[0] := 627;
	  	ELSIF state[0] = 508 & FE_GIRO_R.Q THEN
	  		state[0] := 623;
	  	ELSIF state[0] = 508 & FE_FIN_L1.Q THEN
	  		state[0] := 627;
	  	ELSIF state[0] = 508 & FE_FIN_L2.Q THEN
	  		state[0] := 628;
	  	ELSIF state[0] = 509 & FE_GIRO_R.Q THEN
	  		state[0] := 624;
	  	ELSIF state[0] = 509 & FE_INICIO_L1.Q THEN
	  		state[0] := 628;
	  	ELSIF state[0] = 509 & FE_INICIO_L2.Q THEN
	  		state[0] := 629;
	  	ELSIF state[0] = 510 & FE_GIRO_R.Q THEN
	  		state[0] := 625;
	  	ELSIF state[0] = 510 & FE_FIN_L1.Q THEN
	  		state[0] := 629;
	  	ELSIF state[0] = 511 & FE_INICIO_L2.Q THEN
	  		state[0] := 630;
	  	ELSIF state[0] = 512 & FE_INICIO_L1.Q THEN
	  		state[0] := 630;
	  	ELSIF state[0] = 512 & FE_FIN_L2.Q THEN
	  		state[0] := 631;
	  	ELSIF state[0] = 513 & FE_FIN_L1.Q THEN
	  		state[0] := 631;
	  	ELSIF state[0] = 513 & FE_INICIO_L2.Q THEN
	  		state[0] := 632;
	  	ELSIF state[0] = 514 & FE_INICIO_L1.Q THEN
	  		state[0] := 632;
	  	ELSIF state[0] = 515 & FE_INICIO_L1.Q THEN
	  		state[0] := 634;
	  	ELSIF state[0] = 515 & FE_INICIO_L2.Q THEN
	  		state[0] := 635;
	  	ELSIF state[0] = 516 & FE_INICIO_L1.Q THEN
	  		state[0] := 636;
	  	ELSIF state[0] = 516 & FE_INICIO_L2.Q THEN
	  		state[0] := 637;
	  	ELSIF state[0] = 517 & FE_AZUL.Q THEN
	  		state[0] := 634;
	  	ELSIF state[0] = 517 & FE_VERDE.Q THEN
	  		state[0] := 636;
	  	ELSIF state[0] = 517 & FE_FIN_L1.Q THEN
	  		state[0] := 638;
	  	ELSIF state[0] = 517 & FE_INICIO_L2.Q THEN
	  		state[0] := 639;
	  	ELSIF state[0] = 518 & FE_AZUL.Q THEN
	  		state[0] := 635;
	  	ELSIF state[0] = 518 & FE_VERDE.Q THEN
	  		state[0] := 637;
	  	ELSIF state[0] = 518 & FE_INICIO_L1.Q THEN
	  		state[0] := 639;
	  	ELSIF state[0] = 518 & FE_FIN_L2.Q THEN
	  		state[0] := 640;
	  	ELSIF state[0] = 519 & FE_L1.Q THEN
	  		state[0] := 638;
	  	ELSIF state[0] = 519 & FE_INICIO_L1.Q THEN
	  		state[0] := 641;
	  	ELSIF state[0] = 519 & FE_INICIO_L2.Q THEN
	  		state[0] := 642;
	  	ELSIF state[0] = 520 & FE_L1.Q THEN
	  		state[0] := 639;
	  	ELSIF state[0] = 520 & FE_FIN_L1.Q THEN
	  		state[0] := 642;
	  	ELSIF state[0] = 520 & FE_FIN_L2.Q THEN
	  		state[0] := 643;
	  	ELSIF state[0] = 521 & FE_L1.Q THEN
	  		state[0] := 640;
	  	ELSIF state[0] = 521 & FE_L2.Q THEN
	  		state[0] := 644;
	  	ELSIF state[0] = 521 & FE_INICIO_L1.Q THEN
	  		state[0] := 643;
	  	ELSIF state[0] = 521 & FE_INICIO_L2.Q THEN
	  		state[0] := 645;
	  	ELSIF state[0] = 522 & FE_AZUL.Q THEN
	  		state[0] := 646;
	  	ELSIF state[0] = 522 & FE_VERDE.Q THEN
	  		state[0] := 647;
	  	ELSIF state[0] = 522 & FE_FIN_L1.Q THEN
	  		state[0] := 644;
	  	ELSIF state[0] = 522 & FE_INICIO_L2.Q THEN
	  		state[0] := 648;
	  	ELSIF state[0] = 523 & FE_L2.Q THEN
	  		state[0] := 648;
	  	ELSIF state[0] = 523 & FE_FIN_L1.Q THEN
	  		state[0] := 645;
	  	ELSIF state[0] = 523 & FE_FIN_L2.Q THEN
	  		state[0] := 649;
	  	ELSIF state[0] = 524 & FE_INICIO_L1.Q THEN
	  		state[0] := 646;
	  	ELSIF state[0] = 524 & FE_INICIO_L2.Q THEN
	  		state[0] := 651;
	  	ELSIF state[0] = 525 & FE_INICIO_L1.Q THEN
	  		state[0] := 647;
	  	ELSIF state[0] = 525 & FE_INICIO_L2.Q THEN
	  		state[0] := 652;
	  	ELSIF state[0] = 526 & FE_AZUL.Q THEN
	  		state[0] := 651;
	  	ELSIF state[0] = 526 & FE_VERDE.Q THEN
	  		state[0] := 652;
	  	ELSIF state[0] = 526 & FE_INICIO_L1.Q THEN
	  		state[0] := 648;
	  	ELSIF state[0] = 526 & FE_FIN_L2.Q THEN
	  		state[0] := 653;
	  	ELSIF state[0] = 527 & FE_L2.Q THEN
	  		state[0] := 653;
	  	ELSIF state[0] = 527 & FE_INICIO_L1.Q THEN
	  		state[0] := 649;
	  	ELSIF state[0] = 527 & FE_INICIO_L2.Q THEN
	  		state[0] := 654;
	  	ELSIF state[0] = 528 & FE_DESC_A.Q THEN
	  		state[0] := 641;
	  	ELSIF state[0] = 528 & FE_INICIO_L2.Q THEN
	  		state[0] := 655;
	  	ELSIF state[0] = 529 & FE_DESC_A.Q THEN
	  		state[0] := 642;
	  	ELSIF state[0] = 529 & FE_INICIO_L1.Q THEN
	  		state[0] := 655;
	  	ELSIF state[0] = 529 & FE_FIN_L2.Q THEN
	  		state[0] := 656;
	  	ELSIF state[0] = 530 & FE_DESC_A.Q THEN
	  		state[0] := 643;
	  	ELSIF state[0] = 530 & FE_FIN_L1.Q THEN
	  		state[0] := 656;
	  	ELSIF state[0] = 530 & FE_INICIO_L2.Q THEN
	  		state[0] := 657;
	  	ELSIF state[0] = 531 & FE_DESC_A.Q THEN
	  		state[0] := 645;
	  	ELSIF state[0] = 531 & FE_INICIO_L1.Q THEN
	  		state[0] := 657;
	  	ELSIF state[0] = 531 & FE_FIN_L2.Q THEN
	  		state[0] := 658;
	  	ELSIF state[0] = 532 & FE_DESC_A.Q THEN
	  		state[0] := 649;
	  	ELSIF state[0] = 532 & FE_FIN_L1.Q THEN
	  		state[0] := 658;
	  	ELSIF state[0] = 532 & FE_INICIO_L2.Q THEN
	  		state[0] := 659;
	  	ELSIF state[0] = 533 & FE_DESC_A.Q THEN
	  		state[0] := 654;
	  	ELSIF state[0] = 533 & FE_INICIO_L1.Q THEN
	  		state[0] := 659;
	  	ELSIF state[0] = 534 & FE_GIRO_A.Q THEN
	  		state[0] := 655;
	  	ELSIF state[0] = 534 & FE_FIN_L2.Q THEN
	  		state[0] := 660;
	  	ELSIF state[0] = 535 & FE_GIRO_A.Q THEN
	  		state[0] := 656;
	  	ELSIF state[0] = 535 & FE_INICIO_L1.Q THEN
	  		state[0] := 660;
	  	ELSIF state[0] = 535 & FE_INICIO_L2.Q THEN
	  		state[0] := 661;
	  	ELSIF state[0] = 536 & FE_GIRO_A.Q THEN
	  		state[0] := 657;
	  	ELSIF state[0] = 536 & FE_FIN_L1.Q THEN
	  		state[0] := 661;
	  	ELSIF state[0] = 536 & FE_FIN_L2.Q THEN
	  		state[0] := 662;
	  	ELSIF state[0] = 537 & FE_GIRO_A.Q THEN
	  		state[0] := 658;
	  	ELSIF state[0] = 537 & FE_INICIO_L1.Q THEN
	  		state[0] := 662;
	  	ELSIF state[0] = 537 & FE_INICIO_L2.Q THEN
	  		state[0] := 663;
	  	ELSIF state[0] = 538 & FE_GIRO_A.Q THEN
	  		state[0] := 659;
	  	ELSIF state[0] = 538 & FE_FIN_L1.Q THEN
	  		state[0] := 663;
	  	ELSIF state[0] = 539 & FE_INICIO_L2.Q THEN
	  		state[0] := 664;
	  	ELSIF state[0] = 540 & FE_INICIO_L1.Q THEN
	  		state[0] := 664;
	  	ELSIF state[0] = 540 & FE_FIN_L2.Q THEN
	  		state[0] := 665;
	  	ELSIF state[0] = 541 & FE_FIN_L1.Q THEN
	  		state[0] := 665;
	  	ELSIF state[0] = 541 & FE_INICIO_L2.Q THEN
	  		state[0] := 666;
	  	ELSIF state[0] = 542 & FE_INICIO_L1.Q THEN
	  		state[0] := 666;
	  	ELSIF state[0] = 543 & FE_AZUL.Q THEN
	  		state[0] := 630;
	  	ELSIF state[0] = 543 & FE_VERDE.Q THEN
	  		state[0] := 664;
	  	ELSIF state[0] = 543 & FE_FIN_L2.Q THEN
	  		state[0] := 667;
	  	ELSIF state[0] = 544 & FE_AZUL.Q THEN
	  		state[0] := 631;
	  	ELSIF state[0] = 544 & FE_VERDE.Q THEN
	  		state[0] := 665;
	  	ELSIF state[0] = 544 & FE_INICIO_L1.Q THEN
	  		state[0] := 667;
	  	ELSIF state[0] = 544 & FE_INICIO_L2.Q THEN
	  		state[0] := 668;
	  	ELSIF state[0] = 545 & FE_AZUL.Q THEN
	  		state[0] := 632;
	  	ELSIF state[0] = 545 & FE_VERDE.Q THEN
	  		state[0] := 666;
	  	ELSIF state[0] = 545 & FE_FIN_L1.Q THEN
	  		state[0] := 668;
	  	ELSIF state[0] = 546 & FE_DESC_A.Q THEN
	  		state[0] := 598;
	  	ELSIF state[0] = 546 & FE_INICIO_L2.Q THEN
	  		state[0] := 669;
	  	ELSIF state[0] = 547 & FE_GIRO_A.Q THEN
	  		state[0] := 669;
	  	ELSIF state[0] = 547 & FE_FIN_L2.Q THEN
	  		state[0] := 670;
	  	ELSIF state[0] = 548 & FE_DESC_R.Q THEN
	  		state[0] := 56;
	  	ELSIF state[0] = 548 & FE_INICIO_L2.Q THEN
	  		state[0] := 671;
	  	ELSIF state[0] = 549 & FE_GIRO_R.Q THEN
	  		state[0] := 671;
	  	ELSIF state[0] = 549 & FE_FIN_L2.Q THEN
	  		state[0] := 672;
	  	ELSIF state[0] = 550 & FE_INICIO_L2.Q THEN
	  		state[0] := 673;
	  	ELSIF state[0] = 551 & FE_DESC_A.Q THEN
	  		state[0] := 641;
	  	ELSIF state[0] = 551 & FE_INICIO_L2.Q THEN
	  		state[0] := 674;
	  	ELSIF state[0] = 552 & FE_GIRO_A.Q THEN
	  		state[0] := 674;
	  	ELSIF state[0] = 552 & FE_FIN_L2.Q THEN
	  		state[0] := 675;
	  	ELSIF state[0] = 553 & FE_INICIO_L2.Q THEN
	  		state[0] := 676;
	  	ELSIF state[0] = 554 & FE_AZUL.Q THEN
	  		state[0] := 673;
	  	ELSIF state[0] = 554 & FE_VERDE.Q THEN
	  		state[0] := 676;
	  	ELSIF state[0] = 554 & FE_FIN_L2.Q THEN
	  		state[0] := 677;
	  	ELSIF state[0] = 555 & FE_DESC_A.Q THEN
	  		state[0] := 599;
	  	ELSIF state[0] = 555 & FE_INICIO_L1.Q THEN
	  		state[0] := 669;
	  	ELSIF state[0] = 555 & FE_FIN_L2.Q THEN
	  		state[0] := 678;
	  	ELSIF state[0] = 556 & FE_GIRO_A.Q THEN
	  		state[0] := 678;
	  	ELSIF state[0] = 556 & FE_INICIO_L1.Q THEN
	  		state[0] := 670;
	  	ELSIF state[0] = 556 & FE_INICIO_L2.Q THEN
	  		state[0] := 679;
	  	ELSIF state[0] = 557 & FE_DESC_R.Q THEN
	  		state[0] := 57;
	  	ELSIF state[0] = 557 & FE_INICIO_L1.Q THEN
	  		state[0] := 671;
	  	ELSIF state[0] = 557 & FE_FIN_L2.Q THEN
	  		state[0] := 680;
	  	ELSIF state[0] = 558 & FE_GIRO_R.Q THEN
	  		state[0] := 680;
	  	ELSIF state[0] = 558 & FE_INICIO_L1.Q THEN
	  		state[0] := 672;
	  	ELSIF state[0] = 558 & FE_INICIO_L2.Q THEN
	  		state[0] := 681;
	  	ELSIF state[0] = 559 & FE_INICIO_L1.Q THEN
	  		state[0] := 673;
	  	ELSIF state[0] = 559 & FE_FIN_L2.Q THEN
	  		state[0] := 682;
	  	ELSIF state[0] = 560 & FE_DESC_A.Q THEN
	  		state[0] := 642;
	  	ELSIF state[0] = 560 & FE_INICIO_L1.Q THEN
	  		state[0] := 674;
	  	ELSIF state[0] = 560 & FE_FIN_L2.Q THEN
	  		state[0] := 683;
	  	ELSIF state[0] = 561 & FE_GIRO_A.Q THEN
	  		state[0] := 683;
	  	ELSIF state[0] = 561 & FE_INICIO_L1.Q THEN
	  		state[0] := 675;
	  	ELSIF state[0] = 561 & FE_INICIO_L2.Q THEN
	  		state[0] := 684;
	  	ELSIF state[0] = 562 & FE_INICIO_L1.Q THEN
	  		state[0] := 676;
	  	ELSIF state[0] = 562 & FE_FIN_L2.Q THEN
	  		state[0] := 685;
	  	ELSIF state[0] = 563 & FE_AZUL.Q THEN
	  		state[0] := 682;
	  	ELSIF state[0] = 563 & FE_VERDE.Q THEN
	  		state[0] := 685;
	  	ELSIF state[0] = 563 & FE_INICIO_L1.Q THEN
	  		state[0] := 677;
	  	ELSIF state[0] = 563 & FE_INICIO_L2.Q THEN
	  		state[0] := 686;
	  	ELSIF state[0] = 564 & FE_DESC_A.Q THEN
	  		state[0] := 600;
	  	ELSIF state[0] = 564 & FE_FIN_L1.Q THEN
	  		state[0] := 678;
	  	ELSIF state[0] = 564 & FE_INICIO_L2.Q THEN
	  		state[0] := 687;
	  	ELSIF state[0] = 565 & FE_GIRO_A.Q THEN
	  		state[0] := 687;
	  	ELSIF state[0] = 565 & FE_FIN_L1.Q THEN
	  		state[0] := 679;
	  	ELSIF state[0] = 565 & FE_FIN_L2.Q THEN
	  		state[0] := 688;
	  	ELSIF state[0] = 566 & FE_DESC_R.Q THEN
	  		state[0] := 58;
	  	ELSIF state[0] = 566 & FE_FIN_L1.Q THEN
	  		state[0] := 680;
	  	ELSIF state[0] = 566 & FE_INICIO_L2.Q THEN
	  		state[0] := 689;
	  	ELSIF state[0] = 567 & FE_GIRO_R.Q THEN
	  		state[0] := 689;
	  	ELSIF state[0] = 567 & FE_FIN_L1.Q THEN
	  		state[0] := 681;
	  	ELSIF state[0] = 567 & FE_FIN_L2.Q THEN
	  		state[0] := 690;
	  	ELSIF state[0] = 568 & FE_FIN_L1.Q THEN
	  		state[0] := 682;
	  	ELSIF state[0] = 568 & FE_INICIO_L2.Q THEN
	  		state[0] := 691;
	  	ELSIF state[0] = 569 & FE_DESC_A.Q THEN
	  		state[0] := 643;
	  	ELSIF state[0] = 569 & FE_FIN_L1.Q THEN
	  		state[0] := 683;
	  	ELSIF state[0] = 569 & FE_INICIO_L2.Q THEN
	  		state[0] := 692;
	  	ELSIF state[0] = 570 & FE_GIRO_A.Q THEN
	  		state[0] := 692;
	  	ELSIF state[0] = 570 & FE_FIN_L1.Q THEN
	  		state[0] := 684;
	  	ELSIF state[0] = 570 & FE_FIN_L2.Q THEN
	  		state[0] := 693;
	  	ELSIF state[0] = 571 & FE_FIN_L1.Q THEN
	  		state[0] := 685;
	  	ELSIF state[0] = 571 & FE_INICIO_L2.Q THEN
	  		state[0] := 694;
	  	ELSIF state[0] = 572 & FE_AZUL.Q THEN
	  		state[0] := 691;
	  	ELSIF state[0] = 572 & FE_VERDE.Q THEN
	  		state[0] := 694;
	  	ELSIF state[0] = 572 & FE_FIN_L1.Q THEN
	  		state[0] := 686;
	  	ELSIF state[0] = 573 & FE_DESC_A.Q THEN
	  		state[0] := 602;
	  	ELSIF state[0] = 573 & FE_INICIO_L1.Q THEN
	  		state[0] := 687;
	  	ELSIF state[0] = 573 & FE_FIN_L2.Q THEN
	  		state[0] := 695;
	  	ELSIF state[0] = 574 & FE_GIRO_A.Q THEN
	  		state[0] := 695;
	  	ELSIF state[0] = 574 & FE_INICIO_L1.Q THEN
	  		state[0] := 688;
	  	ELSIF state[0] = 574 & FE_INICIO_L2.Q THEN
	  		state[0] := 696;
	  	ELSIF state[0] = 575 & FE_DESC_R.Q THEN
	  		state[0] := 60;
	  	ELSIF state[0] = 575 & FE_INICIO_L1.Q THEN
	  		state[0] := 689;
	  	ELSIF state[0] = 575 & FE_FIN_L2.Q THEN
	  		state[0] := 697;
	  	ELSIF state[0] = 576 & FE_GIRO_R.Q THEN
	  		state[0] := 697;
	  	ELSIF state[0] = 576 & FE_INICIO_L1.Q THEN
	  		state[0] := 690;
	  	ELSIF state[0] = 576 & FE_INICIO_L2.Q THEN
	  		state[0] := 698;
	  	ELSIF state[0] = 577 & FE_INICIO_L1.Q THEN
	  		state[0] := 691;
	  	ELSIF state[0] = 578 & FE_DESC_A.Q THEN
	  		state[0] := 645;
	  	ELSIF state[0] = 578 & FE_INICIO_L1.Q THEN
	  		state[0] := 692;
	  	ELSIF state[0] = 578 & FE_FIN_L2.Q THEN
	  		state[0] := 699;
	  	ELSIF state[0] = 579 & FE_GIRO_A.Q THEN
	  		state[0] := 699;
	  	ELSIF state[0] = 579 & FE_INICIO_L1.Q THEN
	  		state[0] := 693;
	  	ELSIF state[0] = 579 & FE_INICIO_L2.Q THEN
	  		state[0] := 700;
	  	ELSIF state[0] = 580 & FE_INICIO_L1.Q THEN
	  		state[0] := 694;
	  	ELSIF state[0] = 581 & FE_DESC_A.Q THEN
	  		state[0] := 606;
	  	ELSIF state[0] = 581 & FE_FIN_L1.Q THEN
	  		state[0] := 695;
	  	ELSIF state[0] = 581 & FE_INICIO_L2.Q THEN
	  		state[0] := 701;
	  	ELSIF state[0] = 582 & FE_GIRO_A.Q THEN
	  		state[0] := 701;
	  	ELSIF state[0] = 582 & FE_FIN_L1.Q THEN
	  		state[0] := 696;
	  	ELSIF state[0] = 583 & FE_DESC_R.Q THEN
	  		state[0] := 64;
	  	ELSIF state[0] = 583 & FE_FIN_L1.Q THEN
	  		state[0] := 697;
	  	ELSIF state[0] = 583 & FE_INICIO_L2.Q THEN
	  		state[0] := 702;
	  	ELSIF state[0] = 584 & FE_GIRO_R.Q THEN
	  		state[0] := 702;
	  	ELSIF state[0] = 584 & FE_FIN_L1.Q THEN
	  		state[0] := 698;
	  	ELSIF state[0] = 585 & FE_DESC_A.Q THEN
	  		state[0] := 649;
	  	ELSIF state[0] = 585 & FE_FIN_L1.Q THEN
	  		state[0] := 699;
	  	ELSIF state[0] = 585 & FE_INICIO_L2.Q THEN
	  		state[0] := 703;
	  	ELSIF state[0] = 586 & FE_GIRO_A.Q THEN
	  		state[0] := 703;
	  	ELSIF state[0] = 586 & FE_FIN_L1.Q THEN
	  		state[0] := 700;
	  	ELSIF state[0] = 587 & FE_DESC_A.Q THEN
	  		state[0] := 611;
	  	ELSIF state[0] = 587 & FE_INICIO_L1.Q THEN
	  		state[0] := 701;
	  	ELSIF state[0] = 588 & FE_DESC_R.Q THEN
	  		state[0] := 71;
	  	ELSIF state[0] = 588 & FE_INICIO_L1.Q THEN
	  		state[0] := 702;
	  	ELSIF state[0] = 589 & FE_DESC_A.Q THEN
	  		state[0] := 654;
	  	ELSIF state[0] = 589 & FE_INICIO_L1.Q THEN
	  		state[0] := 703;
	  	ELSIF state[0] = 590 & FE_GIRO_R.Q THEN
	  		state[0] := 704;
	  	ELSIF state[0] = 590 & FE_INICIO_L1.Q THEN
	  		state[0] := 705;
	  	ELSIF state[0] = 590 & FE_INICIO_L2.Q THEN
	  		state[0] := 706;
	  	ELSIF state[0] = 591 & FE_FIN_L1.Q THEN
	  		state[0] := 707;
	  	ELSIF state[0] = 591 & FE_INICIO_L2.Q THEN
	  		state[0] := 708;
	  	ELSIF state[0] = 592 & FE_INICIO_L1.Q THEN
	  		state[0] := 708;
	  	ELSIF state[0] = 592 & FE_FIN_L2.Q THEN
	  		state[0] := 709;
	  	ELSIF state[0] = 593 & FE_FIN_L1.Q THEN
	  		state[0] := 710;
	  	ELSIF state[0] = 593 & FE_INICIO_L2.Q THEN
	  		state[0] := 711;
	  	ELSIF state[0] = 594 & FE_INICIO_L1.Q THEN
	  		state[0] := 711;
	  	ELSIF state[0] = 594 & FE_FIN_L2.Q THEN
	  		state[0] := 712;
	  	ELSIF state[0] = 595 & FE_AZUL.Q THEN
	  		state[0] := 707;
	  	ELSIF state[0] = 595 & FE_VERDE.Q THEN
	  		state[0] := 710;
	  	ELSIF state[0] = 595 & FE_INICIO_L1.Q THEN
	  		state[0] := 713;
	  	ELSIF state[0] = 595 & FE_INICIO_L2.Q THEN
	  		state[0] := 714;
	  	ELSIF state[0] = 596 & FE_AZUL.Q THEN
	  		state[0] := 708;
	  	ELSIF state[0] = 596 & FE_VERDE.Q THEN
	  		state[0] := 711;
	  	ELSIF state[0] = 596 & FE_FIN_L1.Q THEN
	  		state[0] := 714;
	  	ELSIF state[0] = 596 & FE_FIN_L2.Q THEN
	  		state[0] := 715;
	  	ELSIF state[0] = 597 & FE_AZUL.Q THEN
	  		state[0] := 709;
	  	ELSIF state[0] = 597 & FE_VERDE.Q THEN
	  		state[0] := 712;
	  	ELSIF state[0] = 597 & FE_INICIO_L1.Q THEN
	  		state[0] := 715;
	  	ELSIF state[0] = 597 & FE_INICIO_L2.Q THEN
	  		state[0] := 716;
	  	ELSIF state[0] = 598 & FE_L1.Q THEN
	  		state[0] := 713;
	  	ELSIF state[0] = 598 & FE_INICIO_L2.Q THEN
	  		state[0] := 717;
	  	ELSIF state[0] = 599 & FE_L1.Q THEN
	  		state[0] := 714;
	  	ELSIF state[0] = 599 & FE_INICIO_L1.Q THEN
	  		state[0] := 717;
	  	ELSIF state[0] = 599 & FE_FIN_L2.Q THEN
	  		state[0] := 718;
	  	ELSIF state[0] = 600 & FE_L1.Q THEN
	  		state[0] := 715;
	  	ELSIF state[0] = 600 & FE_L2.Q THEN
	  		state[0] := 719;
	  	ELSIF state[0] = 600 & FE_FIN_L1.Q THEN
	  		state[0] := 718;
	  	ELSIF state[0] = 600 & FE_INICIO_L2.Q THEN
	  		state[0] := 720;
	  	ELSIF state[0] = 601 & FE_AZUL.Q THEN
	  		state[0] := 721;
	  	ELSIF state[0] = 601 & FE_VERDE.Q THEN
	  		state[0] := 722;
	  	ELSIF state[0] = 601 & FE_INICIO_L1.Q THEN
	  		state[0] := 719;
	  	ELSIF state[0] = 601 & FE_INICIO_L2.Q THEN
	  		state[0] := 723;
	  	ELSIF state[0] = 602 & FE_L1.Q THEN
	  		state[0] := 716;
	  	ELSIF state[0] = 602 & FE_L2.Q THEN
	  		state[0] := 723;
	  	ELSIF state[0] = 602 & FE_INICIO_L1.Q THEN
	  		state[0] := 720;
	  	ELSIF state[0] = 602 & FE_FIN_L2.Q THEN
	  		state[0] := 724;
	  	ELSIF state[0] = 603 & FE_FIN_L1.Q THEN
	  		state[0] := 721;
	  	ELSIF state[0] = 603 & FE_INICIO_L2.Q THEN
	  		state[0] := 726;
	  	ELSIF state[0] = 604 & FE_FIN_L1.Q THEN
	  		state[0] := 722;
	  	ELSIF state[0] = 604 & FE_INICIO_L2.Q THEN
	  		state[0] := 727;
	  	ELSIF state[0] = 605 & FE_AZUL.Q THEN
	  		state[0] := 726;
	  	ELSIF state[0] = 605 & FE_VERDE.Q THEN
	  		state[0] := 727;
	  	ELSIF state[0] = 605 & FE_FIN_L1.Q THEN
	  		state[0] := 723;
	  	ELSIF state[0] = 605 & FE_FIN_L2.Q THEN
	  		state[0] := 728;
	  	ELSIF state[0] = 606 & FE_L2.Q THEN
	  		state[0] := 728;
	  	ELSIF state[0] = 606 & FE_FIN_L1.Q THEN
	  		state[0] := 724;
	  	ELSIF state[0] = 606 & FE_INICIO_L2.Q THEN
	  		state[0] := 729;
	  	ELSIF state[0] = 607 & FE_GIRO_R.Q THEN
	  		state[0] := 730;
	  	ELSIF state[0] = 607 & FE_INICIO_L1.Q THEN
	  		state[0] := 725;
	  	ELSIF state[0] = 607 & FE_INICIO_L2.Q THEN
	  		state[0] := 731;
	  	ELSIF state[0] = 608 & FE_INICIO_L1.Q THEN
	  		state[0] := 726;
	  	ELSIF state[0] = 608 & FE_FIN_L2.Q THEN
	  		state[0] := 732;
	  	ELSIF state[0] = 609 & FE_INICIO_L1.Q THEN
	  		state[0] := 727;
	  	ELSIF state[0] = 609 & FE_FIN_L2.Q THEN
	  		state[0] := 733;
	  	ELSIF state[0] = 610 & FE_AZUL.Q THEN
	  		state[0] := 732;
	  	ELSIF state[0] = 610 & FE_VERDE.Q THEN
	  		state[0] := 733;
	  	ELSIF state[0] = 610 & FE_INICIO_L1.Q THEN
	  		state[0] := 728;
	  	ELSIF state[0] = 610 & FE_INICIO_L2.Q THEN
	  		state[0] := 734;
	  	ELSIF state[0] = 611 & FE_L2.Q THEN
	  		state[0] := 734;
	  	ELSIF state[0] = 611 & FE_INICIO_L1.Q THEN
	  		state[0] := 729;
	  	ELSIF state[0] = 612 & FE_DESC_A.Q THEN
	  		state[0] := 717;
	  	ELSIF state[0] = 612 & FE_FIN_L2.Q THEN
	  		state[0] := 735;
	  	ELSIF state[0] = 613 & FE_DESC_A.Q THEN
	  		state[0] := 718;
	  	ELSIF state[0] = 613 & FE_INICIO_L1.Q THEN
	  		state[0] := 735;
	  	ELSIF state[0] = 613 & FE_INICIO_L2.Q THEN
	  		state[0] := 736;
	  	ELSIF state[0] = 614 & FE_DESC_A.Q THEN
	  		state[0] := 720;
	  	ELSIF state[0] = 614 & FE_FIN_L1.Q THEN
	  		state[0] := 736;
	  	ELSIF state[0] = 614 & FE_FIN_L2.Q THEN
	  		state[0] := 737;
	  	ELSIF state[0] = 615 & FE_DESC_A.Q THEN
	  		state[0] := 724;
	  	ELSIF state[0] = 615 & FE_INICIO_L1.Q THEN
	  		state[0] := 737;
	  	ELSIF state[0] = 615 & FE_INICIO_L2.Q THEN
	  		state[0] := 738;
	  	ELSIF state[0] = 616 & FE_DESC_A.Q THEN
	  		state[0] := 729;
	  	ELSIF state[0] = 616 & FE_FIN_L1.Q THEN
	  		state[0] := 738;
	  	ELSIF state[0] = 617 & FE_GIRO_A.Q THEN
	  		state[0] := 735;
	  	ELSIF state[0] = 617 & FE_INICIO_L2.Q THEN
	  		state[0] := 739;
	  	ELSIF state[0] = 618 & FE_GIRO_A.Q THEN
	  		state[0] := 736;
	  	ELSIF state[0] = 618 & FE_INICIO_L1.Q THEN
	  		state[0] := 739;
	  	ELSIF state[0] = 618 & FE_FIN_L2.Q THEN
	  		state[0] := 740;
	  	ELSIF state[0] = 619 & FE_GIRO_A.Q THEN
	  		state[0] := 737;
	  	ELSIF state[0] = 619 & FE_FIN_L1.Q THEN
	  		state[0] := 740;
	  	ELSIF state[0] = 619 & FE_INICIO_L2.Q THEN
	  		state[0] := 741;
	  	ELSIF state[0] = 620 & FE_GIRO_A.Q THEN
	  		state[0] := 738;
	  	ELSIF state[0] = 620 & FE_INICIO_L1.Q THEN
	  		state[0] := 741;
	  	ELSIF state[0] = 621 & FE_DESC_R.Q THEN
	  		state[0] := 96;
	  	ELSIF state[0] = 621 & FE_FIN_L2.Q THEN
	  		state[0] := 742;
	  	ELSIF state[0] = 622 & FE_DESC_R.Q THEN
	  		state[0] := 97;
	  	ELSIF state[0] = 622 & FE_INICIO_L1.Q THEN
	  		state[0] := 742;
	  	ELSIF state[0] = 622 & FE_INICIO_L2.Q THEN
	  		state[0] := 743;
	  	ELSIF state[0] = 623 & FE_DESC_R.Q THEN
	  		state[0] := 99;
	  	ELSIF state[0] = 623 & FE_FIN_L1.Q THEN
	  		state[0] := 743;
	  	ELSIF state[0] = 623 & FE_FIN_L2.Q THEN
	  		state[0] := 744;
	  	ELSIF state[0] = 624 & FE_DESC_R.Q THEN
	  		state[0] := 103;
	  	ELSIF state[0] = 624 & FE_INICIO_L1.Q THEN
	  		state[0] := 744;
	  	ELSIF state[0] = 624 & FE_INICIO_L2.Q THEN
	  		state[0] := 745;
	  	ELSIF state[0] = 625 & FE_DESC_R.Q THEN
	  		state[0] := 110;
	  	ELSIF state[0] = 625 & FE_FIN_L1.Q THEN
	  		state[0] := 745;
	  	ELSIF state[0] = 626 & FE_GIRO_R.Q THEN
	  		state[0] := 742;
	  	ELSIF state[0] = 626 & FE_INICIO_L2.Q THEN
	  		state[0] := 746;
	  	ELSIF state[0] = 627 & FE_GIRO_R.Q THEN
	  		state[0] := 743;
	  	ELSIF state[0] = 627 & FE_INICIO_L1.Q THEN
	  		state[0] := 746;
	  	ELSIF state[0] = 627 & FE_FIN_L2.Q THEN
	  		state[0] := 747;
	  	ELSIF state[0] = 628 & FE_GIRO_R.Q THEN
	  		state[0] := 744;
	  	ELSIF state[0] = 628 & FE_FIN_L1.Q THEN
	  		state[0] := 747;
	  	ELSIF state[0] = 628 & FE_INICIO_L2.Q THEN
	  		state[0] := 748;
	  	ELSIF state[0] = 629 & FE_GIRO_R.Q THEN
	  		state[0] := 745;
	  	ELSIF state[0] = 629 & FE_INICIO_L1.Q THEN
	  		state[0] := 748;
	  	ELSIF state[0] = 630 & FE_FIN_L2.Q THEN
	  		state[0] := 749;
	  	ELSIF state[0] = 631 & FE_INICIO_L1.Q THEN
	  		state[0] := 749;
	  	ELSIF state[0] = 631 & FE_INICIO_L2.Q THEN
	  		state[0] := 750;
	  	ELSIF state[0] = 632 & FE_FIN_L1.Q THEN
	  		state[0] := 750;
	  	ELSIF state[0] = 633 & FE_GIRO_R.Q THEN
	  		state[0] := 751;
	  	ELSIF state[0] = 633 & FE_INICIO_L1.Q THEN
	  		state[0] := 752;
	  	ELSIF state[0] = 633 & FE_INICIO_L2.Q THEN
	  		state[0] := 753;
	  	ELSIF state[0] = 634 & FE_FIN_L1.Q THEN
	  		state[0] := 754;
	  	ELSIF state[0] = 634 & FE_INICIO_L2.Q THEN
	  		state[0] := 755;
	  	ELSIF state[0] = 635 & FE_INICIO_L1.Q THEN
	  		state[0] := 755;
	  	ELSIF state[0] = 635 & FE_FIN_L2.Q THEN
	  		state[0] := 756;
	  	ELSIF state[0] = 636 & FE_FIN_L1.Q THEN
	  		state[0] := 757;
	  	ELSIF state[0] = 636 & FE_INICIO_L2.Q THEN
	  		state[0] := 758;
	  	ELSIF state[0] = 637 & FE_INICIO_L1.Q THEN
	  		state[0] := 758;
	  	ELSIF state[0] = 637 & FE_FIN_L2.Q THEN
	  		state[0] := 759;
	  	ELSIF state[0] = 638 & FE_AZUL.Q THEN
	  		state[0] := 754;
	  	ELSIF state[0] = 638 & FE_VERDE.Q THEN
	  		state[0] := 757;
	  	ELSIF state[0] = 638 & FE_INICIO_L1.Q THEN
	  		state[0] := 760;
	  	ELSIF state[0] = 638 & FE_INICIO_L2.Q THEN
	  		state[0] := 761;
	  	ELSIF state[0] = 639 & FE_AZUL.Q THEN
	  		state[0] := 755;
	  	ELSIF state[0] = 639 & FE_VERDE.Q THEN
	  		state[0] := 758;
	  	ELSIF state[0] = 639 & FE_FIN_L1.Q THEN
	  		state[0] := 761;
	  	ELSIF state[0] = 639 & FE_FIN_L2.Q THEN
	  		state[0] := 762;
	  	ELSIF state[0] = 640 & FE_AZUL.Q THEN
	  		state[0] := 756;
	  	ELSIF state[0] = 640 & FE_VERDE.Q THEN
	  		state[0] := 759;
	  	ELSIF state[0] = 640 & FE_INICIO_L1.Q THEN
	  		state[0] := 762;
	  	ELSIF state[0] = 640 & FE_INICIO_L2.Q THEN
	  		state[0] := 763;
	  	ELSIF state[0] = 641 & FE_L1.Q THEN
	  		state[0] := 760;
	  	ELSIF state[0] = 641 & FE_INICIO_L2.Q THEN
	  		state[0] := 764;
	  	ELSIF state[0] = 642 & FE_L1.Q THEN
	  		state[0] := 761;
	  	ELSIF state[0] = 642 & FE_INICIO_L1.Q THEN
	  		state[0] := 764;
	  	ELSIF state[0] = 642 & FE_FIN_L2.Q THEN
	  		state[0] := 765;
	  	ELSIF state[0] = 643 & FE_L1.Q THEN
	  		state[0] := 762;
	  	ELSIF state[0] = 643 & FE_L2.Q THEN
	  		state[0] := 766;
	  	ELSIF state[0] = 643 & FE_FIN_L1.Q THEN
	  		state[0] := 765;
	  	ELSIF state[0] = 643 & FE_INICIO_L2.Q THEN
	  		state[0] := 767;
	  	ELSIF state[0] = 644 & FE_AZUL.Q THEN
	  		state[0] := 768;
	  	ELSIF state[0] = 644 & FE_VERDE.Q THEN
	  		state[0] := 769;
	  	ELSIF state[0] = 644 & FE_INICIO_L1.Q THEN
	  		state[0] := 766;
	  	ELSIF state[0] = 644 & FE_INICIO_L2.Q THEN
	  		state[0] := 770;
	  	ELSIF state[0] = 645 & FE_L1.Q THEN
	  		state[0] := 763;
	  	ELSIF state[0] = 645 & FE_L2.Q THEN
	  		state[0] := 770;
	  	ELSIF state[0] = 645 & FE_INICIO_L1.Q THEN
	  		state[0] := 767;
	  	ELSIF state[0] = 645 & FE_FIN_L2.Q THEN
	  		state[0] := 771;
	  	ELSIF state[0] = 646 & FE_FIN_L1.Q THEN
	  		state[0] := 768;
	  	ELSIF state[0] = 646 & FE_INICIO_L2.Q THEN
	  		state[0] := 773;
	  	ELSIF state[0] = 647 & FE_FIN_L1.Q THEN
	  		state[0] := 769;
	  	ELSIF state[0] = 647 & FE_INICIO_L2.Q THEN
	  		state[0] := 774;
	  	ELSIF state[0] = 648 & FE_AZUL.Q THEN
	  		state[0] := 773;
	  	ELSIF state[0] = 648 & FE_VERDE.Q THEN
	  		state[0] := 774;
	  	ELSIF state[0] = 648 & FE_FIN_L1.Q THEN
	  		state[0] := 770;
	  	ELSIF state[0] = 648 & FE_FIN_L2.Q THEN
	  		state[0] := 775;
	  	ELSIF state[0] = 649 & FE_L2.Q THEN
	  		state[0] := 775;
	  	ELSIF state[0] = 649 & FE_FIN_L1.Q THEN
	  		state[0] := 771;
	  	ELSIF state[0] = 649 & FE_INICIO_L2.Q THEN
	  		state[0] := 776;
	  	ELSIF state[0] = 650 & FE_GIRO_R.Q THEN
	  		state[0] := 777;
	  	ELSIF state[0] = 650 & FE_INICIO_L1.Q THEN
	  		state[0] := 772;
	  	ELSIF state[0] = 650 & FE_INICIO_L2.Q THEN
	  		state[0] := 778;
	  	ELSIF state[0] = 651 & FE_INICIO_L1.Q THEN
	  		state[0] := 773;
	  	ELSIF state[0] = 651 & FE_FIN_L2.Q THEN
	  		state[0] := 779;
	  	ELSIF state[0] = 652 & FE_INICIO_L1.Q THEN
	  		state[0] := 774;
	  	ELSIF state[0] = 652 & FE_FIN_L2.Q THEN
	  		state[0] := 780;
	  	ELSIF state[0] = 653 & FE_AZUL.Q THEN
	  		state[0] := 779;
	  	ELSIF state[0] = 653 & FE_VERDE.Q THEN
	  		state[0] := 780;
	  	ELSIF state[0] = 653 & FE_INICIO_L1.Q THEN
	  		state[0] := 775;
	  	ELSIF state[0] = 653 & FE_INICIO_L2.Q THEN
	  		state[0] := 781;
	  	ELSIF state[0] = 654 & FE_L2.Q THEN
	  		state[0] := 781;
	  	ELSIF state[0] = 654 & FE_INICIO_L1.Q THEN
	  		state[0] := 776;
	  	ELSIF state[0] = 655 & FE_DESC_A.Q THEN
	  		state[0] := 764;
	  	ELSIF state[0] = 655 & FE_FIN_L2.Q THEN
	  		state[0] := 782;
	  	ELSIF state[0] = 656 & FE_DESC_A.Q THEN
	  		state[0] := 765;
	  	ELSIF state[0] = 656 & FE_INICIO_L1.Q THEN
	  		state[0] := 782;
	  	ELSIF state[0] = 656 & FE_INICIO_L2.Q THEN
	  		state[0] := 783;
	  	ELSIF state[0] = 657 & FE_DESC_A.Q THEN
	  		state[0] := 767;
	  	ELSIF state[0] = 657 & FE_FIN_L1.Q THEN
	  		state[0] := 783;
	  	ELSIF state[0] = 657 & FE_FIN_L2.Q THEN
	  		state[0] := 784;
	  	ELSIF state[0] = 658 & FE_DESC_A.Q THEN
	  		state[0] := 771;
	  	ELSIF state[0] = 658 & FE_INICIO_L1.Q THEN
	  		state[0] := 784;
	  	ELSIF state[0] = 658 & FE_INICIO_L2.Q THEN
	  		state[0] := 785;
	  	ELSIF state[0] = 659 & FE_DESC_A.Q THEN
	  		state[0] := 776;
	  	ELSIF state[0] = 659 & FE_FIN_L1.Q THEN
	  		state[0] := 785;
	  	ELSIF state[0] = 660 & FE_GIRO_A.Q THEN
	  		state[0] := 782;
	  	ELSIF state[0] = 660 & FE_INICIO_L2.Q THEN
	  		state[0] := 786;
	  	ELSIF state[0] = 661 & FE_GIRO_A.Q THEN
	  		state[0] := 783;
	  	ELSIF state[0] = 661 & FE_INICIO_L1.Q THEN
	  		state[0] := 786;
	  	ELSIF state[0] = 661 & FE_FIN_L2.Q THEN
	  		state[0] := 787;
	  	ELSIF state[0] = 662 & FE_GIRO_A.Q THEN
	  		state[0] := 784;
	  	ELSIF state[0] = 662 & FE_FIN_L1.Q THEN
	  		state[0] := 787;
	  	ELSIF state[0] = 662 & FE_INICIO_L2.Q THEN
	  		state[0] := 788;
	  	ELSIF state[0] = 663 & FE_GIRO_A.Q THEN
	  		state[0] := 785;
	  	ELSIF state[0] = 663 & FE_INICIO_L1.Q THEN
	  		state[0] := 788;
	  	ELSIF state[0] = 664 & FE_FIN_L2.Q THEN
	  		state[0] := 789;
	  	ELSIF state[0] = 665 & FE_INICIO_L1.Q THEN
	  		state[0] := 789;
	  	ELSIF state[0] = 665 & FE_INICIO_L2.Q THEN
	  		state[0] := 790;
	  	ELSIF state[0] = 666 & FE_FIN_L1.Q THEN
	  		state[0] := 790;
	  	ELSIF state[0] = 667 & FE_AZUL.Q THEN
	  		state[0] := 749;
	  	ELSIF state[0] = 667 & FE_VERDE.Q THEN
	  		state[0] := 789;
	  	ELSIF state[0] = 667 & FE_INICIO_L2.Q THEN
	  		state[0] := 791;
	  	ELSIF state[0] = 668 & FE_AZUL.Q THEN
	  		state[0] := 750;
	  	ELSIF state[0] = 668 & FE_VERDE.Q THEN
	  		state[0] := 790;
	  	ELSIF state[0] = 668 & FE_INICIO_L1.Q THEN
	  		state[0] := 791;
	  	ELSIF state[0] = 669 & FE_DESC_A.Q THEN
	  		state[0] := 717;
	  	ELSIF state[0] = 669 & FE_FIN_L2.Q THEN
	  		state[0] := 792;
	  	ELSIF state[0] = 670 & FE_GIRO_A.Q THEN
	  		state[0] := 792;
	  	ELSIF state[0] = 670 & FE_INICIO_L2.Q THEN
	  		state[0] := 793;
	  	ELSIF state[0] = 671 & FE_DESC_R.Q THEN
	  		state[0] := 96;
	  	ELSIF state[0] = 671 & FE_FIN_L2.Q THEN
	  		state[0] := 794;
	  	ELSIF state[0] = 672 & FE_GIRO_R.Q THEN
	  		state[0] := 794;
	  	ELSIF state[0] = 672 & FE_INICIO_L2.Q THEN
	  		state[0] := 795;
	  	ELSIF state[0] = 673 & FE_FIN_L2.Q THEN
	  		state[0] := 796;
	  	ELSIF state[0] = 674 & FE_DESC_A.Q THEN
	  		state[0] := 764;
	  	ELSIF state[0] = 674 & FE_FIN_L2.Q THEN
	  		state[0] := 797;
	  	ELSIF state[0] = 675 & FE_GIRO_A.Q THEN
	  		state[0] := 797;
	  	ELSIF state[0] = 675 & FE_INICIO_L2.Q THEN
	  		state[0] := 798;
	  	ELSIF state[0] = 676 & FE_FIN_L2.Q THEN
	  		state[0] := 799;
	  	ELSIF state[0] = 677 & FE_AZUL.Q THEN
	  		state[0] := 796;
	  	ELSIF state[0] = 677 & FE_VERDE.Q THEN
	  		state[0] := 799;
	  	ELSIF state[0] = 677 & FE_INICIO_L2.Q THEN
	  		state[0] := 800;
	  	ELSIF state[0] = 678 & FE_DESC_A.Q THEN
	  		state[0] := 718;
	  	ELSIF state[0] = 678 & FE_INICIO_L1.Q THEN
	  		state[0] := 792;
	  	ELSIF state[0] = 678 & FE_INICIO_L2.Q THEN
	  		state[0] := 801;
	  	ELSIF state[0] = 679 & FE_GIRO_A.Q THEN
	  		state[0] := 801;
	  	ELSIF state[0] = 679 & FE_INICIO_L1.Q THEN
	  		state[0] := 793;
	  	ELSIF state[0] = 679 & FE_FIN_L2.Q THEN
	  		state[0] := 802;
	  	ELSIF state[0] = 680 & FE_DESC_R.Q THEN
	  		state[0] := 97;
	  	ELSIF state[0] = 680 & FE_INICIO_L1.Q THEN
	  		state[0] := 794;
	  	ELSIF state[0] = 680 & FE_INICIO_L2.Q THEN
	  		state[0] := 803;
	  	ELSIF state[0] = 681 & FE_GIRO_R.Q THEN
	  		state[0] := 803;
	  	ELSIF state[0] = 681 & FE_INICIO_L1.Q THEN
	  		state[0] := 795;
	  	ELSIF state[0] = 681 & FE_FIN_L2.Q THEN
	  		state[0] := 804;
	  	ELSIF state[0] = 682 & FE_INICIO_L1.Q THEN
	  		state[0] := 796;
	  	ELSIF state[0] = 682 & FE_INICIO_L2.Q THEN
	  		state[0] := 805;
	  	ELSIF state[0] = 683 & FE_DESC_A.Q THEN
	  		state[0] := 765;
	  	ELSIF state[0] = 683 & FE_INICIO_L1.Q THEN
	  		state[0] := 797;
	  	ELSIF state[0] = 683 & FE_INICIO_L2.Q THEN
	  		state[0] := 806;
	  	ELSIF state[0] = 684 & FE_GIRO_A.Q THEN
	  		state[0] := 806;
	  	ELSIF state[0] = 684 & FE_INICIO_L1.Q THEN
	  		state[0] := 798;
	  	ELSIF state[0] = 684 & FE_FIN_L2.Q THEN
	  		state[0] := 807;
	  	ELSIF state[0] = 685 & FE_INICIO_L1.Q THEN
	  		state[0] := 799;
	  	ELSIF state[0] = 685 & FE_INICIO_L2.Q THEN
	  		state[0] := 808;
	  	ELSIF state[0] = 686 & FE_AZUL.Q THEN
	  		state[0] := 805;
	  	ELSIF state[0] = 686 & FE_VERDE.Q THEN
	  		state[0] := 808;
	  	ELSIF state[0] = 686 & FE_INICIO_L1.Q THEN
	  		state[0] := 800;
	  	ELSIF state[0] = 687 & FE_DESC_A.Q THEN
	  		state[0] := 720;
	  	ELSIF state[0] = 687 & FE_FIN_L1.Q THEN
	  		state[0] := 801;
	  	ELSIF state[0] = 687 & FE_FIN_L2.Q THEN
	  		state[0] := 809;
	  	ELSIF state[0] = 688 & FE_GIRO_A.Q THEN
	  		state[0] := 809;
	  	ELSIF state[0] = 688 & FE_FIN_L1.Q THEN
	  		state[0] := 802;
	  	ELSIF state[0] = 688 & FE_INICIO_L2.Q THEN
	  		state[0] := 810;
	  	ELSIF state[0] = 689 & FE_DESC_R.Q THEN
	  		state[0] := 99;
	  	ELSIF state[0] = 689 & FE_FIN_L1.Q THEN
	  		state[0] := 803;
	  	ELSIF state[0] = 689 & FE_FIN_L2.Q THEN
	  		state[0] := 811;
	  	ELSIF state[0] = 690 & FE_GIRO_R.Q THEN
	  		state[0] := 811;
	  	ELSIF state[0] = 690 & FE_FIN_L1.Q THEN
	  		state[0] := 804;
	  	ELSIF state[0] = 690 & FE_INICIO_L2.Q THEN
	  		state[0] := 812;
	  	ELSIF state[0] = 691 & FE_FIN_L1.Q THEN
	  		state[0] := 805;
	  	ELSIF state[0] = 692 & FE_DESC_A.Q THEN
	  		state[0] := 767;
	  	ELSIF state[0] = 692 & FE_FIN_L1.Q THEN
	  		state[0] := 806;
	  	ELSIF state[0] = 692 & FE_FIN_L2.Q THEN
	  		state[0] := 813;
	  	ELSIF state[0] = 693 & FE_GIRO_A.Q THEN
	  		state[0] := 813;
	  	ELSIF state[0] = 693 & FE_FIN_L1.Q THEN
	  		state[0] := 807;
	  	ELSIF state[0] = 693 & FE_INICIO_L2.Q THEN
	  		state[0] := 814;
	  	ELSIF state[0] = 694 & FE_FIN_L1.Q THEN
	  		state[0] := 808;
	  	ELSIF state[0] = 695 & FE_DESC_A.Q THEN
	  		state[0] := 724;
	  	ELSIF state[0] = 695 & FE_INICIO_L1.Q THEN
	  		state[0] := 809;
	  	ELSIF state[0] = 695 & FE_INICIO_L2.Q THEN
	  		state[0] := 815;
	  	ELSIF state[0] = 696 & FE_GIRO_A.Q THEN
	  		state[0] := 815;
	  	ELSIF state[0] = 696 & FE_INICIO_L1.Q THEN
	  		state[0] := 810;
	  	ELSIF state[0] = 697 & FE_DESC_R.Q THEN
	  		state[0] := 103;
	  	ELSIF state[0] = 697 & FE_INICIO_L1.Q THEN
	  		state[0] := 811;
	  	ELSIF state[0] = 697 & FE_INICIO_L2.Q THEN
	  		state[0] := 816;
	  	ELSIF state[0] = 698 & FE_GIRO_R.Q THEN
	  		state[0] := 816;
	  	ELSIF state[0] = 698 & FE_INICIO_L1.Q THEN
	  		state[0] := 812;
	  	ELSIF state[0] = 699 & FE_DESC_A.Q THEN
	  		state[0] := 771;
	  	ELSIF state[0] = 699 & FE_INICIO_L1.Q THEN
	  		state[0] := 813;
	  	ELSIF state[0] = 699 & FE_INICIO_L2.Q THEN
	  		state[0] := 817;
	  	ELSIF state[0] = 700 & FE_GIRO_A.Q THEN
	  		state[0] := 817;
	  	ELSIF state[0] = 700 & FE_INICIO_L1.Q THEN
	  		state[0] := 814;
	  	ELSIF state[0] = 701 & FE_DESC_A.Q THEN
	  		state[0] := 729;
	  	ELSIF state[0] = 701 & FE_FIN_L1.Q THEN
	  		state[0] := 815;
	  	ELSIF state[0] = 702 & FE_DESC_R.Q THEN
	  		state[0] := 110;
	  	ELSIF state[0] = 702 & FE_FIN_L1.Q THEN
	  		state[0] := 816;
	  	ELSIF state[0] = 703 & FE_DESC_A.Q THEN
	  		state[0] := 776;
	  	ELSIF state[0] = 703 & FE_FIN_L1.Q THEN
	  		state[0] := 817;
	  	ELSIF state[0] = 704 & FE_DESC_R.Q THEN
	  		state[0] := 124;
	  	ELSIF state[0] = 704 & FE_INICIO_L1.Q THEN
	  		state[0] := 818;
	  	ELSIF state[0] = 704 & FE_INICIO_L2.Q THEN
	  		state[0] := 819;
	  	ELSIF state[0] = 705 & FE_GIRO_R.Q THEN
	  		state[0] := 818;
	  	ELSIF state[0] = 705 & FE_FIN_L1.Q THEN
	  		state[0] := 820;
	  	ELSIF state[0] = 705 & FE_INICIO_L2.Q THEN
	  		state[0] := 821;
	  	ELSIF state[0] = 706 & FE_GIRO_R.Q THEN
	  		state[0] := 819;
	  	ELSIF state[0] = 706 & FE_INICIO_L1.Q THEN
	  		state[0] := 821;
	  	ELSIF state[0] = 706 & FE_FIN_L2.Q THEN
	  		state[0] := 822;
	  	ELSIF state[0] = 707 & FE_INICIO_L1.Q THEN
	  		state[0] := 823;
	  	ELSIF state[0] = 707 & FE_INICIO_L2.Q THEN
	  		state[0] := 824;
	  	ELSIF state[0] = 708 & FE_FIN_L1.Q THEN
	  		state[0] := 824;
	  	ELSIF state[0] = 708 & FE_FIN_L2.Q THEN
	  		state[0] := 825;
	  	ELSIF state[0] = 709 & FE_INICIO_L1.Q THEN
	  		state[0] := 825;
	  	ELSIF state[0] = 709 & FE_INICIO_L2.Q THEN
	  		state[0] := 826;
	  	ELSIF state[0] = 710 & FE_INICIO_L1.Q THEN
	  		state[0] := 827;
	  	ELSIF state[0] = 710 & FE_INICIO_L2.Q THEN
	  		state[0] := 828;
	  	ELSIF state[0] = 711 & FE_FIN_L1.Q THEN
	  		state[0] := 828;
	  	ELSIF state[0] = 711 & FE_FIN_L2.Q THEN
	  		state[0] := 829;
	  	ELSIF state[0] = 712 & FE_INICIO_L1.Q THEN
	  		state[0] := 829;
	  	ELSIF state[0] = 712 & FE_INICIO_L2.Q THEN
	  		state[0] := 830;
	  	ELSIF state[0] = 713 & FE_AZUL.Q THEN
	  		state[0] := 823;
	  	ELSIF state[0] = 713 & FE_VERDE.Q THEN
	  		state[0] := 827;
	  	ELSIF state[0] = 713 & FE_FIN_L1.Q THEN
	  		state[0] := 831;
	  	ELSIF state[0] = 713 & FE_INICIO_L2.Q THEN
	  		state[0] := 832;
	  	ELSIF state[0] = 714 & FE_AZUL.Q THEN
	  		state[0] := 824;
	  	ELSIF state[0] = 714 & FE_VERDE.Q THEN
	  		state[0] := 828;
	  	ELSIF state[0] = 714 & FE_INICIO_L1.Q THEN
	  		state[0] := 832;
	  	ELSIF state[0] = 714 & FE_FIN_L2.Q THEN
	  		state[0] := 833;
	  	ELSIF state[0] = 715 & FE_AZUL.Q THEN
	  		state[0] := 825;
	  	ELSIF state[0] = 715 & FE_VERDE.Q THEN
	  		state[0] := 829;
	  	ELSIF state[0] = 715 & FE_FIN_L1.Q THEN
	  		state[0] := 833;
	  	ELSIF state[0] = 715 & FE_INICIO_L2.Q THEN
	  		state[0] := 834;
	  	ELSIF state[0] = 716 & FE_AZUL.Q THEN
	  		state[0] := 826;
	  	ELSIF state[0] = 716 & FE_VERDE.Q THEN
	  		state[0] := 830;
	  	ELSIF state[0] = 716 & FE_INICIO_L1.Q THEN
	  		state[0] := 834;
	  	ELSIF state[0] = 716 & FE_FIN_L2.Q THEN
	  		state[0] := 835;
	  	ELSIF state[0] = 717 & FE_L1.Q THEN
	  		state[0] := 832;
	  	ELSIF state[0] = 717 & FE_FIN_L2.Q THEN
	  		state[0] := 836;
	  	ELSIF state[0] = 718 & FE_L1.Q THEN
	  		state[0] := 833;
	  	ELSIF state[0] = 718 & FE_L2.Q THEN
	  		state[0] := 837;
	  	ELSIF state[0] = 718 & FE_INICIO_L1.Q THEN
	  		state[0] := 836;
	  	ELSIF state[0] = 718 & FE_INICIO_L2.Q THEN
	  		state[0] := 838;
	  	ELSIF state[0] = 719 & FE_AZUL.Q THEN
	  		state[0] := 839;
	  	ELSIF state[0] = 719 & FE_VERDE.Q THEN
	  		state[0] := 840;
	  	ELSIF state[0] = 719 & FE_FIN_L1.Q THEN
	  		state[0] := 837;
	  	ELSIF state[0] = 719 & FE_INICIO_L2.Q THEN
	  		state[0] := 841;
	  	ELSIF state[0] = 720 & FE_L1.Q THEN
	  		state[0] := 834;
	  	ELSIF state[0] = 720 & FE_L2.Q THEN
	  		state[0] := 841;
	  	ELSIF state[0] = 720 & FE_FIN_L1.Q THEN
	  		state[0] := 838;
	  	ELSIF state[0] = 720 & FE_FIN_L2.Q THEN
	  		state[0] := 842;
	  	ELSIF state[0] = 721 & FE_INICIO_L1.Q THEN
	  		state[0] := 839;
	  	ELSIF state[0] = 721 & FE_INICIO_L2.Q THEN
	  		state[0] := 844;
	  	ELSIF state[0] = 722 & FE_INICIO_L1.Q THEN
	  		state[0] := 840;
	  	ELSIF state[0] = 722 & FE_INICIO_L2.Q THEN
	  		state[0] := 845;
	  	ELSIF state[0] = 723 & FE_AZUL.Q THEN
	  		state[0] := 844;
	  	ELSIF state[0] = 723 & FE_VERDE.Q THEN
	  		state[0] := 845;
	  	ELSIF state[0] = 723 & FE_INICIO_L1.Q THEN
	  		state[0] := 841;
	  	ELSIF state[0] = 723 & FE_FIN_L2.Q THEN
	  		state[0] := 846;
	  	ELSIF state[0] = 724 & FE_L1.Q THEN
	  		state[0] := 835;
	  	ELSIF state[0] = 724 & FE_L2.Q THEN
	  		state[0] := 846;
	  	ELSIF state[0] = 724 & FE_INICIO_L1.Q THEN
	  		state[0] := 842;
	  	ELSIF state[0] = 724 & FE_INICIO_L2.Q THEN
	  		state[0] := 847;
	  	ELSIF state[0] = 725 & FE_GIRO_R.Q THEN
	  		state[0] := 848;
	  	ELSIF state[0] = 725 & FE_FIN_L1.Q THEN
	  		state[0] := 843;
	  	ELSIF state[0] = 725 & FE_INICIO_L2.Q THEN
	  		state[0] := 849;
	  	ELSIF state[0] = 726 & FE_FIN_L1.Q THEN
	  		state[0] := 844;
	  	ELSIF state[0] = 726 & FE_FIN_L2.Q THEN
	  		state[0] := 850;
	  	ELSIF state[0] = 727 & FE_FIN_L1.Q THEN
	  		state[0] := 845;
	  	ELSIF state[0] = 727 & FE_FIN_L2.Q THEN
	  		state[0] := 851;
	  	ELSIF state[0] = 728 & FE_AZUL.Q THEN
	  		state[0] := 850;
	  	ELSIF state[0] = 728 & FE_VERDE.Q THEN
	  		state[0] := 851;
	  	ELSIF state[0] = 728 & FE_FIN_L1.Q THEN
	  		state[0] := 846;
	  	ELSIF state[0] = 728 & FE_INICIO_L2.Q THEN
	  		state[0] := 852;
	  	ELSIF state[0] = 729 & FE_L2.Q THEN
	  		state[0] := 852;
	  	ELSIF state[0] = 729 & FE_FIN_L1.Q THEN
	  		state[0] := 847;
	  	ELSIF state[0] = 730 & FE_DESC_R.Q THEN
	  		state[0] := 124;
	  	ELSIF state[0] = 730 & FE_INICIO_L1.Q THEN
	  		state[0] := 848;
	  	ELSIF state[0] = 730 & FE_INICIO_L2.Q THEN
	  		state[0] := 853;
	  	ELSIF state[0] = 731 & FE_GIRO_R.Q THEN
	  		state[0] := 853;
	  	ELSIF state[0] = 731 & FE_INICIO_L1.Q THEN
	  		state[0] := 849;
	  	ELSIF state[0] = 731 & FE_FIN_L2.Q THEN
	  		state[0] := 854;
	  	ELSIF state[0] = 732 & FE_INICIO_L1.Q THEN
	  		state[0] := 850;
	  	ELSIF state[0] = 732 & FE_INICIO_L2.Q THEN
	  		state[0] := 855;
	  	ELSIF state[0] = 733 & FE_INICIO_L1.Q THEN
	  		state[0] := 851;
	  	ELSIF state[0] = 733 & FE_INICIO_L2.Q THEN
	  		state[0] := 856;
	  	ELSIF state[0] = 734 & FE_AZUL.Q THEN
	  		state[0] := 855;
	  	ELSIF state[0] = 734 & FE_VERDE.Q THEN
	  		state[0] := 856;
	  	ELSIF state[0] = 734 & FE_INICIO_L1.Q THEN
	  		state[0] := 852;
	  	ELSIF state[0] = 734 & FE_FIN_L2.Q THEN
	  		state[0] := 857;
	  	ELSIF state[0] = 735 & FE_DESC_A.Q THEN
	  		state[0] := 836;
	  	ELSIF state[0] = 735 & FE_INICIO_L2.Q THEN
	  		state[0] := 858;
	  	ELSIF state[0] = 736 & FE_DESC_A.Q THEN
	  		state[0] := 838;
	  	ELSIF state[0] = 736 & FE_INICIO_L1.Q THEN
	  		state[0] := 858;
	  	ELSIF state[0] = 736 & FE_FIN_L2.Q THEN
	  		state[0] := 859;
	  	ELSIF state[0] = 737 & FE_DESC_A.Q THEN
	  		state[0] := 842;
	  	ELSIF state[0] = 737 & FE_FIN_L1.Q THEN
	  		state[0] := 859;
	  	ELSIF state[0] = 737 & FE_INICIO_L2.Q THEN
	  		state[0] := 860;
	  	ELSIF state[0] = 738 & FE_DESC_A.Q THEN
	  		state[0] := 847;
	  	ELSIF state[0] = 738 & FE_INICIO_L1.Q THEN
	  		state[0] := 860;
	  	ELSIF state[0] = 739 & FE_GIRO_A.Q THEN
	  		state[0] := 858;
	  	ELSIF state[0] = 739 & FE_FIN_L2.Q THEN
	  		state[0] := 861;
	  	ELSIF state[0] = 740 & FE_GIRO_A.Q THEN
	  		state[0] := 859;
	  	ELSIF state[0] = 740 & FE_INICIO_L1.Q THEN
	  		state[0] := 861;
	  	ELSIF state[0] = 740 & FE_INICIO_L2.Q THEN
	  		state[0] := 862;
	  	ELSIF state[0] = 741 & FE_GIRO_A.Q THEN
	  		state[0] := 860;
	  	ELSIF state[0] = 741 & FE_FIN_L1.Q THEN
	  		state[0] := 862;
	  	ELSIF state[0] = 742 & FE_DESC_R.Q THEN
	  		state[0] := 154;
	  	ELSIF state[0] = 742 & FE_INICIO_L2.Q THEN
	  		state[0] := 863;
	  	ELSIF state[0] = 743 & FE_DESC_R.Q THEN
	  		state[0] := 156;
	  	ELSIF state[0] = 743 & FE_INICIO_L1.Q THEN
	  		state[0] := 863;
	  	ELSIF state[0] = 743 & FE_FIN_L2.Q THEN
	  		state[0] := 864;
	  	ELSIF state[0] = 744 & FE_DESC_R.Q THEN
	  		state[0] := 160;
	  	ELSIF state[0] = 744 & FE_FIN_L1.Q THEN
	  		state[0] := 864;
	  	ELSIF state[0] = 744 & FE_INICIO_L2.Q THEN
	  		state[0] := 865;
	  	ELSIF state[0] = 745 & FE_DESC_R.Q THEN
	  		state[0] := 167;
	  	ELSIF state[0] = 745 & FE_INICIO_L1.Q THEN
	  		state[0] := 865;
	  	ELSIF state[0] = 746 & FE_GIRO_R.Q THEN
	  		state[0] := 863;
	  	ELSIF state[0] = 746 & FE_FIN_L2.Q THEN
	  		state[0] := 866;
	  	ELSIF state[0] = 747 & FE_GIRO_R.Q THEN
	  		state[0] := 864;
	  	ELSIF state[0] = 747 & FE_INICIO_L1.Q THEN
	  		state[0] := 866;
	  	ELSIF state[0] = 747 & FE_INICIO_L2.Q THEN
	  		state[0] := 867;
	  	ELSIF state[0] = 748 & FE_GIRO_R.Q THEN
	  		state[0] := 865;
	  	ELSIF state[0] = 748 & FE_FIN_L1.Q THEN
	  		state[0] := 867;
	  	ELSIF state[0] = 749 & FE_INICIO_L2.Q THEN
	  		state[0] := 868;
	  	ELSIF state[0] = 750 & FE_INICIO_L1.Q THEN
	  		state[0] := 868;
	  	ELSIF state[0] = 751 & FE_DESC_R.Q THEN
	  		state[0] := 139;
	  	ELSIF state[0] = 751 & FE_INICIO_L1.Q THEN
	  		state[0] := 869;
	  	ELSIF state[0] = 751 & FE_INICIO_L2.Q THEN
	  		state[0] := 870;
	  	ELSIF state[0] = 752 & FE_GIRO_R.Q THEN
	  		state[0] := 869;
	  	ELSIF state[0] = 752 & FE_FIN_L1.Q THEN
	  		state[0] := 871;
	  	ELSIF state[0] = 752 & FE_INICIO_L2.Q THEN
	  		state[0] := 872;
	  	ELSIF state[0] = 753 & FE_GIRO_R.Q THEN
	  		state[0] := 870;
	  	ELSIF state[0] = 753 & FE_INICIO_L1.Q THEN
	  		state[0] := 872;
	  	ELSIF state[0] = 753 & FE_FIN_L2.Q THEN
	  		state[0] := 873;
	  	ELSIF state[0] = 754 & FE_INICIO_L1.Q THEN
	  		state[0] := 874;
	  	ELSIF state[0] = 754 & FE_INICIO_L2.Q THEN
	  		state[0] := 875;
	  	ELSIF state[0] = 755 & FE_FIN_L1.Q THEN
	  		state[0] := 875;
	  	ELSIF state[0] = 755 & FE_FIN_L2.Q THEN
	  		state[0] := 876;
	  	ELSIF state[0] = 756 & FE_INICIO_L1.Q THEN
	  		state[0] := 876;
	  	ELSIF state[0] = 756 & FE_INICIO_L2.Q THEN
	  		state[0] := 877;
	  	ELSIF state[0] = 757 & FE_INICIO_L1.Q THEN
	  		state[0] := 878;
	  	ELSIF state[0] = 757 & FE_INICIO_L2.Q THEN
	  		state[0] := 879;
	  	ELSIF state[0] = 758 & FE_FIN_L1.Q THEN
	  		state[0] := 879;
	  	ELSIF state[0] = 758 & FE_FIN_L2.Q THEN
	  		state[0] := 880;
	  	ELSIF state[0] = 759 & FE_INICIO_L1.Q THEN
	  		state[0] := 880;
	  	ELSIF state[0] = 759 & FE_INICIO_L2.Q THEN
	  		state[0] := 881;
	  	ELSIF state[0] = 760 & FE_AZUL.Q THEN
	  		state[0] := 874;
	  	ELSIF state[0] = 760 & FE_VERDE.Q THEN
	  		state[0] := 878;
	  	ELSIF state[0] = 760 & FE_FIN_L1.Q THEN
	  		state[0] := 882;
	  	ELSIF state[0] = 760 & FE_INICIO_L2.Q THEN
	  		state[0] := 883;
	  	ELSIF state[0] = 761 & FE_AZUL.Q THEN
	  		state[0] := 875;
	  	ELSIF state[0] = 761 & FE_VERDE.Q THEN
	  		state[0] := 879;
	  	ELSIF state[0] = 761 & FE_INICIO_L1.Q THEN
	  		state[0] := 883;
	  	ELSIF state[0] = 761 & FE_FIN_L2.Q THEN
	  		state[0] := 884;
	  	ELSIF state[0] = 762 & FE_AZUL.Q THEN
	  		state[0] := 876;
	  	ELSIF state[0] = 762 & FE_VERDE.Q THEN
	  		state[0] := 880;
	  	ELSIF state[0] = 762 & FE_FIN_L1.Q THEN
	  		state[0] := 884;
	  	ELSIF state[0] = 762 & FE_INICIO_L2.Q THEN
	  		state[0] := 885;
	  	ELSIF state[0] = 763 & FE_AZUL.Q THEN
	  		state[0] := 877;
	  	ELSIF state[0] = 763 & FE_VERDE.Q THEN
	  		state[0] := 881;
	  	ELSIF state[0] = 763 & FE_INICIO_L1.Q THEN
	  		state[0] := 885;
	  	ELSIF state[0] = 763 & FE_FIN_L2.Q THEN
	  		state[0] := 886;
	  	ELSIF state[0] = 764 & FE_L1.Q THEN
	  		state[0] := 883;
	  	ELSIF state[0] = 764 & FE_FIN_L2.Q THEN
	  		state[0] := 887;
	  	ELSIF state[0] = 765 & FE_L1.Q THEN
	  		state[0] := 884;
	  	ELSIF state[0] = 765 & FE_L2.Q THEN
	  		state[0] := 888;
	  	ELSIF state[0] = 765 & FE_INICIO_L1.Q THEN
	  		state[0] := 887;
	  	ELSIF state[0] = 765 & FE_INICIO_L2.Q THEN
	  		state[0] := 889;
	  	ELSIF state[0] = 766 & FE_AZUL.Q THEN
	  		state[0] := 890;
	  	ELSIF state[0] = 766 & FE_VERDE.Q THEN
	  		state[0] := 891;
	  	ELSIF state[0] = 766 & FE_FIN_L1.Q THEN
	  		state[0] := 888;
	  	ELSIF state[0] = 766 & FE_INICIO_L2.Q THEN
	  		state[0] := 892;
	  	ELSIF state[0] = 767 & FE_L1.Q THEN
	  		state[0] := 885;
	  	ELSIF state[0] = 767 & FE_L2.Q THEN
	  		state[0] := 892;
	  	ELSIF state[0] = 767 & FE_FIN_L1.Q THEN
	  		state[0] := 889;
	  	ELSIF state[0] = 767 & FE_FIN_L2.Q THEN
	  		state[0] := 893;
	  	ELSIF state[0] = 768 & FE_INICIO_L1.Q THEN
	  		state[0] := 890;
	  	ELSIF state[0] = 768 & FE_INICIO_L2.Q THEN
	  		state[0] := 895;
	  	ELSIF state[0] = 769 & FE_INICIO_L1.Q THEN
	  		state[0] := 891;
	  	ELSIF state[0] = 769 & FE_INICIO_L2.Q THEN
	  		state[0] := 896;
	  	ELSIF state[0] = 770 & FE_AZUL.Q THEN
	  		state[0] := 895;
	  	ELSIF state[0] = 770 & FE_VERDE.Q THEN
	  		state[0] := 896;
	  	ELSIF state[0] = 770 & FE_INICIO_L1.Q THEN
	  		state[0] := 892;
	  	ELSIF state[0] = 770 & FE_FIN_L2.Q THEN
	  		state[0] := 897;
	  	ELSIF state[0] = 771 & FE_L1.Q THEN
	  		state[0] := 886;
	  	ELSIF state[0] = 771 & FE_L2.Q THEN
	  		state[0] := 897;
	  	ELSIF state[0] = 771 & FE_INICIO_L1.Q THEN
	  		state[0] := 893;
	  	ELSIF state[0] = 771 & FE_INICIO_L2.Q THEN
	  		state[0] := 898;
	  	ELSIF state[0] = 772 & FE_GIRO_R.Q THEN
	  		state[0] := 899;
	  	ELSIF state[0] = 772 & FE_FIN_L1.Q THEN
	  		state[0] := 894;
	  	ELSIF state[0] = 772 & FE_INICIO_L2.Q THEN
	  		state[0] := 900;
	  	ELSIF state[0] = 773 & FE_FIN_L1.Q THEN
	  		state[0] := 895;
	  	ELSIF state[0] = 773 & FE_FIN_L2.Q THEN
	  		state[0] := 901;
	  	ELSIF state[0] = 774 & FE_FIN_L1.Q THEN
	  		state[0] := 896;
	  	ELSIF state[0] = 774 & FE_FIN_L2.Q THEN
	  		state[0] := 902;
	  	ELSIF state[0] = 775 & FE_AZUL.Q THEN
	  		state[0] := 901;
	  	ELSIF state[0] = 775 & FE_VERDE.Q THEN
	  		state[0] := 902;
	  	ELSIF state[0] = 775 & FE_FIN_L1.Q THEN
	  		state[0] := 897;
	  	ELSIF state[0] = 775 & FE_INICIO_L2.Q THEN
	  		state[0] := 903;
	  	ELSIF state[0] = 776 & FE_L2.Q THEN
	  		state[0] := 903;
	  	ELSIF state[0] = 776 & FE_FIN_L1.Q THEN
	  		state[0] := 898;
	  	ELSIF state[0] = 777 & FE_DESC_R.Q THEN
	  		state[0] := 139;
	  	ELSIF state[0] = 777 & FE_INICIO_L1.Q THEN
	  		state[0] := 899;
	  	ELSIF state[0] = 777 & FE_INICIO_L2.Q THEN
	  		state[0] := 904;
	  	ELSIF state[0] = 778 & FE_GIRO_R.Q THEN
	  		state[0] := 904;
	  	ELSIF state[0] = 778 & FE_INICIO_L1.Q THEN
	  		state[0] := 900;
	  	ELSIF state[0] = 778 & FE_FIN_L2.Q THEN
	  		state[0] := 905;
	  	ELSIF state[0] = 779 & FE_INICIO_L1.Q THEN
	  		state[0] := 901;
	  	ELSIF state[0] = 779 & FE_INICIO_L2.Q THEN
	  		state[0] := 906;
	  	ELSIF state[0] = 780 & FE_INICIO_L1.Q THEN
	  		state[0] := 902;
	  	ELSIF state[0] = 780 & FE_INICIO_L2.Q THEN
	  		state[0] := 907;
	  	ELSIF state[0] = 781 & FE_AZUL.Q THEN
	  		state[0] := 906;
	  	ELSIF state[0] = 781 & FE_VERDE.Q THEN
	  		state[0] := 907;
	  	ELSIF state[0] = 781 & FE_INICIO_L1.Q THEN
	  		state[0] := 903;
	  	ELSIF state[0] = 781 & FE_FIN_L2.Q THEN
	  		state[0] := 908;
	  	ELSIF state[0] = 782 & FE_DESC_A.Q THEN
	  		state[0] := 887;
	  	ELSIF state[0] = 782 & FE_INICIO_L2.Q THEN
	  		state[0] := 909;
	  	ELSIF state[0] = 783 & FE_DESC_A.Q THEN
	  		state[0] := 889;
	  	ELSIF state[0] = 783 & FE_INICIO_L1.Q THEN
	  		state[0] := 909;
	  	ELSIF state[0] = 783 & FE_FIN_L2.Q THEN
	  		state[0] := 910;
	  	ELSIF state[0] = 784 & FE_DESC_A.Q THEN
	  		state[0] := 893;
	  	ELSIF state[0] = 784 & FE_FIN_L1.Q THEN
	  		state[0] := 910;
	  	ELSIF state[0] = 784 & FE_INICIO_L2.Q THEN
	  		state[0] := 911;
	  	ELSIF state[0] = 785 & FE_DESC_A.Q THEN
	  		state[0] := 898;
	  	ELSIF state[0] = 785 & FE_INICIO_L1.Q THEN
	  		state[0] := 911;
	  	ELSIF state[0] = 786 & FE_GIRO_A.Q THEN
	  		state[0] := 909;
	  	ELSIF state[0] = 786 & FE_FIN_L2.Q THEN
	  		state[0] := 912;
	  	ELSIF state[0] = 787 & FE_GIRO_A.Q THEN
	  		state[0] := 910;
	  	ELSIF state[0] = 787 & FE_INICIO_L1.Q THEN
	  		state[0] := 912;
	  	ELSIF state[0] = 787 & FE_INICIO_L2.Q THEN
	  		state[0] := 913;
	  	ELSIF state[0] = 788 & FE_GIRO_A.Q THEN
	  		state[0] := 911;
	  	ELSIF state[0] = 788 & FE_FIN_L1.Q THEN
	  		state[0] := 913;
	  	ELSIF state[0] = 789 & FE_INICIO_L2.Q THEN
	  		state[0] := 914;
	  	ELSIF state[0] = 790 & FE_INICIO_L1.Q THEN
	  		state[0] := 914;
	  	ELSIF state[0] = 791 & FE_AZUL.Q THEN
	  		state[0] := 868;
	  	ELSIF state[0] = 791 & FE_VERDE.Q THEN
	  		state[0] := 914;
	  	ELSIF state[0] = 792 & FE_DESC_A.Q THEN
	  		state[0] := 836;
	  	ELSIF state[0] = 792 & FE_INICIO_L2.Q THEN
	  		state[0] := 915;
	  	ELSIF state[0] = 793 & FE_GIRO_A.Q THEN
	  		state[0] := 915;
	  	ELSIF state[0] = 793 & FE_FIN_L2.Q THEN
	  		state[0] := 916;
	  	ELSIF state[0] = 794 & FE_DESC_R.Q THEN
	  		state[0] := 154;
	  	ELSIF state[0] = 794 & FE_INICIO_L2.Q THEN
	  		state[0] := 917;
	  	ELSIF state[0] = 795 & FE_GIRO_R.Q THEN
	  		state[0] := 917;
	  	ELSIF state[0] = 795 & FE_FIN_L2.Q THEN
	  		state[0] := 918;
	  	ELSIF state[0] = 796 & FE_INICIO_L2.Q THEN
	  		state[0] := 919;
	  	ELSIF state[0] = 797 & FE_DESC_A.Q THEN
	  		state[0] := 887;
	  	ELSIF state[0] = 797 & FE_INICIO_L2.Q THEN
	  		state[0] := 920;
	  	ELSIF state[0] = 798 & FE_GIRO_A.Q THEN
	  		state[0] := 920;
	  	ELSIF state[0] = 798 & FE_FIN_L2.Q THEN
	  		state[0] := 921;
	  	ELSIF state[0] = 799 & FE_INICIO_L2.Q THEN
	  		state[0] := 922;
	  	ELSIF state[0] = 800 & FE_AZUL.Q THEN
	  		state[0] := 919;
	  	ELSIF state[0] = 800 & FE_VERDE.Q THEN
	  		state[0] := 922;
	  	ELSIF state[0] = 801 & FE_DESC_A.Q THEN
	  		state[0] := 838;
	  	ELSIF state[0] = 801 & FE_INICIO_L1.Q THEN
	  		state[0] := 915;
	  	ELSIF state[0] = 801 & FE_FIN_L2.Q THEN
	  		state[0] := 923;
	  	ELSIF state[0] = 802 & FE_GIRO_A.Q THEN
	  		state[0] := 923;
	  	ELSIF state[0] = 802 & FE_INICIO_L1.Q THEN
	  		state[0] := 916;
	  	ELSIF state[0] = 802 & FE_INICIO_L2.Q THEN
	  		state[0] := 924;
	  	ELSIF state[0] = 803 & FE_DESC_R.Q THEN
	  		state[0] := 156;
	  	ELSIF state[0] = 803 & FE_INICIO_L1.Q THEN
	  		state[0] := 917;
	  	ELSIF state[0] = 803 & FE_FIN_L2.Q THEN
	  		state[0] := 925;
	  	ELSIF state[0] = 804 & FE_GIRO_R.Q THEN
	  		state[0] := 925;
	  	ELSIF state[0] = 804 & FE_INICIO_L1.Q THEN
	  		state[0] := 918;
	  	ELSIF state[0] = 804 & FE_INICIO_L2.Q THEN
	  		state[0] := 926;
	  	ELSIF state[0] = 805 & FE_INICIO_L1.Q THEN
	  		state[0] := 919;
	  	ELSIF state[0] = 806 & FE_DESC_A.Q THEN
	  		state[0] := 889;
	  	ELSIF state[0] = 806 & FE_INICIO_L1.Q THEN
	  		state[0] := 920;
	  	ELSIF state[0] = 806 & FE_FIN_L2.Q THEN
	  		state[0] := 927;
	  	ELSIF state[0] = 807 & FE_GIRO_A.Q THEN
	  		state[0] := 927;
	  	ELSIF state[0] = 807 & FE_INICIO_L1.Q THEN
	  		state[0] := 921;
	  	ELSIF state[0] = 807 & FE_INICIO_L2.Q THEN
	  		state[0] := 928;
	  	ELSIF state[0] = 808 & FE_INICIO_L1.Q THEN
	  		state[0] := 922;
	  	ELSIF state[0] = 809 & FE_DESC_A.Q THEN
	  		state[0] := 842;
	  	ELSIF state[0] = 809 & FE_FIN_L1.Q THEN
	  		state[0] := 923;
	  	ELSIF state[0] = 809 & FE_INICIO_L2.Q THEN
	  		state[0] := 929;
	  	ELSIF state[0] = 810 & FE_GIRO_A.Q THEN
	  		state[0] := 929;
	  	ELSIF state[0] = 810 & FE_FIN_L1.Q THEN
	  		state[0] := 924;
	  	ELSIF state[0] = 811 & FE_DESC_R.Q THEN
	  		state[0] := 160;
	  	ELSIF state[0] = 811 & FE_FIN_L1.Q THEN
	  		state[0] := 925;
	  	ELSIF state[0] = 811 & FE_INICIO_L2.Q THEN
	  		state[0] := 930;
	  	ELSIF state[0] = 812 & FE_GIRO_R.Q THEN
	  		state[0] := 930;
	  	ELSIF state[0] = 812 & FE_FIN_L1.Q THEN
	  		state[0] := 926;
	  	ELSIF state[0] = 813 & FE_DESC_A.Q THEN
	  		state[0] := 893;
	  	ELSIF state[0] = 813 & FE_FIN_L1.Q THEN
	  		state[0] := 927;
	  	ELSIF state[0] = 813 & FE_INICIO_L2.Q THEN
	  		state[0] := 931;
	  	ELSIF state[0] = 814 & FE_GIRO_A.Q THEN
	  		state[0] := 931;
	  	ELSIF state[0] = 814 & FE_FIN_L1.Q THEN
	  		state[0] := 928;
	  	ELSIF state[0] = 815 & FE_DESC_A.Q THEN
	  		state[0] := 847;
	  	ELSIF state[0] = 815 & FE_INICIO_L1.Q THEN
	  		state[0] := 929;
	  	ELSIF state[0] = 816 & FE_DESC_R.Q THEN
	  		state[0] := 167;
	  	ELSIF state[0] = 816 & FE_INICIO_L1.Q THEN
	  		state[0] := 930;
	  	ELSIF state[0] = 817 & FE_DESC_A.Q THEN
	  		state[0] := 898;
	  	ELSIF state[0] = 817 & FE_INICIO_L1.Q THEN
	  		state[0] := 931;
	  	ELSIF state[0] = 818 & FE_DESC_R.Q THEN
	  		state[0] := 189;
	  	ELSIF state[0] = 818 & FE_FIN_L1.Q THEN
	  		state[0] := 932;
	  	ELSIF state[0] = 818 & FE_INICIO_L2.Q THEN
	  		state[0] := 933;
	  	ELSIF state[0] = 819 & FE_DESC_R.Q THEN
	  		state[0] := 190;
	  	ELSIF state[0] = 819 & FE_INICIO_L1.Q THEN
	  		state[0] := 933;
	  	ELSIF state[0] = 819 & FE_FIN_L2.Q THEN
	  		state[0] := 934;
	  	ELSIF state[0] = 820 & FE_GIRO_R.Q THEN
	  		state[0] := 932;
	  	ELSIF state[0] = 820 & FE_INICIO_L1.Q THEN
	  		state[0] := 935;
	  	ELSIF state[0] = 820 & FE_INICIO_L2.Q THEN
	  		state[0] := 936;
	  	ELSIF state[0] = 821 & FE_GIRO_R.Q THEN
	  		state[0] := 933;
	  	ELSIF state[0] = 821 & FE_FIN_L1.Q THEN
	  		state[0] := 936;
	  	ELSIF state[0] = 821 & FE_FIN_L2.Q THEN
	  		state[0] := 937;
	  	ELSIF state[0] = 822 & FE_GIRO_R.Q THEN
	  		state[0] := 934;
	  	ELSIF state[0] = 822 & FE_INICIO_L1.Q THEN
	  		state[0] := 937;
	  	ELSIF state[0] = 822 & FE_INICIO_L2.Q THEN
	  		state[0] := 938;
	  	ELSIF state[0] = 823 & FE_FIN_L1.Q THEN
	  		state[0] := 939;
	  	ELSIF state[0] = 823 & FE_INICIO_L2.Q THEN
	  		state[0] := 940;
	  	ELSIF state[0] = 824 & FE_INICIO_L1.Q THEN
	  		state[0] := 940;
	  	ELSIF state[0] = 824 & FE_FIN_L2.Q THEN
	  		state[0] := 941;
	  	ELSIF state[0] = 825 & FE_FIN_L1.Q THEN
	  		state[0] := 941;
	  	ELSIF state[0] = 825 & FE_INICIO_L2.Q THEN
	  		state[0] := 942;
	  	ELSIF state[0] = 826 & FE_INICIO_L1.Q THEN
	  		state[0] := 942;
	  	ELSIF state[0] = 826 & FE_FIN_L2.Q THEN
	  		state[0] := 943;
	  	ELSIF state[0] = 827 & FE_FIN_L1.Q THEN
	  		state[0] := 944;
	  	ELSIF state[0] = 827 & FE_INICIO_L2.Q THEN
	  		state[0] := 945;
	  	ELSIF state[0] = 828 & FE_INICIO_L1.Q THEN
	  		state[0] := 945;
	  	ELSIF state[0] = 828 & FE_FIN_L2.Q THEN
	  		state[0] := 946;
	  	ELSIF state[0] = 829 & FE_FIN_L1.Q THEN
	  		state[0] := 946;
	  	ELSIF state[0] = 829 & FE_INICIO_L2.Q THEN
	  		state[0] := 947;
	  	ELSIF state[0] = 830 & FE_INICIO_L1.Q THEN
	  		state[0] := 947;
	  	ELSIF state[0] = 830 & FE_FIN_L2.Q THEN
	  		state[0] := 948;
	  	ELSIF state[0] = 831 & FE_AZUL.Q THEN
	  		state[0] := 939;
	  	ELSIF state[0] = 831 & FE_VERDE.Q THEN
	  		state[0] := 944;
	  	ELSIF state[0] = 831 & FE_INICIO_L1.Q THEN
	  		state[0] := 949;
	  	ELSIF state[0] = 831 & FE_INICIO_L2.Q THEN
	  		state[0] := 950;
	  	ELSIF state[0] = 832 & FE_AZUL.Q THEN
	  		state[0] := 940;
	  	ELSIF state[0] = 832 & FE_VERDE.Q THEN
	  		state[0] := 945;
	  	ELSIF state[0] = 832 & FE_FIN_L1.Q THEN
	  		state[0] := 950;
	  	ELSIF state[0] = 832 & FE_FIN_L2.Q THEN
	  		state[0] := 951;
	  	ELSIF state[0] = 833 & FE_AZUL.Q THEN
	  		state[0] := 941;
	  	ELSIF state[0] = 833 & FE_VERDE.Q THEN
	  		state[0] := 946;
	  	ELSIF state[0] = 833 & FE_INICIO_L1.Q THEN
	  		state[0] := 951;
	  	ELSIF state[0] = 833 & FE_INICIO_L2.Q THEN
	  		state[0] := 952;
	  	ELSIF state[0] = 834 & FE_AZUL.Q THEN
	  		state[0] := 942;
	  	ELSIF state[0] = 834 & FE_VERDE.Q THEN
	  		state[0] := 947;
	  	ELSIF state[0] = 834 & FE_FIN_L1.Q THEN
	  		state[0] := 952;
	  	ELSIF state[0] = 834 & FE_FIN_L2.Q THEN
	  		state[0] := 953;
	  	ELSIF state[0] = 835 & FE_AZUL.Q THEN
	  		state[0] := 943;
	  	ELSIF state[0] = 835 & FE_VERDE.Q THEN
	  		state[0] := 948;
	  	ELSIF state[0] = 835 & FE_INICIO_L1.Q THEN
	  		state[0] := 953;
	  	ELSIF state[0] = 835 & FE_INICIO_L2.Q THEN
	  		state[0] := 954;
	  	ELSIF state[0] = 836 & FE_L1.Q THEN
	  		state[0] := 951;
	  	ELSIF state[0] = 836 & FE_L2.Q THEN
	  		state[0] := 955;
	  	ELSIF state[0] = 836 & FE_INICIO_L2.Q THEN
	  		state[0] := 956;
	  	ELSIF state[0] = 837 & FE_AZUL.Q THEN
	  		state[0] := 957;
	  	ELSIF state[0] = 837 & FE_VERDE.Q THEN
	  		state[0] := 958;
	  	ELSIF state[0] = 837 & FE_INICIO_L1.Q THEN
	  		state[0] := 955;
	  	ELSIF state[0] = 837 & FE_INICIO_L2.Q THEN
	  		state[0] := 959;
	  	ELSIF state[0] = 838 & FE_L1.Q THEN
	  		state[0] := 952;
	  	ELSIF state[0] = 838 & FE_L2.Q THEN
	  		state[0] := 959;
	  	ELSIF state[0] = 838 & FE_INICIO_L1.Q THEN
	  		state[0] := 956;
	  	ELSIF state[0] = 838 & FE_FIN_L2.Q THEN
	  		state[0] := 960;
	  	ELSIF state[0] = 839 & FE_FIN_L1.Q THEN
	  		state[0] := 957;
	  	ELSIF state[0] = 839 & FE_INICIO_L2.Q THEN
	  		state[0] := 962;
	  	ELSIF state[0] = 840 & FE_FIN_L1.Q THEN
	  		state[0] := 958;
	  	ELSIF state[0] = 840 & FE_INICIO_L2.Q THEN
	  		state[0] := 963;
	  	ELSIF state[0] = 841 & FE_AZUL.Q THEN
	  		state[0] := 962;
	  	ELSIF state[0] = 841 & FE_VERDE.Q THEN
	  		state[0] := 963;
	  	ELSIF state[0] = 841 & FE_FIN_L1.Q THEN
	  		state[0] := 959;
	  	ELSIF state[0] = 841 & FE_FIN_L2.Q THEN
	  		state[0] := 964;
	  	ELSIF state[0] = 842 & FE_L1.Q THEN
	  		state[0] := 953;
	  	ELSIF state[0] = 842 & FE_L2.Q THEN
	  		state[0] := 964;
	  	ELSIF state[0] = 842 & FE_FIN_L1.Q THEN
	  		state[0] := 960;
	  	ELSIF state[0] = 842 & FE_INICIO_L2.Q THEN
	  		state[0] := 965;
	  	ELSIF state[0] = 843 & FE_GIRO_R.Q THEN
	  		state[0] := 966;
	  	ELSIF state[0] = 843 & FE_INICIO_L1.Q THEN
	  		state[0] := 961;
	  	ELSIF state[0] = 843 & FE_INICIO_L2.Q THEN
	  		state[0] := 967;
	  	ELSIF state[0] = 844 & FE_INICIO_L1.Q THEN
	  		state[0] := 962;
	  	ELSIF state[0] = 844 & FE_FIN_L2.Q THEN
	  		state[0] := 968;
	  	ELSIF state[0] = 845 & FE_INICIO_L1.Q THEN
	  		state[0] := 963;
	  	ELSIF state[0] = 845 & FE_FIN_L2.Q THEN
	  		state[0] := 969;
	  	ELSIF state[0] = 846 & FE_AZUL.Q THEN
	  		state[0] := 968;
	  	ELSIF state[0] = 846 & FE_VERDE.Q THEN
	  		state[0] := 969;
	  	ELSIF state[0] = 846 & FE_INICIO_L1.Q THEN
	  		state[0] := 964;
	  	ELSIF state[0] = 846 & FE_INICIO_L2.Q THEN
	  		state[0] := 970;
	  	ELSIF state[0] = 847 & FE_L1.Q THEN
	  		state[0] := 954;
	  	ELSIF state[0] = 847 & FE_L2.Q THEN
	  		state[0] := 970;
	  	ELSIF state[0] = 847 & FE_INICIO_L1.Q THEN
	  		state[0] := 965;
	  	ELSIF state[0] = 848 & FE_DESC_R.Q THEN
	  		state[0] := 189;
	  	ELSIF state[0] = 848 & FE_FIN_L1.Q THEN
	  		state[0] := 966;
	  	ELSIF state[0] = 848 & FE_INICIO_L2.Q THEN
	  		state[0] := 971;
	  	ELSIF state[0] = 849 & FE_GIRO_R.Q THEN
	  		state[0] := 971;
	  	ELSIF state[0] = 849 & FE_FIN_L1.Q THEN
	  		state[0] := 967;
	  	ELSIF state[0] = 849 & FE_FIN_L2.Q THEN
	  		state[0] := 972;
	  	ELSIF state[0] = 850 & FE_FIN_L1.Q THEN
	  		state[0] := 968;
	  	ELSIF state[0] = 850 & FE_INICIO_L2.Q THEN
	  		state[0] := 973;
	  	ELSIF state[0] = 851 & FE_FIN_L1.Q THEN
	  		state[0] := 969;
	  	ELSIF state[0] = 851 & FE_INICIO_L2.Q THEN
	  		state[0] := 974;
	  	ELSIF state[0] = 852 & FE_AZUL.Q THEN
	  		state[0] := 973;
	  	ELSIF state[0] = 852 & FE_VERDE.Q THEN
	  		state[0] := 974;
	  	ELSIF state[0] = 852 & FE_FIN_L1.Q THEN
	  		state[0] := 970;
	  	ELSIF state[0] = 852 & FE_FIN_L2.Q THEN
	  		state[0] := 975;
	  	ELSIF state[0] = 853 & FE_DESC_R.Q THEN
	  		state[0] := 190;
	  	ELSIF state[0] = 853 & FE_INICIO_L1.Q THEN
	  		state[0] := 971;
	  	ELSIF state[0] = 853 & FE_FIN_L2.Q THEN
	  		state[0] := 976;
	  	ELSIF state[0] = 854 & FE_GIRO_R.Q THEN
	  		state[0] := 976;
	  	ELSIF state[0] = 854 & FE_INICIO_L1.Q THEN
	  		state[0] := 972;
	  	ELSIF state[0] = 854 & FE_INICIO_L2.Q THEN
	  		state[0] := 977;
	  	ELSIF state[0] = 855 & FE_INICIO_L1.Q THEN
	  		state[0] := 973;
	  	ELSIF state[0] = 855 & FE_FIN_L2.Q THEN
	  		state[0] := 978;
	  	ELSIF state[0] = 856 & FE_INICIO_L1.Q THEN
	  		state[0] := 974;
	  	ELSIF state[0] = 856 & FE_FIN_L2.Q THEN
	  		state[0] := 979;
	  	ELSIF state[0] = 857 & FE_AZUL.Q THEN
	  		state[0] := 978;
	  	ELSIF state[0] = 857 & FE_VERDE.Q THEN
	  		state[0] := 979;
	  	ELSIF state[0] = 857 & FE_INICIO_L1.Q THEN
	  		state[0] := 975;
	  	ELSIF state[0] = 857 & FE_INICIO_L2.Q THEN
	  		state[0] := 980;
	  	ELSIF state[0] = 858 & FE_DESC_A.Q THEN
	  		state[0] := 956;
	  	ELSIF state[0] = 858 & FE_FIN_L2.Q THEN
	  		state[0] := 981;
	  	ELSIF state[0] = 859 & FE_DESC_A.Q THEN
	  		state[0] := 960;
	  	ELSIF state[0] = 859 & FE_INICIO_L1.Q THEN
	  		state[0] := 981;
	  	ELSIF state[0] = 859 & FE_INICIO_L2.Q THEN
	  		state[0] := 982;
	  	ELSIF state[0] = 860 & FE_DESC_A.Q THEN
	  		state[0] := 965;
	  	ELSIF state[0] = 860 & FE_FIN_L1.Q THEN
	  		state[0] := 982;
	  	ELSIF state[0] = 861 & FE_GIRO_A.Q THEN
	  		state[0] := 981;
	  	ELSIF state[0] = 861 & FE_INICIO_L2.Q THEN
	  		state[0] := 983;
	  	ELSIF state[0] = 862 & FE_GIRO_A.Q THEN
	  		state[0] := 982;
	  	ELSIF state[0] = 862 & FE_INICIO_L1.Q THEN
	  		state[0] := 983;
	  	ELSIF state[0] = 863 & FE_DESC_R.Q THEN
	  		state[0] := 231;
	  	ELSIF state[0] = 863 & FE_FIN_L2.Q THEN
	  		state[0] := 984;
	  	ELSIF state[0] = 864 & FE_DESC_R.Q THEN
	  		state[0] := 235;
	  	ELSIF state[0] = 864 & FE_INICIO_L1.Q THEN
	  		state[0] := 984;
	  	ELSIF state[0] = 864 & FE_INICIO_L2.Q THEN
	  		state[0] := 985;
	  	ELSIF state[0] = 865 & FE_DESC_R.Q THEN
	  		state[0] := 242;
	  	ELSIF state[0] = 865 & FE_FIN_L1.Q THEN
	  		state[0] := 985;
	  	ELSIF state[0] = 866 & FE_GIRO_R.Q THEN
	  		state[0] := 984;
	  	ELSIF state[0] = 866 & FE_INICIO_L2.Q THEN
	  		state[0] := 986;
	  	ELSIF state[0] = 867 & FE_GIRO_R.Q THEN
	  		state[0] := 985;
	  	ELSIF state[0] = 867 & FE_INICIO_L1.Q THEN
	  		state[0] := 986;
	  	ELSIF state[0] = 869 & FE_DESC_R.Q THEN
	  		state[0] := 210;
	  	ELSIF state[0] = 869 & FE_FIN_L1.Q THEN
	  		state[0] := 987;
	  	ELSIF state[0] = 869 & FE_INICIO_L2.Q THEN
	  		state[0] := 988;
	  	ELSIF state[0] = 870 & FE_DESC_R.Q THEN
	  		state[0] := 211;
	  	ELSIF state[0] = 870 & FE_INICIO_L1.Q THEN
	  		state[0] := 988;
	  	ELSIF state[0] = 870 & FE_FIN_L2.Q THEN
	  		state[0] := 989;
	  	ELSIF state[0] = 871 & FE_GIRO_R.Q THEN
	  		state[0] := 987;
	  	ELSIF state[0] = 871 & FE_INICIO_L1.Q THEN
	  		state[0] := 990;
	  	ELSIF state[0] = 871 & FE_INICIO_L2.Q THEN
	  		state[0] := 991;
	  	ELSIF state[0] = 872 & FE_GIRO_R.Q THEN
	  		state[0] := 988;
	  	ELSIF state[0] = 872 & FE_FIN_L1.Q THEN
	  		state[0] := 991;
	  	ELSIF state[0] = 872 & FE_FIN_L2.Q THEN
	  		state[0] := 992;
	  	ELSIF state[0] = 873 & FE_GIRO_R.Q THEN
	  		state[0] := 989;
	  	ELSIF state[0] = 873 & FE_INICIO_L1.Q THEN
	  		state[0] := 992;
	  	ELSIF state[0] = 873 & FE_INICIO_L2.Q THEN
	  		state[0] := 993;
	  	ELSIF state[0] = 874 & FE_FIN_L1.Q THEN
	  		state[0] := 994;
	  	ELSIF state[0] = 874 & FE_INICIO_L2.Q THEN
	  		state[0] := 995;
	  	ELSIF state[0] = 875 & FE_INICIO_L1.Q THEN
	  		state[0] := 995;
	  	ELSIF state[0] = 875 & FE_FIN_L2.Q THEN
	  		state[0] := 996;
	  	ELSIF state[0] = 876 & FE_FIN_L1.Q THEN
	  		state[0] := 996;
	  	ELSIF state[0] = 876 & FE_INICIO_L2.Q THEN
	  		state[0] := 997;
	  	ELSIF state[0] = 877 & FE_INICIO_L1.Q THEN
	  		state[0] := 997;
	  	ELSIF state[0] = 877 & FE_FIN_L2.Q THEN
	  		state[0] := 998;
	  	ELSIF state[0] = 878 & FE_FIN_L1.Q THEN
	  		state[0] := 999;
	  	ELSIF state[0] = 878 & FE_INICIO_L2.Q THEN
	  		state[0] := 1000;
	  	ELSIF state[0] = 879 & FE_INICIO_L1.Q THEN
	  		state[0] := 1000;
	  	ELSIF state[0] = 879 & FE_FIN_L2.Q THEN
	  		state[0] := 1001;
	  	ELSIF state[0] = 880 & FE_FIN_L1.Q THEN
	  		state[0] := 1001;
	  	ELSIF state[0] = 880 & FE_INICIO_L2.Q THEN
	  		state[0] := 1002;
	  	ELSIF state[0] = 881 & FE_INICIO_L1.Q THEN
	  		state[0] := 1002;
	  	ELSIF state[0] = 881 & FE_FIN_L2.Q THEN
	  		state[0] := 1003;
	  	ELSIF state[0] = 882 & FE_AZUL.Q THEN
	  		state[0] := 994;
	  	ELSIF state[0] = 882 & FE_VERDE.Q THEN
	  		state[0] := 999;
	  	ELSIF state[0] = 882 & FE_INICIO_L1.Q THEN
	  		state[0] := 1004;
	  	ELSIF state[0] = 882 & FE_INICIO_L2.Q THEN
	  		state[0] := 1005;
	  	ELSIF state[0] = 883 & FE_AZUL.Q THEN
	  		state[0] := 995;
	  	ELSIF state[0] = 883 & FE_VERDE.Q THEN
	  		state[0] := 1000;
	  	ELSIF state[0] = 883 & FE_FIN_L1.Q THEN
	  		state[0] := 1005;
	  	ELSIF state[0] = 883 & FE_FIN_L2.Q THEN
	  		state[0] := 1006;
	  	ELSIF state[0] = 884 & FE_AZUL.Q THEN
	  		state[0] := 996;
	  	ELSIF state[0] = 884 & FE_VERDE.Q THEN
	  		state[0] := 1001;
	  	ELSIF state[0] = 884 & FE_INICIO_L1.Q THEN
	  		state[0] := 1006;
	  	ELSIF state[0] = 884 & FE_INICIO_L2.Q THEN
	  		state[0] := 1007;
	  	ELSIF state[0] = 885 & FE_AZUL.Q THEN
	  		state[0] := 997;
	  	ELSIF state[0] = 885 & FE_VERDE.Q THEN
	  		state[0] := 1002;
	  	ELSIF state[0] = 885 & FE_FIN_L1.Q THEN
	  		state[0] := 1007;
	  	ELSIF state[0] = 885 & FE_FIN_L2.Q THEN
	  		state[0] := 1008;
	  	ELSIF state[0] = 886 & FE_AZUL.Q THEN
	  		state[0] := 998;
	  	ELSIF state[0] = 886 & FE_VERDE.Q THEN
	  		state[0] := 1003;
	  	ELSIF state[0] = 886 & FE_INICIO_L1.Q THEN
	  		state[0] := 1008;
	  	ELSIF state[0] = 886 & FE_INICIO_L2.Q THEN
	  		state[0] := 1009;
	  	ELSIF state[0] = 887 & FE_L1.Q THEN
	  		state[0] := 1006;
	  	ELSIF state[0] = 887 & FE_L2.Q THEN
	  		state[0] := 1010;
	  	ELSIF state[0] = 887 & FE_INICIO_L2.Q THEN
	  		state[0] := 1011;
	  	ELSIF state[0] = 888 & FE_AZUL.Q THEN
	  		state[0] := 1012;
	  	ELSIF state[0] = 888 & FE_VERDE.Q THEN
	  		state[0] := 1013;
	  	ELSIF state[0] = 888 & FE_INICIO_L1.Q THEN
	  		state[0] := 1010;
	  	ELSIF state[0] = 888 & FE_INICIO_L2.Q THEN
	  		state[0] := 1014;
	  	ELSIF state[0] = 889 & FE_L1.Q THEN
	  		state[0] := 1007;
	  	ELSIF state[0] = 889 & FE_L2.Q THEN
	  		state[0] := 1014;
	  	ELSIF state[0] = 889 & FE_INICIO_L1.Q THEN
	  		state[0] := 1011;
	  	ELSIF state[0] = 889 & FE_FIN_L2.Q THEN
	  		state[0] := 1015;
	  	ELSIF state[0] = 890 & FE_FIN_L1.Q THEN
	  		state[0] := 1012;
	  	ELSIF state[0] = 890 & FE_INICIO_L2.Q THEN
	  		state[0] := 1017;
	  	ELSIF state[0] = 891 & FE_FIN_L1.Q THEN
	  		state[0] := 1013;
	  	ELSIF state[0] = 891 & FE_INICIO_L2.Q THEN
	  		state[0] := 1018;
	  	ELSIF state[0] = 892 & FE_AZUL.Q THEN
	  		state[0] := 1017;
	  	ELSIF state[0] = 892 & FE_VERDE.Q THEN
	  		state[0] := 1018;
	  	ELSIF state[0] = 892 & FE_FIN_L1.Q THEN
	  		state[0] := 1014;
	  	ELSIF state[0] = 892 & FE_FIN_L2.Q THEN
	  		state[0] := 1019;
	  	ELSIF state[0] = 893 & FE_L1.Q THEN
	  		state[0] := 1008;
	  	ELSIF state[0] = 893 & FE_L2.Q THEN
	  		state[0] := 1019;
	  	ELSIF state[0] = 893 & FE_FIN_L1.Q THEN
	  		state[0] := 1015;
	  	ELSIF state[0] = 893 & FE_INICIO_L2.Q THEN
	  		state[0] := 1020;
	  	ELSIF state[0] = 894 & FE_GIRO_R.Q THEN
	  		state[0] := 1021;
	  	ELSIF state[0] = 894 & FE_INICIO_L1.Q THEN
	  		state[0] := 1016;
	  	ELSIF state[0] = 894 & FE_INICIO_L2.Q THEN
	  		state[0] := 1022;
	  	ELSIF state[0] = 895 & FE_INICIO_L1.Q THEN
	  		state[0] := 1017;
	  	ELSIF state[0] = 895 & FE_FIN_L2.Q THEN
	  		state[0] := 1023;
	  	ELSIF state[0] = 896 & FE_INICIO_L1.Q THEN
	  		state[0] := 1018;
	  	ELSIF state[0] = 896 & FE_FIN_L2.Q THEN
	  		state[0] := 1024;
	  	ELSIF state[0] = 897 & FE_AZUL.Q THEN
	  		state[0] := 1023;
	  	ELSIF state[0] = 897 & FE_VERDE.Q THEN
	  		state[0] := 1024;
	  	ELSIF state[0] = 897 & FE_INICIO_L1.Q THEN
	  		state[0] := 1019;
	  	ELSIF state[0] = 897 & FE_INICIO_L2.Q THEN
	  		state[0] := 1025;
	  	ELSIF state[0] = 898 & FE_L1.Q THEN
	  		state[0] := 1009;
	  	ELSIF state[0] = 898 & FE_L2.Q THEN
	  		state[0] := 1025;
	  	ELSIF state[0] = 898 & FE_INICIO_L1.Q THEN
	  		state[0] := 1020;
	  	ELSIF state[0] = 899 & FE_DESC_R.Q THEN
	  		state[0] := 210;
	  	ELSIF state[0] = 899 & FE_FIN_L1.Q THEN
	  		state[0] := 1021;
	  	ELSIF state[0] = 899 & FE_INICIO_L2.Q THEN
	  		state[0] := 1026;
	  	ELSIF state[0] = 900 & FE_GIRO_R.Q THEN
	  		state[0] := 1026;
	  	ELSIF state[0] = 900 & FE_FIN_L1.Q THEN
	  		state[0] := 1022;
	  	ELSIF state[0] = 900 & FE_FIN_L2.Q THEN
	  		state[0] := 1027;
	  	ELSIF state[0] = 901 & FE_FIN_L1.Q THEN
	  		state[0] := 1023;
	  	ELSIF state[0] = 901 & FE_INICIO_L2.Q THEN
	  		state[0] := 1028;
	  	ELSIF state[0] = 902 & FE_FIN_L1.Q THEN
	  		state[0] := 1024;
	  	ELSIF state[0] = 902 & FE_INICIO_L2.Q THEN
	  		state[0] := 1029;
	  	ELSIF state[0] = 903 & FE_AZUL.Q THEN
	  		state[0] := 1028;
	  	ELSIF state[0] = 903 & FE_VERDE.Q THEN
	  		state[0] := 1029;
	  	ELSIF state[0] = 903 & FE_FIN_L1.Q THEN
	  		state[0] := 1025;
	  	ELSIF state[0] = 903 & FE_FIN_L2.Q THEN
	  		state[0] := 1030;
	  	ELSIF state[0] = 904 & FE_DESC_R.Q THEN
	  		state[0] := 211;
	  	ELSIF state[0] = 904 & FE_INICIO_L1.Q THEN
	  		state[0] := 1026;
	  	ELSIF state[0] = 904 & FE_FIN_L2.Q THEN
	  		state[0] := 1031;
	  	ELSIF state[0] = 905 & FE_GIRO_R.Q THEN
	  		state[0] := 1031;
	  	ELSIF state[0] = 905 & FE_INICIO_L1.Q THEN
	  		state[0] := 1027;
	  	ELSIF state[0] = 905 & FE_INICIO_L2.Q THEN
	  		state[0] := 1032;
	  	ELSIF state[0] = 906 & FE_INICIO_L1.Q THEN
	  		state[0] := 1028;
	  	ELSIF state[0] = 906 & FE_FIN_L2.Q THEN
	  		state[0] := 1033;
	  	ELSIF state[0] = 907 & FE_INICIO_L1.Q THEN
	  		state[0] := 1029;
	  	ELSIF state[0] = 907 & FE_FIN_L2.Q THEN
	  		state[0] := 1034;
	  	ELSIF state[0] = 908 & FE_AZUL.Q THEN
	  		state[0] := 1033;
	  	ELSIF state[0] = 908 & FE_VERDE.Q THEN
	  		state[0] := 1034;
	  	ELSIF state[0] = 908 & FE_INICIO_L1.Q THEN
	  		state[0] := 1030;
	  	ELSIF state[0] = 908 & FE_INICIO_L2.Q THEN
	  		state[0] := 1035;
	  	ELSIF state[0] = 909 & FE_DESC_A.Q THEN
	  		state[0] := 1011;
	  	ELSIF state[0] = 909 & FE_FIN_L2.Q THEN
	  		state[0] := 1036;
	  	ELSIF state[0] = 910 & FE_DESC_A.Q THEN
	  		state[0] := 1015;
	  	ELSIF state[0] = 910 & FE_INICIO_L1.Q THEN
	  		state[0] := 1036;
	  	ELSIF state[0] = 910 & FE_INICIO_L2.Q THEN
	  		state[0] := 1037;
	  	ELSIF state[0] = 911 & FE_DESC_A.Q THEN
	  		state[0] := 1020;
	  	ELSIF state[0] = 911 & FE_FIN_L1.Q THEN
	  		state[0] := 1037;
	  	ELSIF state[0] = 912 & FE_GIRO_A.Q THEN
	  		state[0] := 1036;
	  	ELSIF state[0] = 912 & FE_INICIO_L2.Q THEN
	  		state[0] := 1038;
	  	ELSIF state[0] = 913 & FE_GIRO_A.Q THEN
	  		state[0] := 1037;
	  	ELSIF state[0] = 913 & FE_INICIO_L1.Q THEN
	  		state[0] := 1038;
	  	ELSIF state[0] = 915 & FE_DESC_A.Q THEN
	  		state[0] := 956;
	  	ELSIF state[0] = 915 & FE_FIN_L2.Q THEN
	  		state[0] := 1039;
	  	ELSIF state[0] = 916 & FE_GIRO_A.Q THEN
	  		state[0] := 1039;
	  	ELSIF state[0] = 916 & FE_INICIO_L2.Q THEN
	  		state[0] := 1040;
	  	ELSIF state[0] = 917 & FE_DESC_R.Q THEN
	  		state[0] := 231;
	  	ELSIF state[0] = 917 & FE_FIN_L2.Q THEN
	  		state[0] := 1041;
	  	ELSIF state[0] = 918 & FE_GIRO_R.Q THEN
	  		state[0] := 1041;
	  	ELSIF state[0] = 918 & FE_INICIO_L2.Q THEN
	  		state[0] := 1042;
	  	ELSIF state[0] = 920 & FE_DESC_A.Q THEN
	  		state[0] := 1011;
	  	ELSIF state[0] = 920 & FE_FIN_L2.Q THEN
	  		state[0] := 1043;
	  	ELSIF state[0] = 921 & FE_GIRO_A.Q THEN
	  		state[0] := 1043;
	  	ELSIF state[0] = 921 & FE_INICIO_L2.Q THEN
	  		state[0] := 1044;
	  	ELSIF state[0] = 923 & FE_DESC_A.Q THEN
	  		state[0] := 960;
	  	ELSIF state[0] = 923 & FE_INICIO_L1.Q THEN
	  		state[0] := 1039;
	  	ELSIF state[0] = 923 & FE_INICIO_L2.Q THEN
	  		state[0] := 1045;
	  	ELSIF state[0] = 924 & FE_GIRO_A.Q THEN
	  		state[0] := 1045;
	  	ELSIF state[0] = 924 & FE_INICIO_L1.Q THEN
	  		state[0] := 1040;
	  	ELSIF state[0] = 925 & FE_DESC_R.Q THEN
	  		state[0] := 235;
	  	ELSIF state[0] = 925 & FE_INICIO_L1.Q THEN
	  		state[0] := 1041;
	  	ELSIF state[0] = 925 & FE_INICIO_L2.Q THEN
	  		state[0] := 1046;
	  	ELSIF state[0] = 926 & FE_GIRO_R.Q THEN
	  		state[0] := 1046;
	  	ELSIF state[0] = 926 & FE_INICIO_L1.Q THEN
	  		state[0] := 1042;
	  	ELSIF state[0] = 927 & FE_DESC_A.Q THEN
	  		state[0] := 1015;
	  	ELSIF state[0] = 927 & FE_INICIO_L1.Q THEN
	  		state[0] := 1043;
	  	ELSIF state[0] = 927 & FE_INICIO_L2.Q THEN
	  		state[0] := 1047;
	  	ELSIF state[0] = 928 & FE_GIRO_A.Q THEN
	  		state[0] := 1047;
	  	ELSIF state[0] = 928 & FE_INICIO_L1.Q THEN
	  		state[0] := 1044;
	  	ELSIF state[0] = 929 & FE_DESC_A.Q THEN
	  		state[0] := 965;
	  	ELSIF state[0] = 929 & FE_FIN_L1.Q THEN
	  		state[0] := 1045;
	  	ELSIF state[0] = 930 & FE_DESC_R.Q THEN
	  		state[0] := 242;
	  	ELSIF state[0] = 930 & FE_FIN_L1.Q THEN
	  		state[0] := 1046;
	  	ELSIF state[0] = 931 & FE_DESC_A.Q THEN
	  		state[0] := 1020;
	  	ELSIF state[0] = 931 & FE_FIN_L1.Q THEN
	  		state[0] := 1047;
	  	ELSIF state[0] = 932 & FE_DESC_R.Q THEN
	  		state[0] := 272;
	  	ELSIF state[0] = 932 & FE_INICIO_L1.Q THEN
	  		state[0] := 1048;
	  	ELSIF state[0] = 932 & FE_INICIO_L2.Q THEN
	  		state[0] := 1049;
	  	ELSIF state[0] = 933 & FE_DESC_R.Q THEN
	  		state[0] := 273;
	  	ELSIF state[0] = 933 & FE_FIN_L1.Q THEN
	  		state[0] := 1049;
	  	ELSIF state[0] = 933 & FE_FIN_L2.Q THEN
	  		state[0] := 1050;
	  	ELSIF state[0] = 934 & FE_DESC_R.Q THEN
	  		state[0] := 274;
	  	ELSIF state[0] = 934 & FE_INICIO_L1.Q THEN
	  		state[0] := 1050;
	  	ELSIF state[0] = 934 & FE_INICIO_L2.Q THEN
	  		state[0] := 1051;
	  	ELSIF state[0] = 935 & FE_GIRO_R.Q THEN
	  		state[0] := 1048;
	  	ELSIF state[0] = 935 & FE_FIN_L1.Q THEN
	  		state[0] := 1052;
	  	ELSIF state[0] = 935 & FE_INICIO_L2.Q THEN
	  		state[0] := 1053;
	  	ELSIF state[0] = 936 & FE_GIRO_R.Q THEN
	  		state[0] := 1049;
	  	ELSIF state[0] = 936 & FE_INICIO_L1.Q THEN
	  		state[0] := 1053;
	  	ELSIF state[0] = 936 & FE_FIN_L2.Q THEN
	  		state[0] := 1054;
	  	ELSIF state[0] = 937 & FE_GIRO_R.Q THEN
	  		state[0] := 1050;
	  	ELSIF state[0] = 937 & FE_FIN_L1.Q THEN
	  		state[0] := 1054;
	  	ELSIF state[0] = 937 & FE_INICIO_L2.Q THEN
	  		state[0] := 1055;
	  	ELSIF state[0] = 938 & FE_GIRO_R.Q THEN
	  		state[0] := 1051;
	  	ELSIF state[0] = 938 & FE_INICIO_L1.Q THEN
	  		state[0] := 1055;
	  	ELSIF state[0] = 938 & FE_FIN_L2.Q THEN
	  		state[0] := 1056;
	  	ELSIF state[0] = 939 & FE_INICIO_L1.Q THEN
	  		state[0] := 1057;
	  	ELSIF state[0] = 939 & FE_INICIO_L2.Q THEN
	  		state[0] := 1058;
	  	ELSIF state[0] = 940 & FE_FIN_L1.Q THEN
	  		state[0] := 1058;
	  	ELSIF state[0] = 940 & FE_FIN_L2.Q THEN
	  		state[0] := 1059;
	  	ELSIF state[0] = 941 & FE_INICIO_L1.Q THEN
	  		state[0] := 1059;
	  	ELSIF state[0] = 941 & FE_INICIO_L2.Q THEN
	  		state[0] := 1060;
	  	ELSIF state[0] = 942 & FE_FIN_L1.Q THEN
	  		state[0] := 1060;
	  	ELSIF state[0] = 942 & FE_FIN_L2.Q THEN
	  		state[0] := 1061;
	  	ELSIF state[0] = 943 & FE_INICIO_L1.Q THEN
	  		state[0] := 1061;
	  	ELSIF state[0] = 943 & FE_INICIO_L2.Q THEN
	  		state[0] := 1062;
	  	ELSIF state[0] = 944 & FE_INICIO_L1.Q THEN
	  		state[0] := 1063;
	  	ELSIF state[0] = 944 & FE_INICIO_L2.Q THEN
	  		state[0] := 1064;
	  	ELSIF state[0] = 945 & FE_FIN_L1.Q THEN
	  		state[0] := 1064;
	  	ELSIF state[0] = 945 & FE_FIN_L2.Q THEN
	  		state[0] := 1065;
	  	ELSIF state[0] = 946 & FE_INICIO_L1.Q THEN
	  		state[0] := 1065;
	  	ELSIF state[0] = 946 & FE_INICIO_L2.Q THEN
	  		state[0] := 1066;
	  	ELSIF state[0] = 947 & FE_FIN_L1.Q THEN
	  		state[0] := 1066;
	  	ELSIF state[0] = 947 & FE_FIN_L2.Q THEN
	  		state[0] := 1067;
	  	ELSIF state[0] = 948 & FE_INICIO_L1.Q THEN
	  		state[0] := 1067;
	  	ELSIF state[0] = 948 & FE_INICIO_L2.Q THEN
	  		state[0] := 1068;
	  	ELSIF state[0] = 949 & FE_AZUL.Q THEN
	  		state[0] := 1057;
	  	ELSIF state[0] = 949 & FE_VERDE.Q THEN
	  		state[0] := 1063;
	  	ELSIF state[0] = 949 & FE_INICIO_L2.Q THEN
	  		state[0] := 1069;
	  	ELSIF state[0] = 950 & FE_AZUL.Q THEN
	  		state[0] := 1058;
	  	ELSIF state[0] = 950 & FE_VERDE.Q THEN
	  		state[0] := 1064;
	  	ELSIF state[0] = 950 & FE_INICIO_L1.Q THEN
	  		state[0] := 1069;
	  	ELSIF state[0] = 950 & FE_FIN_L2.Q THEN
	  		state[0] := 1070;
	  	ELSIF state[0] = 951 & FE_AZUL.Q THEN
	  		state[0] := 1059;
	  	ELSIF state[0] = 951 & FE_VERDE.Q THEN
	  		state[0] := 1065;
	  	ELSIF state[0] = 951 & FE_FIN_L1.Q THEN
	  		state[0] := 1070;
	  	ELSIF state[0] = 951 & FE_INICIO_L2.Q THEN
	  		state[0] := 1071;
	  	ELSIF state[0] = 952 & FE_AZUL.Q THEN
	  		state[0] := 1060;
	  	ELSIF state[0] = 952 & FE_VERDE.Q THEN
	  		state[0] := 1066;
	  	ELSIF state[0] = 952 & FE_INICIO_L1.Q THEN
	  		state[0] := 1071;
	  	ELSIF state[0] = 952 & FE_FIN_L2.Q THEN
	  		state[0] := 1072;
	  	ELSIF state[0] = 953 & FE_AZUL.Q THEN
	  		state[0] := 1061;
	  	ELSIF state[0] = 953 & FE_VERDE.Q THEN
	  		state[0] := 1067;
	  	ELSIF state[0] = 953 & FE_FIN_L1.Q THEN
	  		state[0] := 1072;
	  	ELSIF state[0] = 953 & FE_INICIO_L2.Q THEN
	  		state[0] := 1073;
	  	ELSIF state[0] = 954 & FE_AZUL.Q THEN
	  		state[0] := 1062;
	  	ELSIF state[0] = 954 & FE_VERDE.Q THEN
	  		state[0] := 1068;
	  	ELSIF state[0] = 954 & FE_INICIO_L1.Q THEN
	  		state[0] := 1073;
	  	ELSIF state[0] = 955 & FE_AZUL.Q THEN
	  		state[0] := 1074;
	  	ELSIF state[0] = 955 & FE_VERDE.Q THEN
	  		state[0] := 1075;
	  	ELSIF state[0] = 955 & FE_INICIO_L2.Q THEN
	  		state[0] := 1076;
	  	ELSIF state[0] = 956 & FE_L1.Q THEN
	  		state[0] := 1071;
	  	ELSIF state[0] = 956 & FE_L2.Q THEN
	  		state[0] := 1076;
	  	ELSIF state[0] = 956 & FE_FIN_L2.Q THEN
	  		state[0] := 1077;
	  	ELSIF state[0] = 957 & FE_INICIO_L1.Q THEN
	  		state[0] := 1074;
	  	ELSIF state[0] = 957 & FE_INICIO_L2.Q THEN
	  		state[0] := 1079;
	  	ELSIF state[0] = 958 & FE_INICIO_L1.Q THEN
	  		state[0] := 1075;
	  	ELSIF state[0] = 958 & FE_INICIO_L2.Q THEN
	  		state[0] := 1080;
	  	ELSIF state[0] = 959 & FE_AZUL.Q THEN
	  		state[0] := 1079;
	  	ELSIF state[0] = 959 & FE_VERDE.Q THEN
	  		state[0] := 1080;
	  	ELSIF state[0] = 959 & FE_INICIO_L1.Q THEN
	  		state[0] := 1076;
	  	ELSIF state[0] = 959 & FE_FIN_L2.Q THEN
	  		state[0] := 1081;
	  	ELSIF state[0] = 960 & FE_L1.Q THEN
	  		state[0] := 1072;
	  	ELSIF state[0] = 960 & FE_L2.Q THEN
	  		state[0] := 1081;
	  	ELSIF state[0] = 960 & FE_INICIO_L1.Q THEN
	  		state[0] := 1077;
	  	ELSIF state[0] = 960 & FE_INICIO_L2.Q THEN
	  		state[0] := 1082;
	  	ELSIF state[0] = 961 & FE_GIRO_R.Q THEN
	  		state[0] := 1083;
	  	ELSIF state[0] = 961 & FE_FIN_L1.Q THEN
	  		state[0] := 1078;
	  	ELSIF state[0] = 961 & FE_INICIO_L2.Q THEN
	  		state[0] := 1084;
	  	ELSIF state[0] = 962 & FE_FIN_L1.Q THEN
	  		state[0] := 1079;
	  	ELSIF state[0] = 962 & FE_FIN_L2.Q THEN
	  		state[0] := 1085;
	  	ELSIF state[0] = 963 & FE_FIN_L1.Q THEN
	  		state[0] := 1080;
	  	ELSIF state[0] = 963 & FE_FIN_L2.Q THEN
	  		state[0] := 1086;
	  	ELSIF state[0] = 964 & FE_AZUL.Q THEN
	  		state[0] := 1085;
	  	ELSIF state[0] = 964 & FE_VERDE.Q THEN
	  		state[0] := 1086;
	  	ELSIF state[0] = 964 & FE_FIN_L1.Q THEN
	  		state[0] := 1081;
	  	ELSIF state[0] = 964 & FE_INICIO_L2.Q THEN
	  		state[0] := 1087;
	  	ELSIF state[0] = 965 & FE_L1.Q THEN
	  		state[0] := 1073;
	  	ELSIF state[0] = 965 & FE_L2.Q THEN
	  		state[0] := 1087;
	  	ELSIF state[0] = 965 & FE_FIN_L1.Q THEN
	  		state[0] := 1082;
	  	ELSIF state[0] = 966 & FE_DESC_R.Q THEN
	  		state[0] := 272;
	  	ELSIF state[0] = 966 & FE_INICIO_L1.Q THEN
	  		state[0] := 1083;
	  	ELSIF state[0] = 966 & FE_INICIO_L2.Q THEN
	  		state[0] := 1088;
	  	ELSIF state[0] = 967 & FE_GIRO_R.Q THEN
	  		state[0] := 1088;
	  	ELSIF state[0] = 967 & FE_INICIO_L1.Q THEN
	  		state[0] := 1084;
	  	ELSIF state[0] = 967 & FE_FIN_L2.Q THEN
	  		state[0] := 1089;
	  	ELSIF state[0] = 968 & FE_INICIO_L1.Q THEN
	  		state[0] := 1085;
	  	ELSIF state[0] = 968 & FE_INICIO_L2.Q THEN
	  		state[0] := 1090;
	  	ELSIF state[0] = 969 & FE_INICIO_L1.Q THEN
	  		state[0] := 1086;
	  	ELSIF state[0] = 969 & FE_INICIO_L2.Q THEN
	  		state[0] := 1091;
	  	ELSIF state[0] = 970 & FE_AZUL.Q THEN
	  		state[0] := 1090;
	  	ELSIF state[0] = 970 & FE_VERDE.Q THEN
	  		state[0] := 1091;
	  	ELSIF state[0] = 970 & FE_INICIO_L1.Q THEN
	  		state[0] := 1087;
	  	ELSIF state[0] = 970 & FE_FIN_L2.Q THEN
	  		state[0] := 1092;
	  	ELSIF state[0] = 971 & FE_DESC_R.Q THEN
	  		state[0] := 273;
	  	ELSIF state[0] = 971 & FE_FIN_L1.Q THEN
	  		state[0] := 1088;
	  	ELSIF state[0] = 971 & FE_FIN_L2.Q THEN
	  		state[0] := 1093;
	  	ELSIF state[0] = 972 & FE_GIRO_R.Q THEN
	  		state[0] := 1093;
	  	ELSIF state[0] = 972 & FE_FIN_L1.Q THEN
	  		state[0] := 1089;
	  	ELSIF state[0] = 972 & FE_INICIO_L2.Q THEN
	  		state[0] := 1094;
	  	ELSIF state[0] = 973 & FE_FIN_L1.Q THEN
	  		state[0] := 1090;
	  	ELSIF state[0] = 973 & FE_FIN_L2.Q THEN
	  		state[0] := 1095;
	  	ELSIF state[0] = 974 & FE_FIN_L1.Q THEN
	  		state[0] := 1091;
	  	ELSIF state[0] = 974 & FE_FIN_L2.Q THEN
	  		state[0] := 1096;
	  	ELSIF state[0] = 975 & FE_AZUL.Q THEN
	  		state[0] := 1095;
	  	ELSIF state[0] = 975 & FE_VERDE.Q THEN
	  		state[0] := 1096;
	  	ELSIF state[0] = 975 & FE_FIN_L1.Q THEN
	  		state[0] := 1092;
	  	ELSIF state[0] = 975 & FE_INICIO_L2.Q THEN
	  		state[0] := 1097;
	  	ELSIF state[0] = 976 & FE_DESC_R.Q THEN
	  		state[0] := 274;
	  	ELSIF state[0] = 976 & FE_INICIO_L1.Q THEN
	  		state[0] := 1093;
	  	ELSIF state[0] = 976 & FE_INICIO_L2.Q THEN
	  		state[0] := 1098;
	  	ELSIF state[0] = 977 & FE_GIRO_R.Q THEN
	  		state[0] := 1098;
	  	ELSIF state[0] = 977 & FE_INICIO_L1.Q THEN
	  		state[0] := 1094;
	  	ELSIF state[0] = 977 & FE_FIN_L2.Q THEN
	  		state[0] := 1099;
	  	ELSIF state[0] = 978 & FE_INICIO_L1.Q THEN
	  		state[0] := 1095;
	  	ELSIF state[0] = 978 & FE_INICIO_L2.Q THEN
	  		state[0] := 1100;
	  	ELSIF state[0] = 979 & FE_INICIO_L1.Q THEN
	  		state[0] := 1096;
	  	ELSIF state[0] = 979 & FE_INICIO_L2.Q THEN
	  		state[0] := 1101;
	  	ELSIF state[0] = 980 & FE_AZUL.Q THEN
	  		state[0] := 1100;
	  	ELSIF state[0] = 980 & FE_VERDE.Q THEN
	  		state[0] := 1101;
	  	ELSIF state[0] = 980 & FE_INICIO_L1.Q THEN
	  		state[0] := 1097;
	  	ELSIF state[0] = 981 & FE_DESC_A.Q THEN
	  		state[0] := 1077;
	  	ELSIF state[0] = 981 & FE_INICIO_L2.Q THEN
	  		state[0] := 1102;
	  	ELSIF state[0] = 982 & FE_DESC_A.Q THEN
	  		state[0] := 1082;
	  	ELSIF state[0] = 982 & FE_INICIO_L1.Q THEN
	  		state[0] := 1102;
	  	ELSIF state[0] = 983 & FE_GIRO_A.Q THEN
	  		state[0] := 1102;
	  	ELSIF state[0] = 984 & FE_DESC_R.Q THEN
	  		state[0] := 325;
	  	ELSIF state[0] = 984 & FE_INICIO_L2.Q THEN
	  		state[0] := 1103;
	  	ELSIF state[0] = 985 & FE_DESC_R.Q THEN
	  		state[0] := 332;
	  	ELSIF state[0] = 985 & FE_INICIO_L1.Q THEN
	  		state[0] := 1103;
	  	ELSIF state[0] = 986 & FE_GIRO_R.Q THEN
	  		state[0] := 1103;
	  	ELSIF state[0] = 987 & FE_DESC_R.Q THEN
	  		state[0] := 299;
	  	ELSIF state[0] = 987 & FE_INICIO_L1.Q THEN
	  		state[0] := 1104;
	  	ELSIF state[0] = 987 & FE_INICIO_L2.Q THEN
	  		state[0] := 1105;
	  	ELSIF state[0] = 988 & FE_DESC_R.Q THEN
	  		state[0] := 300;
	  	ELSIF state[0] = 988 & FE_FIN_L1.Q THEN
	  		state[0] := 1105;
	  	ELSIF state[0] = 988 & FE_FIN_L2.Q THEN
	  		state[0] := 1106;
	  	ELSIF state[0] = 989 & FE_DESC_R.Q THEN
	  		state[0] := 301;
	  	ELSIF state[0] = 989 & FE_INICIO_L1.Q THEN
	  		state[0] := 1106;
	  	ELSIF state[0] = 989 & FE_INICIO_L2.Q THEN
	  		state[0] := 1107;
	  	ELSIF state[0] = 990 & FE_GIRO_R.Q THEN
	  		state[0] := 1104;
	  	ELSIF state[0] = 990 & FE_FIN_L1.Q THEN
	  		state[0] := 1108;
	  	ELSIF state[0] = 990 & FE_INICIO_L2.Q THEN
	  		state[0] := 1109;
	  	ELSIF state[0] = 991 & FE_GIRO_R.Q THEN
	  		state[0] := 1105;
	  	ELSIF state[0] = 991 & FE_INICIO_L1.Q THEN
	  		state[0] := 1109;
	  	ELSIF state[0] = 991 & FE_FIN_L2.Q THEN
	  		state[0] := 1110;
	  	ELSIF state[0] = 992 & FE_GIRO_R.Q THEN
	  		state[0] := 1106;
	  	ELSIF state[0] = 992 & FE_FIN_L1.Q THEN
	  		state[0] := 1110;
	  	ELSIF state[0] = 992 & FE_INICIO_L2.Q THEN
	  		state[0] := 1111;
	  	ELSIF state[0] = 993 & FE_GIRO_R.Q THEN
	  		state[0] := 1107;
	  	ELSIF state[0] = 993 & FE_INICIO_L1.Q THEN
	  		state[0] := 1111;
	  	ELSIF state[0] = 993 & FE_FIN_L2.Q THEN
	  		state[0] := 1112;
	  	ELSIF state[0] = 994 & FE_INICIO_L1.Q THEN
	  		state[0] := 1113;
	  	ELSIF state[0] = 994 & FE_INICIO_L2.Q THEN
	  		state[0] := 1114;
	  	ELSIF state[0] = 995 & FE_FIN_L1.Q THEN
	  		state[0] := 1114;
	  	ELSIF state[0] = 995 & FE_FIN_L2.Q THEN
	  		state[0] := 1115;
	  	ELSIF state[0] = 996 & FE_INICIO_L1.Q THEN
	  		state[0] := 1115;
	  	ELSIF state[0] = 996 & FE_INICIO_L2.Q THEN
	  		state[0] := 1116;
	  	ELSIF state[0] = 997 & FE_FIN_L1.Q THEN
	  		state[0] := 1116;
	  	ELSIF state[0] = 997 & FE_FIN_L2.Q THEN
	  		state[0] := 1117;
	  	ELSIF state[0] = 998 & FE_INICIO_L1.Q THEN
	  		state[0] := 1117;
	  	ELSIF state[0] = 998 & FE_INICIO_L2.Q THEN
	  		state[0] := 1118;
	  	ELSIF state[0] = 999 & FE_INICIO_L1.Q THEN
	  		state[0] := 1119;
	  	ELSIF state[0] = 999 & FE_INICIO_L2.Q THEN
	  		state[0] := 1120;
	  	ELSIF state[0] = 1000 & FE_FIN_L1.Q THEN
	  		state[0] := 1120;
	  	ELSIF state[0] = 1000 & FE_FIN_L2.Q THEN
	  		state[0] := 1121;
	  	ELSIF state[0] = 1001 & FE_INICIO_L1.Q THEN
	  		state[0] := 1121;
	  	ELSIF state[0] = 1001 & FE_INICIO_L2.Q THEN
	  		state[0] := 1122;
	  	ELSIF state[0] = 1002 & FE_FIN_L1.Q THEN
	  		state[0] := 1122;
	  	ELSIF state[0] = 1002 & FE_FIN_L2.Q THEN
	  		state[0] := 1123;
	  	ELSIF state[0] = 1003 & FE_INICIO_L1.Q THEN
	  		state[0] := 1123;
	  	ELSIF state[0] = 1003 & FE_INICIO_L2.Q THEN
	  		state[0] := 1124;
	  	ELSIF state[0] = 1004 & FE_AZUL.Q THEN
	  		state[0] := 1113;
	  	ELSIF state[0] = 1004 & FE_VERDE.Q THEN
	  		state[0] := 1119;
	  	ELSIF state[0] = 1004 & FE_INICIO_L2.Q THEN
	  		state[0] := 1125;
	  	ELSIF state[0] = 1005 & FE_AZUL.Q THEN
	  		state[0] := 1114;
	  	ELSIF state[0] = 1005 & FE_VERDE.Q THEN
	  		state[0] := 1120;
	  	ELSIF state[0] = 1005 & FE_INICIO_L1.Q THEN
	  		state[0] := 1125;
	  	ELSIF state[0] = 1005 & FE_FIN_L2.Q THEN
	  		state[0] := 1126;
	  	ELSIF state[0] = 1006 & FE_AZUL.Q THEN
	  		state[0] := 1115;
	  	ELSIF state[0] = 1006 & FE_VERDE.Q THEN
	  		state[0] := 1121;
	  	ELSIF state[0] = 1006 & FE_FIN_L1.Q THEN
	  		state[0] := 1126;
	  	ELSIF state[0] = 1006 & FE_INICIO_L2.Q THEN
	  		state[0] := 1127;
	  	ELSIF state[0] = 1007 & FE_AZUL.Q THEN
	  		state[0] := 1116;
	  	ELSIF state[0] = 1007 & FE_VERDE.Q THEN
	  		state[0] := 1122;
	  	ELSIF state[0] = 1007 & FE_INICIO_L1.Q THEN
	  		state[0] := 1127;
	  	ELSIF state[0] = 1007 & FE_FIN_L2.Q THEN
	  		state[0] := 1128;
	  	ELSIF state[0] = 1008 & FE_AZUL.Q THEN
	  		state[0] := 1117;
	  	ELSIF state[0] = 1008 & FE_VERDE.Q THEN
	  		state[0] := 1123;
	  	ELSIF state[0] = 1008 & FE_FIN_L1.Q THEN
	  		state[0] := 1128;
	  	ELSIF state[0] = 1008 & FE_INICIO_L2.Q THEN
	  		state[0] := 1129;
	  	ELSIF state[0] = 1009 & FE_AZUL.Q THEN
	  		state[0] := 1118;
	  	ELSIF state[0] = 1009 & FE_VERDE.Q THEN
	  		state[0] := 1124;
	  	ELSIF state[0] = 1009 & FE_INICIO_L1.Q THEN
	  		state[0] := 1129;
	  	ELSIF state[0] = 1010 & FE_AZUL.Q THEN
	  		state[0] := 1130;
	  	ELSIF state[0] = 1010 & FE_VERDE.Q THEN
	  		state[0] := 1131;
	  	ELSIF state[0] = 1010 & FE_INICIO_L2.Q THEN
	  		state[0] := 1132;
	  	ELSIF state[0] = 1011 & FE_L1.Q THEN
	  		state[0] := 1127;
	  	ELSIF state[0] = 1011 & FE_L2.Q THEN
	  		state[0] := 1132;
	  	ELSIF state[0] = 1011 & FE_FIN_L2.Q THEN
	  		state[0] := 1133;
	  	ELSIF state[0] = 1012 & FE_INICIO_L1.Q THEN
	  		state[0] := 1130;
	  	ELSIF state[0] = 1012 & FE_INICIO_L2.Q THEN
	  		state[0] := 1135;
	  	ELSIF state[0] = 1013 & FE_INICIO_L1.Q THEN
	  		state[0] := 1131;
	  	ELSIF state[0] = 1013 & FE_INICIO_L2.Q THEN
	  		state[0] := 1136;
	  	ELSIF state[0] = 1014 & FE_AZUL.Q THEN
	  		state[0] := 1135;
	  	ELSIF state[0] = 1014 & FE_VERDE.Q THEN
	  		state[0] := 1136;
	  	ELSIF state[0] = 1014 & FE_INICIO_L1.Q THEN
	  		state[0] := 1132;
	  	ELSIF state[0] = 1014 & FE_FIN_L2.Q THEN
	  		state[0] := 1137;
	  	ELSIF state[0] = 1015 & FE_L1.Q THEN
	  		state[0] := 1128;
	  	ELSIF state[0] = 1015 & FE_L2.Q THEN
	  		state[0] := 1137;
	  	ELSIF state[0] = 1015 & FE_INICIO_L1.Q THEN
	  		state[0] := 1133;
	  	ELSIF state[0] = 1015 & FE_INICIO_L2.Q THEN
	  		state[0] := 1138;
	  	ELSIF state[0] = 1016 & FE_GIRO_R.Q THEN
	  		state[0] := 1139;
	  	ELSIF state[0] = 1016 & FE_FIN_L1.Q THEN
	  		state[0] := 1134;
	  	ELSIF state[0] = 1016 & FE_INICIO_L2.Q THEN
	  		state[0] := 1140;
	  	ELSIF state[0] = 1017 & FE_FIN_L1.Q THEN
	  		state[0] := 1135;
	  	ELSIF state[0] = 1017 & FE_FIN_L2.Q THEN
	  		state[0] := 1141;
	  	ELSIF state[0] = 1018 & FE_FIN_L1.Q THEN
	  		state[0] := 1136;
	  	ELSIF state[0] = 1018 & FE_FIN_L2.Q THEN
	  		state[0] := 1142;
	  	ELSIF state[0] = 1019 & FE_AZUL.Q THEN
	  		state[0] := 1141;
	  	ELSIF state[0] = 1019 & FE_VERDE.Q THEN
	  		state[0] := 1142;
	  	ELSIF state[0] = 1019 & FE_FIN_L1.Q THEN
	  		state[0] := 1137;
	  	ELSIF state[0] = 1019 & FE_INICIO_L2.Q THEN
	  		state[0] := 1143;
	  	ELSIF state[0] = 1020 & FE_L1.Q THEN
	  		state[0] := 1129;
	  	ELSIF state[0] = 1020 & FE_L2.Q THEN
	  		state[0] := 1143;
	  	ELSIF state[0] = 1020 & FE_FIN_L1.Q THEN
	  		state[0] := 1138;
	  	ELSIF state[0] = 1021 & FE_DESC_R.Q THEN
	  		state[0] := 299;
	  	ELSIF state[0] = 1021 & FE_INICIO_L1.Q THEN
	  		state[0] := 1139;
	  	ELSIF state[0] = 1021 & FE_INICIO_L2.Q THEN
	  		state[0] := 1144;
	  	ELSIF state[0] = 1022 & FE_GIRO_R.Q THEN
	  		state[0] := 1144;
	  	ELSIF state[0] = 1022 & FE_INICIO_L1.Q THEN
	  		state[0] := 1140;
	  	ELSIF state[0] = 1022 & FE_FIN_L2.Q THEN
	  		state[0] := 1145;
	  	ELSIF state[0] = 1023 & FE_INICIO_L1.Q THEN
	  		state[0] := 1141;
	  	ELSIF state[0] = 1023 & FE_INICIO_L2.Q THEN
	  		state[0] := 1146;
	  	ELSIF state[0] = 1024 & FE_INICIO_L1.Q THEN
	  		state[0] := 1142;
	  	ELSIF state[0] = 1024 & FE_INICIO_L2.Q THEN
	  		state[0] := 1147;
	  	ELSIF state[0] = 1025 & FE_AZUL.Q THEN
	  		state[0] := 1146;
	  	ELSIF state[0] = 1025 & FE_VERDE.Q THEN
	  		state[0] := 1147;
	  	ELSIF state[0] = 1025 & FE_INICIO_L1.Q THEN
	  		state[0] := 1143;
	  	ELSIF state[0] = 1025 & FE_FIN_L2.Q THEN
	  		state[0] := 1148;
	  	ELSIF state[0] = 1026 & FE_DESC_R.Q THEN
	  		state[0] := 300;
	  	ELSIF state[0] = 1026 & FE_FIN_L1.Q THEN
	  		state[0] := 1144;
	  	ELSIF state[0] = 1026 & FE_FIN_L2.Q THEN
	  		state[0] := 1149;
	  	ELSIF state[0] = 1027 & FE_GIRO_R.Q THEN
	  		state[0] := 1149;
	  	ELSIF state[0] = 1027 & FE_FIN_L1.Q THEN
	  		state[0] := 1145;
	  	ELSIF state[0] = 1027 & FE_INICIO_L2.Q THEN
	  		state[0] := 1150;
	  	ELSIF state[0] = 1028 & FE_FIN_L1.Q THEN
	  		state[0] := 1146;
	  	ELSIF state[0] = 1028 & FE_FIN_L2.Q THEN
	  		state[0] := 1151;
	  	ELSIF state[0] = 1029 & FE_FIN_L1.Q THEN
	  		state[0] := 1147;
	  	ELSIF state[0] = 1029 & FE_FIN_L2.Q THEN
	  		state[0] := 1152;
	  	ELSIF state[0] = 1030 & FE_AZUL.Q THEN
	  		state[0] := 1151;
	  	ELSIF state[0] = 1030 & FE_VERDE.Q THEN
	  		state[0] := 1152;
	  	ELSIF state[0] = 1030 & FE_FIN_L1.Q THEN
	  		state[0] := 1148;
	  	ELSIF state[0] = 1030 & FE_INICIO_L2.Q THEN
	  		state[0] := 1153;
	  	ELSIF state[0] = 1031 & FE_DESC_R.Q THEN
	  		state[0] := 301;
	  	ELSIF state[0] = 1031 & FE_INICIO_L1.Q THEN
	  		state[0] := 1149;
	  	ELSIF state[0] = 1031 & FE_INICIO_L2.Q THEN
	  		state[0] := 1154;
	  	ELSIF state[0] = 1032 & FE_GIRO_R.Q THEN
	  		state[0] := 1154;
	  	ELSIF state[0] = 1032 & FE_INICIO_L1.Q THEN
	  		state[0] := 1150;
	  	ELSIF state[0] = 1032 & FE_FIN_L2.Q THEN
	  		state[0] := 1155;
	  	ELSIF state[0] = 1033 & FE_INICIO_L1.Q THEN
	  		state[0] := 1151;
	  	ELSIF state[0] = 1033 & FE_INICIO_L2.Q THEN
	  		state[0] := 1156;
	  	ELSIF state[0] = 1034 & FE_INICIO_L1.Q THEN
	  		state[0] := 1152;
	  	ELSIF state[0] = 1034 & FE_INICIO_L2.Q THEN
	  		state[0] := 1157;
	  	ELSIF state[0] = 1035 & FE_AZUL.Q THEN
	  		state[0] := 1156;
	  	ELSIF state[0] = 1035 & FE_VERDE.Q THEN
	  		state[0] := 1157;
	  	ELSIF state[0] = 1035 & FE_INICIO_L1.Q THEN
	  		state[0] := 1153;
	  	ELSIF state[0] = 1036 & FE_DESC_A.Q THEN
	  		state[0] := 1133;
	  	ELSIF state[0] = 1036 & FE_INICIO_L2.Q THEN
	  		state[0] := 1158;
	  	ELSIF state[0] = 1037 & FE_DESC_A.Q THEN
	  		state[0] := 1138;
	  	ELSIF state[0] = 1037 & FE_INICIO_L1.Q THEN
	  		state[0] := 1158;
	  	ELSIF state[0] = 1038 & FE_GIRO_A.Q THEN
	  		state[0] := 1158;
	  	ELSIF state[0] = 1039 & FE_DESC_A.Q THEN
	  		state[0] := 1077;
	  	ELSIF state[0] = 1039 & FE_INICIO_L2.Q THEN
	  		state[0] := 1159;
	  	ELSIF state[0] = 1040 & FE_GIRO_A.Q THEN
	  		state[0] := 1159;
	  	ELSIF state[0] = 1041 & FE_DESC_R.Q THEN
	  		state[0] := 325;
	  	ELSIF state[0] = 1041 & FE_INICIO_L2.Q THEN
	  		state[0] := 1160;
	  	ELSIF state[0] = 1042 & FE_GIRO_R.Q THEN
	  		state[0] := 1160;
	  	ELSIF state[0] = 1043 & FE_DESC_A.Q THEN
	  		state[0] := 1133;
	  	ELSIF state[0] = 1043 & FE_INICIO_L2.Q THEN
	  		state[0] := 1161;
	  	ELSIF state[0] = 1044 & FE_GIRO_A.Q THEN
	  		state[0] := 1161;
	  	ELSIF state[0] = 1045 & FE_DESC_A.Q THEN
	  		state[0] := 1082;
	  	ELSIF state[0] = 1045 & FE_INICIO_L1.Q THEN
	  		state[0] := 1159;
	  	ELSIF state[0] = 1046 & FE_DESC_R.Q THEN
	  		state[0] := 332;
	  	ELSIF state[0] = 1046 & FE_INICIO_L1.Q THEN
	  		state[0] := 1160;
	  	ELSIF state[0] = 1047 & FE_DESC_A.Q THEN
	  		state[0] := 1138;
	  	ELSIF state[0] = 1047 & FE_INICIO_L1.Q THEN
	  		state[0] := 1161;
	  	ELSIF state[0] = 1048 & FE_DESC_R.Q THEN
	  		state[0] := 370;
	  	ELSIF state[0] = 1048 & FE_FIN_L1.Q THEN
	  		state[0] := 1162;
	  	ELSIF state[0] = 1048 & FE_INICIO_L2.Q THEN
	  		state[0] := 1163;
	  	ELSIF state[0] = 1049 & FE_DESC_R.Q THEN
	  		state[0] := 371;
	  	ELSIF state[0] = 1049 & FE_INICIO_L1.Q THEN
	  		state[0] := 1163;
	  	ELSIF state[0] = 1049 & FE_FIN_L2.Q THEN
	  		state[0] := 1164;
	  	ELSIF state[0] = 1050 & FE_DESC_R.Q THEN
	  		state[0] := 372;
	  	ELSIF state[0] = 1050 & FE_FIN_L1.Q THEN
	  		state[0] := 1164;
	  	ELSIF state[0] = 1050 & FE_INICIO_L2.Q THEN
	  		state[0] := 1165;
	  	ELSIF state[0] = 1051 & FE_DESC_R.Q THEN
	  		state[0] := 374;
	  	ELSIF state[0] = 1051 & FE_INICIO_L1.Q THEN
	  		state[0] := 1165;
	  	ELSIF state[0] = 1051 & FE_FIN_L2.Q THEN
	  		state[0] := 1166;
	  	ELSIF state[0] = 1052 & FE_GIRO_R.Q THEN
	  		state[0] := 1162;
	  	ELSIF state[0] = 1052 & FE_INICIO_L1.Q THEN
	  		state[0] := 1167;
	  	ELSIF state[0] = 1052 & FE_INICIO_L2.Q THEN
	  		state[0] := 1168;
	  	ELSIF state[0] = 1053 & FE_GIRO_R.Q THEN
	  		state[0] := 1163;
	  	ELSIF state[0] = 1053 & FE_FIN_L1.Q THEN
	  		state[0] := 1168;
	  	ELSIF state[0] = 1053 & FE_FIN_L2.Q THEN
	  		state[0] := 1169;
	  	ELSIF state[0] = 1054 & FE_GIRO_R.Q THEN
	  		state[0] := 1164;
	  	ELSIF state[0] = 1054 & FE_INICIO_L1.Q THEN
	  		state[0] := 1169;
	  	ELSIF state[0] = 1054 & FE_INICIO_L2.Q THEN
	  		state[0] := 1170;
	  	ELSIF state[0] = 1055 & FE_GIRO_R.Q THEN
	  		state[0] := 1165;
	  	ELSIF state[0] = 1055 & FE_FIN_L1.Q THEN
	  		state[0] := 1170;
	  	ELSIF state[0] = 1055 & FE_FIN_L2.Q THEN
	  		state[0] := 1171;
	  	ELSIF state[0] = 1056 & FE_GIRO_R.Q THEN
	  		state[0] := 1166;
	  	ELSIF state[0] = 1056 & FE_INICIO_L1.Q THEN
	  		state[0] := 1171;
	  	ELSIF state[0] = 1056 & FE_INICIO_L2.Q THEN
	  		state[0] := 1172;
	  	ELSIF state[0] = 1057 & FE_INICIO_L2.Q THEN
	  		state[0] := 1173;
	  	ELSIF state[0] = 1058 & FE_INICIO_L1.Q THEN
	  		state[0] := 1173;
	  	ELSIF state[0] = 1058 & FE_FIN_L2.Q THEN
	  		state[0] := 1174;
	  	ELSIF state[0] = 1059 & FE_FIN_L1.Q THEN
	  		state[0] := 1174;
	  	ELSIF state[0] = 1059 & FE_INICIO_L2.Q THEN
	  		state[0] := 1175;
	  	ELSIF state[0] = 1060 & FE_INICIO_L1.Q THEN
	  		state[0] := 1175;
	  	ELSIF state[0] = 1060 & FE_FIN_L2.Q THEN
	  		state[0] := 1176;
	  	ELSIF state[0] = 1061 & FE_FIN_L1.Q THEN
	  		state[0] := 1176;
	  	ELSIF state[0] = 1061 & FE_INICIO_L2.Q THEN
	  		state[0] := 1177;
	  	ELSIF state[0] = 1062 & FE_INICIO_L1.Q THEN
	  		state[0] := 1177;
	  	ELSIF state[0] = 1063 & FE_INICIO_L2.Q THEN
	  		state[0] := 1178;
	  	ELSIF state[0] = 1064 & FE_INICIO_L1.Q THEN
	  		state[0] := 1178;
	  	ELSIF state[0] = 1064 & FE_FIN_L2.Q THEN
	  		state[0] := 1179;
	  	ELSIF state[0] = 1065 & FE_FIN_L1.Q THEN
	  		state[0] := 1179;
	  	ELSIF state[0] = 1065 & FE_INICIO_L2.Q THEN
	  		state[0] := 1180;
	  	ELSIF state[0] = 1066 & FE_INICIO_L1.Q THEN
	  		state[0] := 1180;
	  	ELSIF state[0] = 1066 & FE_FIN_L2.Q THEN
	  		state[0] := 1181;
	  	ELSIF state[0] = 1067 & FE_FIN_L1.Q THEN
	  		state[0] := 1181;
	  	ELSIF state[0] = 1067 & FE_INICIO_L2.Q THEN
	  		state[0] := 1182;
	  	ELSIF state[0] = 1068 & FE_INICIO_L1.Q THEN
	  		state[0] := 1182;
	  	ELSIF state[0] = 1069 & FE_AZUL.Q THEN
	  		state[0] := 1173;
	  	ELSIF state[0] = 1069 & FE_VERDE.Q THEN
	  		state[0] := 1178;
	  	ELSIF state[0] = 1069 & FE_FIN_L2.Q THEN
	  		state[0] := 1183;
	  	ELSIF state[0] = 1070 & FE_AZUL.Q THEN
	  		state[0] := 1174;
	  	ELSIF state[0] = 1070 & FE_VERDE.Q THEN
	  		state[0] := 1179;
	  	ELSIF state[0] = 1070 & FE_INICIO_L1.Q THEN
	  		state[0] := 1183;
	  	ELSIF state[0] = 1070 & FE_INICIO_L2.Q THEN
	  		state[0] := 1184;
	  	ELSIF state[0] = 1071 & FE_AZUL.Q THEN
	  		state[0] := 1175;
	  	ELSIF state[0] = 1071 & FE_VERDE.Q THEN
	  		state[0] := 1180;
	  	ELSIF state[0] = 1071 & FE_FIN_L1.Q THEN
	  		state[0] := 1184;
	  	ELSIF state[0] = 1071 & FE_FIN_L2.Q THEN
	  		state[0] := 1185;
	  	ELSIF state[0] = 1072 & FE_AZUL.Q THEN
	  		state[0] := 1176;
	  	ELSIF state[0] = 1072 & FE_VERDE.Q THEN
	  		state[0] := 1181;
	  	ELSIF state[0] = 1072 & FE_INICIO_L1.Q THEN
	  		state[0] := 1185;
	  	ELSIF state[0] = 1072 & FE_INICIO_L2.Q THEN
	  		state[0] := 1186;
	  	ELSIF state[0] = 1073 & FE_AZUL.Q THEN
	  		state[0] := 1177;
	  	ELSIF state[0] = 1073 & FE_VERDE.Q THEN
	  		state[0] := 1182;
	  	ELSIF state[0] = 1073 & FE_FIN_L1.Q THEN
	  		state[0] := 1186;
	  	ELSIF state[0] = 1074 & FE_INICIO_L2.Q THEN
	  		state[0] := 1188;
	  	ELSIF state[0] = 1075 & FE_INICIO_L2.Q THEN
	  		state[0] := 1189;
	  	ELSIF state[0] = 1076 & FE_AZUL.Q THEN
	  		state[0] := 1188;
	  	ELSIF state[0] = 1076 & FE_VERDE.Q THEN
	  		state[0] := 1189;
	  	ELSIF state[0] = 1076 & FE_FIN_L2.Q THEN
	  		state[0] := 1190;
	  	ELSIF state[0] = 1077 & FE_L1.Q THEN
	  		state[0] := 1185;
	  	ELSIF state[0] = 1077 & FE_L2.Q THEN
	  		state[0] := 1190;
	  	ELSIF state[0] = 1077 & FE_INICIO_L2.Q THEN
	  		state[0] := 1191;
	  	ELSIF state[0] = 1078 & FE_GIRO_R.Q THEN
	  		state[0] := 1192;
	  	ELSIF state[0] = 1078 & FE_INICIO_L1.Q THEN
	  		state[0] := 1187;
	  	ELSIF state[0] = 1078 & FE_INICIO_L2.Q THEN
	  		state[0] := 1193;
	  	ELSIF state[0] = 1079 & FE_INICIO_L1.Q THEN
	  		state[0] := 1188;
	  	ELSIF state[0] = 1079 & FE_FIN_L2.Q THEN
	  		state[0] := 1194;
	  	ELSIF state[0] = 1080 & FE_INICIO_L1.Q THEN
	  		state[0] := 1189;
	  	ELSIF state[0] = 1080 & FE_FIN_L2.Q THEN
	  		state[0] := 1195;
	  	ELSIF state[0] = 1081 & FE_AZUL.Q THEN
	  		state[0] := 1194;
	  	ELSIF state[0] = 1081 & FE_VERDE.Q THEN
	  		state[0] := 1195;
	  	ELSIF state[0] = 1081 & FE_INICIO_L1.Q THEN
	  		state[0] := 1190;
	  	ELSIF state[0] = 1081 & FE_INICIO_L2.Q THEN
	  		state[0] := 1196;
	  	ELSIF state[0] = 1082 & FE_L1.Q THEN
	  		state[0] := 1186;
	  	ELSIF state[0] = 1082 & FE_L2.Q THEN
	  		state[0] := 1196;
	  	ELSIF state[0] = 1082 & FE_INICIO_L1.Q THEN
	  		state[0] := 1191;
	  	ELSIF state[0] = 1083 & FE_DESC_R.Q THEN
	  		state[0] := 370;
	  	ELSIF state[0] = 1083 & FE_FIN_L1.Q THEN
	  		state[0] := 1192;
	  	ELSIF state[0] = 1083 & FE_INICIO_L2.Q THEN
	  		state[0] := 1197;
	  	ELSIF state[0] = 1084 & FE_GIRO_R.Q THEN
	  		state[0] := 1197;
	  	ELSIF state[0] = 1084 & FE_FIN_L1.Q THEN
	  		state[0] := 1193;
	  	ELSIF state[0] = 1084 & FE_FIN_L2.Q THEN
	  		state[0] := 1198;
	  	ELSIF state[0] = 1085 & FE_FIN_L1.Q THEN
	  		state[0] := 1194;
	  	ELSIF state[0] = 1085 & FE_INICIO_L2.Q THEN
	  		state[0] := 1199;
	  	ELSIF state[0] = 1086 & FE_FIN_L1.Q THEN
	  		state[0] := 1195;
	  	ELSIF state[0] = 1086 & FE_INICIO_L2.Q THEN
	  		state[0] := 1200;
	  	ELSIF state[0] = 1087 & FE_AZUL.Q THEN
	  		state[0] := 1199;
	  	ELSIF state[0] = 1087 & FE_VERDE.Q THEN
	  		state[0] := 1200;
	  	ELSIF state[0] = 1087 & FE_FIN_L1.Q THEN
	  		state[0] := 1196;
	  	ELSIF state[0] = 1087 & FE_FIN_L2.Q THEN
	  		state[0] := 1201;
	  	ELSIF state[0] = 1088 & FE_DESC_R.Q THEN
	  		state[0] := 371;
	  	ELSIF state[0] = 1088 & FE_INICIO_L1.Q THEN
	  		state[0] := 1197;
	  	ELSIF state[0] = 1088 & FE_FIN_L2.Q THEN
	  		state[0] := 1202;
	  	ELSIF state[0] = 1089 & FE_GIRO_R.Q THEN
	  		state[0] := 1202;
	  	ELSIF state[0] = 1089 & FE_INICIO_L1.Q THEN
	  		state[0] := 1198;
	  	ELSIF state[0] = 1089 & FE_INICIO_L2.Q THEN
	  		state[0] := 1203;
	  	ELSIF state[0] = 1090 & FE_INICIO_L1.Q THEN
	  		state[0] := 1199;
	  	ELSIF state[0] = 1090 & FE_FIN_L2.Q THEN
	  		state[0] := 1204;
	  	ELSIF state[0] = 1091 & FE_INICIO_L1.Q THEN
	  		state[0] := 1200;
	  	ELSIF state[0] = 1091 & FE_FIN_L2.Q THEN
	  		state[0] := 1205;
	  	ELSIF state[0] = 1092 & FE_AZUL.Q THEN
	  		state[0] := 1204;
	  	ELSIF state[0] = 1092 & FE_VERDE.Q THEN
	  		state[0] := 1205;
	  	ELSIF state[0] = 1092 & FE_INICIO_L1.Q THEN
	  		state[0] := 1201;
	  	ELSIF state[0] = 1092 & FE_INICIO_L2.Q THEN
	  		state[0] := 1206;
	  	ELSIF state[0] = 1093 & FE_DESC_R.Q THEN
	  		state[0] := 372;
	  	ELSIF state[0] = 1093 & FE_FIN_L1.Q THEN
	  		state[0] := 1202;
	  	ELSIF state[0] = 1093 & FE_INICIO_L2.Q THEN
	  		state[0] := 1207;
	  	ELSIF state[0] = 1094 & FE_GIRO_R.Q THEN
	  		state[0] := 1207;
	  	ELSIF state[0] = 1094 & FE_FIN_L1.Q THEN
	  		state[0] := 1203;
	  	ELSIF state[0] = 1094 & FE_FIN_L2.Q THEN
	  		state[0] := 1208;
	  	ELSIF state[0] = 1095 & FE_FIN_L1.Q THEN
	  		state[0] := 1204;
	  	ELSIF state[0] = 1095 & FE_INICIO_L2.Q THEN
	  		state[0] := 1209;
	  	ELSIF state[0] = 1096 & FE_FIN_L1.Q THEN
	  		state[0] := 1205;
	  	ELSIF state[0] = 1096 & FE_INICIO_L2.Q THEN
	  		state[0] := 1210;
	  	ELSIF state[0] = 1097 & FE_AZUL.Q THEN
	  		state[0] := 1209;
	  	ELSIF state[0] = 1097 & FE_VERDE.Q THEN
	  		state[0] := 1210;
	  	ELSIF state[0] = 1097 & FE_FIN_L1.Q THEN
	  		state[0] := 1206;
	  	ELSIF state[0] = 1098 & FE_DESC_R.Q THEN
	  		state[0] := 374;
	  	ELSIF state[0] = 1098 & FE_INICIO_L1.Q THEN
	  		state[0] := 1207;
	  	ELSIF state[0] = 1098 & FE_FIN_L2.Q THEN
	  		state[0] := 1211;
	  	ELSIF state[0] = 1099 & FE_GIRO_R.Q THEN
	  		state[0] := 1211;
	  	ELSIF state[0] = 1099 & FE_INICIO_L1.Q THEN
	  		state[0] := 1208;
	  	ELSIF state[0] = 1099 & FE_INICIO_L2.Q THEN
	  		state[0] := 1212;
	  	ELSIF state[0] = 1100 & FE_INICIO_L1.Q THEN
	  		state[0] := 1209;
	  	ELSIF state[0] = 1101 & FE_INICIO_L1.Q THEN
	  		state[0] := 1210;
	  	ELSIF state[0] = 1102 & FE_DESC_A.Q THEN
	  		state[0] := 1191;
	  	ELSIF state[0] = 1103 & FE_DESC_R.Q THEN
	  		state[0] := 434;
	  	ELSIF state[0] = 1104 & FE_DESC_R.Q THEN
	  		state[0] := 403;
	  	ELSIF state[0] = 1104 & FE_FIN_L1.Q THEN
	  		state[0] := 1213;
	  	ELSIF state[0] = 1104 & FE_INICIO_L2.Q THEN
	  		state[0] := 1214;
	  	ELSIF state[0] = 1105 & FE_DESC_R.Q THEN
	  		state[0] := 404;
	  	ELSIF state[0] = 1105 & FE_INICIO_L1.Q THEN
	  		state[0] := 1214;
	  	ELSIF state[0] = 1105 & FE_FIN_L2.Q THEN
	  		state[0] := 1215;
	  	ELSIF state[0] = 1106 & FE_DESC_R.Q THEN
	  		state[0] := 405;
	  	ELSIF state[0] = 1106 & FE_FIN_L1.Q THEN
	  		state[0] := 1215;
	  	ELSIF state[0] = 1106 & FE_INICIO_L2.Q THEN
	  		state[0] := 1216;
	  	ELSIF state[0] = 1107 & FE_DESC_R.Q THEN
	  		state[0] := 407;
	  	ELSIF state[0] = 1107 & FE_INICIO_L1.Q THEN
	  		state[0] := 1216;
	  	ELSIF state[0] = 1107 & FE_FIN_L2.Q THEN
	  		state[0] := 1217;
	  	ELSIF state[0] = 1108 & FE_GIRO_R.Q THEN
	  		state[0] := 1213;
	  	ELSIF state[0] = 1108 & FE_INICIO_L1.Q THEN
	  		state[0] := 1218;
	  	ELSIF state[0] = 1108 & FE_INICIO_L2.Q THEN
	  		state[0] := 1219;
	  	ELSIF state[0] = 1109 & FE_GIRO_R.Q THEN
	  		state[0] := 1214;
	  	ELSIF state[0] = 1109 & FE_FIN_L1.Q THEN
	  		state[0] := 1219;
	  	ELSIF state[0] = 1109 & FE_FIN_L2.Q THEN
	  		state[0] := 1220;
	  	ELSIF state[0] = 1110 & FE_GIRO_R.Q THEN
	  		state[0] := 1215;
	  	ELSIF state[0] = 1110 & FE_INICIO_L1.Q THEN
	  		state[0] := 1220;
	  	ELSIF state[0] = 1110 & FE_INICIO_L2.Q THEN
	  		state[0] := 1221;
	  	ELSIF state[0] = 1111 & FE_GIRO_R.Q THEN
	  		state[0] := 1216;
	  	ELSIF state[0] = 1111 & FE_FIN_L1.Q THEN
	  		state[0] := 1221;
	  	ELSIF state[0] = 1111 & FE_FIN_L2.Q THEN
	  		state[0] := 1222;
	  	ELSIF state[0] = 1112 & FE_GIRO_R.Q THEN
	  		state[0] := 1217;
	  	ELSIF state[0] = 1112 & FE_INICIO_L1.Q THEN
	  		state[0] := 1222;
	  	ELSIF state[0] = 1112 & FE_INICIO_L2.Q THEN
	  		state[0] := 1223;
	  	ELSIF state[0] = 1113 & FE_INICIO_L2.Q THEN
	  		state[0] := 1224;
	  	ELSIF state[0] = 1114 & FE_INICIO_L1.Q THEN
	  		state[0] := 1224;
	  	ELSIF state[0] = 1114 & FE_FIN_L2.Q THEN
	  		state[0] := 1225;
	  	ELSIF state[0] = 1115 & FE_FIN_L1.Q THEN
	  		state[0] := 1225;
	  	ELSIF state[0] = 1115 & FE_INICIO_L2.Q THEN
	  		state[0] := 1226;
	  	ELSIF state[0] = 1116 & FE_INICIO_L1.Q THEN
	  		state[0] := 1226;
	  	ELSIF state[0] = 1116 & FE_FIN_L2.Q THEN
	  		state[0] := 1227;
	  	ELSIF state[0] = 1117 & FE_FIN_L1.Q THEN
	  		state[0] := 1227;
	  	ELSIF state[0] = 1117 & FE_INICIO_L2.Q THEN
	  		state[0] := 1228;
	  	ELSIF state[0] = 1118 & FE_INICIO_L1.Q THEN
	  		state[0] := 1228;
	  	ELSIF state[0] = 1119 & FE_INICIO_L2.Q THEN
	  		state[0] := 1229;
	  	ELSIF state[0] = 1120 & FE_INICIO_L1.Q THEN
	  		state[0] := 1229;
	  	ELSIF state[0] = 1120 & FE_FIN_L2.Q THEN
	  		state[0] := 1230;
	  	ELSIF state[0] = 1121 & FE_FIN_L1.Q THEN
	  		state[0] := 1230;
	  	ELSIF state[0] = 1121 & FE_INICIO_L2.Q THEN
	  		state[0] := 1231;
	  	ELSIF state[0] = 1122 & FE_INICIO_L1.Q THEN
	  		state[0] := 1231;
	  	ELSIF state[0] = 1122 & FE_FIN_L2.Q THEN
	  		state[0] := 1232;
	  	ELSIF state[0] = 1123 & FE_FIN_L1.Q THEN
	  		state[0] := 1232;
	  	ELSIF state[0] = 1123 & FE_INICIO_L2.Q THEN
	  		state[0] := 1233;
	  	ELSIF state[0] = 1124 & FE_INICIO_L1.Q THEN
	  		state[0] := 1233;
	  	ELSIF state[0] = 1125 & FE_AZUL.Q THEN
	  		state[0] := 1224;
	  	ELSIF state[0] = 1125 & FE_VERDE.Q THEN
	  		state[0] := 1229;
	  	ELSIF state[0] = 1125 & FE_FIN_L2.Q THEN
	  		state[0] := 1234;
	  	ELSIF state[0] = 1126 & FE_AZUL.Q THEN
	  		state[0] := 1225;
	  	ELSIF state[0] = 1126 & FE_VERDE.Q THEN
	  		state[0] := 1230;
	  	ELSIF state[0] = 1126 & FE_INICIO_L1.Q THEN
	  		state[0] := 1234;
	  	ELSIF state[0] = 1126 & FE_INICIO_L2.Q THEN
	  		state[0] := 1235;
	  	ELSIF state[0] = 1127 & FE_AZUL.Q THEN
	  		state[0] := 1226;
	  	ELSIF state[0] = 1127 & FE_VERDE.Q THEN
	  		state[0] := 1231;
	  	ELSIF state[0] = 1127 & FE_FIN_L1.Q THEN
	  		state[0] := 1235;
	  	ELSIF state[0] = 1127 & FE_FIN_L2.Q THEN
	  		state[0] := 1236;
	  	ELSIF state[0] = 1128 & FE_AZUL.Q THEN
	  		state[0] := 1227;
	  	ELSIF state[0] = 1128 & FE_VERDE.Q THEN
	  		state[0] := 1232;
	  	ELSIF state[0] = 1128 & FE_INICIO_L1.Q THEN
	  		state[0] := 1236;
	  	ELSIF state[0] = 1128 & FE_INICIO_L2.Q THEN
	  		state[0] := 1237;
	  	ELSIF state[0] = 1129 & FE_AZUL.Q THEN
	  		state[0] := 1228;
	  	ELSIF state[0] = 1129 & FE_VERDE.Q THEN
	  		state[0] := 1233;
	  	ELSIF state[0] = 1129 & FE_FIN_L1.Q THEN
	  		state[0] := 1237;
	  	ELSIF state[0] = 1130 & FE_INICIO_L2.Q THEN
	  		state[0] := 1239;
	  	ELSIF state[0] = 1131 & FE_INICIO_L2.Q THEN
	  		state[0] := 1240;
	  	ELSIF state[0] = 1132 & FE_AZUL.Q THEN
	  		state[0] := 1239;
	  	ELSIF state[0] = 1132 & FE_VERDE.Q THEN
	  		state[0] := 1240;
	  	ELSIF state[0] = 1132 & FE_FIN_L2.Q THEN
	  		state[0] := 1241;
	  	ELSIF state[0] = 1133 & FE_L1.Q THEN
	  		state[0] := 1236;
	  	ELSIF state[0] = 1133 & FE_L2.Q THEN
	  		state[0] := 1241;
	  	ELSIF state[0] = 1133 & FE_INICIO_L2.Q THEN
	  		state[0] := 1242;
	  	ELSIF state[0] = 1134 & FE_GIRO_R.Q THEN
	  		state[0] := 1243;
	  	ELSIF state[0] = 1134 & FE_INICIO_L1.Q THEN
	  		state[0] := 1238;
	  	ELSIF state[0] = 1134 & FE_INICIO_L2.Q THEN
	  		state[0] := 1244;
	  	ELSIF state[0] = 1135 & FE_INICIO_L1.Q THEN
	  		state[0] := 1239;
	  	ELSIF state[0] = 1135 & FE_FIN_L2.Q THEN
	  		state[0] := 1245;
	  	ELSIF state[0] = 1136 & FE_INICIO_L1.Q THEN
	  		state[0] := 1240;
	  	ELSIF state[0] = 1136 & FE_FIN_L2.Q THEN
	  		state[0] := 1246;
	  	ELSIF state[0] = 1137 & FE_AZUL.Q THEN
	  		state[0] := 1245;
	  	ELSIF state[0] = 1137 & FE_VERDE.Q THEN
	  		state[0] := 1246;
	  	ELSIF state[0] = 1137 & FE_INICIO_L1.Q THEN
	  		state[0] := 1241;
	  	ELSIF state[0] = 1137 & FE_INICIO_L2.Q THEN
	  		state[0] := 1247;
	  	ELSIF state[0] = 1138 & FE_L1.Q THEN
	  		state[0] := 1237;
	  	ELSIF state[0] = 1138 & FE_L2.Q THEN
	  		state[0] := 1247;
	  	ELSIF state[0] = 1138 & FE_INICIO_L1.Q THEN
	  		state[0] := 1242;
	  	ELSIF state[0] = 1139 & FE_DESC_R.Q THEN
	  		state[0] := 403;
	  	ELSIF state[0] = 1139 & FE_FIN_L1.Q THEN
	  		state[0] := 1243;
	  	ELSIF state[0] = 1139 & FE_INICIO_L2.Q THEN
	  		state[0] := 1248;
	  	ELSIF state[0] = 1140 & FE_GIRO_R.Q THEN
	  		state[0] := 1248;
	  	ELSIF state[0] = 1140 & FE_FIN_L1.Q THEN
	  		state[0] := 1244;
	  	ELSIF state[0] = 1140 & FE_FIN_L2.Q THEN
	  		state[0] := 1249;
	  	ELSIF state[0] = 1141 & FE_FIN_L1.Q THEN
	  		state[0] := 1245;
	  	ELSIF state[0] = 1141 & FE_INICIO_L2.Q THEN
	  		state[0] := 1250;
	  	ELSIF state[0] = 1142 & FE_FIN_L1.Q THEN
	  		state[0] := 1246;
	  	ELSIF state[0] = 1142 & FE_INICIO_L2.Q THEN
	  		state[0] := 1251;
	  	ELSIF state[0] = 1143 & FE_AZUL.Q THEN
	  		state[0] := 1250;
	  	ELSIF state[0] = 1143 & FE_VERDE.Q THEN
	  		state[0] := 1251;
	  	ELSIF state[0] = 1143 & FE_FIN_L1.Q THEN
	  		state[0] := 1247;
	  	ELSIF state[0] = 1143 & FE_FIN_L2.Q THEN
	  		state[0] := 1252;
	  	ELSIF state[0] = 1144 & FE_DESC_R.Q THEN
	  		state[0] := 404;
	  	ELSIF state[0] = 1144 & FE_INICIO_L1.Q THEN
	  		state[0] := 1248;
	  	ELSIF state[0] = 1144 & FE_FIN_L2.Q THEN
	  		state[0] := 1253;
	  	ELSIF state[0] = 1145 & FE_GIRO_R.Q THEN
	  		state[0] := 1253;
	  	ELSIF state[0] = 1145 & FE_INICIO_L1.Q THEN
	  		state[0] := 1249;
	  	ELSIF state[0] = 1145 & FE_INICIO_L2.Q THEN
	  		state[0] := 1254;
	  	ELSIF state[0] = 1146 & FE_INICIO_L1.Q THEN
	  		state[0] := 1250;
	  	ELSIF state[0] = 1146 & FE_FIN_L2.Q THEN
	  		state[0] := 1255;
	  	ELSIF state[0] = 1147 & FE_INICIO_L1.Q THEN
	  		state[0] := 1251;
	  	ELSIF state[0] = 1147 & FE_FIN_L2.Q THEN
	  		state[0] := 1256;
	  	ELSIF state[0] = 1148 & FE_AZUL.Q THEN
	  		state[0] := 1255;
	  	ELSIF state[0] = 1148 & FE_VERDE.Q THEN
	  		state[0] := 1256;
	  	ELSIF state[0] = 1148 & FE_INICIO_L1.Q THEN
	  		state[0] := 1252;
	  	ELSIF state[0] = 1148 & FE_INICIO_L2.Q THEN
	  		state[0] := 1257;
	  	ELSIF state[0] = 1149 & FE_DESC_R.Q THEN
	  		state[0] := 405;
	  	ELSIF state[0] = 1149 & FE_FIN_L1.Q THEN
	  		state[0] := 1253;
	  	ELSIF state[0] = 1149 & FE_INICIO_L2.Q THEN
	  		state[0] := 1258;
	  	ELSIF state[0] = 1150 & FE_GIRO_R.Q THEN
	  		state[0] := 1258;
	  	ELSIF state[0] = 1150 & FE_FIN_L1.Q THEN
	  		state[0] := 1254;
	  	ELSIF state[0] = 1150 & FE_FIN_L2.Q THEN
	  		state[0] := 1259;
	  	ELSIF state[0] = 1151 & FE_FIN_L1.Q THEN
	  		state[0] := 1255;
	  	ELSIF state[0] = 1151 & FE_INICIO_L2.Q THEN
	  		state[0] := 1260;
	  	ELSIF state[0] = 1152 & FE_FIN_L1.Q THEN
	  		state[0] := 1256;
	  	ELSIF state[0] = 1152 & FE_INICIO_L2.Q THEN
	  		state[0] := 1261;
	  	ELSIF state[0] = 1153 & FE_AZUL.Q THEN
	  		state[0] := 1260;
	  	ELSIF state[0] = 1153 & FE_VERDE.Q THEN
	  		state[0] := 1261;
	  	ELSIF state[0] = 1153 & FE_FIN_L1.Q THEN
	  		state[0] := 1257;
	  	ELSIF state[0] = 1154 & FE_DESC_R.Q THEN
	  		state[0] := 407;
	  	ELSIF state[0] = 1154 & FE_INICIO_L1.Q THEN
	  		state[0] := 1258;
	  	ELSIF state[0] = 1154 & FE_FIN_L2.Q THEN
	  		state[0] := 1262;
	  	ELSIF state[0] = 1155 & FE_GIRO_R.Q THEN
	  		state[0] := 1262;
	  	ELSIF state[0] = 1155 & FE_INICIO_L1.Q THEN
	  		state[0] := 1259;
	  	ELSIF state[0] = 1155 & FE_INICIO_L2.Q THEN
	  		state[0] := 1263;
	  	ELSIF state[0] = 1156 & FE_INICIO_L1.Q THEN
	  		state[0] := 1260;
	  	ELSIF state[0] = 1157 & FE_INICIO_L1.Q THEN
	  		state[0] := 1261;
	  	ELSIF state[0] = 1158 & FE_DESC_A.Q THEN
	  		state[0] := 1242;
	  	ELSIF state[0] = 1159 & FE_DESC_A.Q THEN
	  		state[0] := 1191;
	  	ELSIF state[0] = 1160 & FE_DESC_R.Q THEN
	  		state[0] := 434;
	  	ELSIF state[0] = 1161 & FE_DESC_A.Q THEN
	  		state[0] := 1242;
	  	ELSIF state[0] = 1162 & FE_DESC_R.Q THEN
	  		state[0] := 480;
	  	ELSIF state[0] = 1162 & FE_INICIO_L1.Q THEN
	  		state[0] := 1264;
	  	ELSIF state[0] = 1162 & FE_INICIO_L2.Q THEN
	  		state[0] := 1265;
	  	ELSIF state[0] = 1163 & FE_DESC_R.Q THEN
	  		state[0] := 481;
	  	ELSIF state[0] = 1163 & FE_FIN_L1.Q THEN
	  		state[0] := 1265;
	  	ELSIF state[0] = 1163 & FE_FIN_L2.Q THEN
	  		state[0] := 1266;
	  	ELSIF state[0] = 1164 & FE_DESC_R.Q THEN
	  		state[0] := 482;
	  	ELSIF state[0] = 1164 & FE_INICIO_L1.Q THEN
	  		state[0] := 1266;
	  	ELSIF state[0] = 1164 & FE_INICIO_L2.Q THEN
	  		state[0] := 1267;
	  	ELSIF state[0] = 1165 & FE_DESC_R.Q THEN
	  		state[0] := 484;
	  	ELSIF state[0] = 1165 & FE_FIN_L1.Q THEN
	  		state[0] := 1267;
	  	ELSIF state[0] = 1165 & FE_FIN_L2.Q THEN
	  		state[0] := 1268;
	  	ELSIF state[0] = 1166 & FE_DESC_R.Q THEN
	  		state[0] := 488;
	  	ELSIF state[0] = 1166 & FE_INICIO_L1.Q THEN
	  		state[0] := 1268;
	  	ELSIF state[0] = 1166 & FE_INICIO_L2.Q THEN
	  		state[0] := 1269;
	  	ELSIF state[0] = 1167 & FE_GIRO_R.Q THEN
	  		state[0] := 1264;
	  	ELSIF state[0] = 1167 & FE_INICIO_L2.Q THEN
	  		state[0] := 1270;
	  	ELSIF state[0] = 1168 & FE_GIRO_R.Q THEN
	  		state[0] := 1265;
	  	ELSIF state[0] = 1168 & FE_INICIO_L1.Q THEN
	  		state[0] := 1270;
	  	ELSIF state[0] = 1168 & FE_FIN_L2.Q THEN
	  		state[0] := 1271;
	  	ELSIF state[0] = 1169 & FE_GIRO_R.Q THEN
	  		state[0] := 1266;
	  	ELSIF state[0] = 1169 & FE_FIN_L1.Q THEN
	  		state[0] := 1271;
	  	ELSIF state[0] = 1169 & FE_INICIO_L2.Q THEN
	  		state[0] := 1272;
	  	ELSIF state[0] = 1170 & FE_GIRO_R.Q THEN
	  		state[0] := 1267;
	  	ELSIF state[0] = 1170 & FE_INICIO_L1.Q THEN
	  		state[0] := 1272;
	  	ELSIF state[0] = 1170 & FE_FIN_L2.Q THEN
	  		state[0] := 1273;
	  	ELSIF state[0] = 1171 & FE_GIRO_R.Q THEN
	  		state[0] := 1268;
	  	ELSIF state[0] = 1171 & FE_FIN_L1.Q THEN
	  		state[0] := 1273;
	  	ELSIF state[0] = 1171 & FE_INICIO_L2.Q THEN
	  		state[0] := 1274;
	  	ELSIF state[0] = 1172 & FE_GIRO_R.Q THEN
	  		state[0] := 1269;
	  	ELSIF state[0] = 1172 & FE_INICIO_L1.Q THEN
	  		state[0] := 1274;
	  	ELSIF state[0] = 1173 & FE_FIN_L2.Q THEN
	  		state[0] := 1275;
	  	ELSIF state[0] = 1174 & FE_INICIO_L1.Q THEN
	  		state[0] := 1275;
	  	ELSIF state[0] = 1174 & FE_INICIO_L2.Q THEN
	  		state[0] := 1276;
	  	ELSIF state[0] = 1175 & FE_FIN_L1.Q THEN
	  		state[0] := 1276;
	  	ELSIF state[0] = 1175 & FE_FIN_L2.Q THEN
	  		state[0] := 1277;
	  	ELSIF state[0] = 1176 & FE_INICIO_L1.Q THEN
	  		state[0] := 1277;
	  	ELSIF state[0] = 1176 & FE_INICIO_L2.Q THEN
	  		state[0] := 1278;
	  	ELSIF state[0] = 1177 & FE_FIN_L1.Q THEN
	  		state[0] := 1278;
	  	ELSIF state[0] = 1178 & FE_FIN_L2.Q THEN
	  		state[0] := 1279;
	  	ELSIF state[0] = 1179 & FE_INICIO_L1.Q THEN
	  		state[0] := 1279;
	  	ELSIF state[0] = 1179 & FE_INICIO_L2.Q THEN
	  		state[0] := 1280;
	  	ELSIF state[0] = 1180 & FE_FIN_L1.Q THEN
	  		state[0] := 1280;
	  	ELSIF state[0] = 1180 & FE_FIN_L2.Q THEN
	  		state[0] := 1281;
	  	ELSIF state[0] = 1181 & FE_INICIO_L1.Q THEN
	  		state[0] := 1281;
	  	ELSIF state[0] = 1181 & FE_INICIO_L2.Q THEN
	  		state[0] := 1282;
	  	ELSIF state[0] = 1182 & FE_FIN_L1.Q THEN
	  		state[0] := 1282;
	  	ELSIF state[0] = 1183 & FE_AZUL.Q THEN
	  		state[0] := 1275;
	  	ELSIF state[0] = 1183 & FE_VERDE.Q THEN
	  		state[0] := 1279;
	  	ELSIF state[0] = 1183 & FE_INICIO_L2.Q THEN
	  		state[0] := 1283;
	  	ELSIF state[0] = 1184 & FE_AZUL.Q THEN
	  		state[0] := 1276;
	  	ELSIF state[0] = 1184 & FE_VERDE.Q THEN
	  		state[0] := 1280;
	  	ELSIF state[0] = 1184 & FE_INICIO_L1.Q THEN
	  		state[0] := 1283;
	  	ELSIF state[0] = 1184 & FE_FIN_L2.Q THEN
	  		state[0] := 1284;
	  	ELSIF state[0] = 1185 & FE_AZUL.Q THEN
	  		state[0] := 1277;
	  	ELSIF state[0] = 1185 & FE_VERDE.Q THEN
	  		state[0] := 1281;
	  	ELSIF state[0] = 1185 & FE_FIN_L1.Q THEN
	  		state[0] := 1284;
	  	ELSIF state[0] = 1185 & FE_INICIO_L2.Q THEN
	  		state[0] := 1285;
	  	ELSIF state[0] = 1186 & FE_AZUL.Q THEN
	  		state[0] := 1278;
	  	ELSIF state[0] = 1186 & FE_VERDE.Q THEN
	  		state[0] := 1282;
	  	ELSIF state[0] = 1186 & FE_INICIO_L1.Q THEN
	  		state[0] := 1285;
	  	ELSIF state[0] = 1187 & FE_GIRO_R.Q THEN
	  		state[0] := 1286;
	  	ELSIF state[0] = 1187 & FE_INICIO_L2.Q THEN
	  		state[0] := 1287;
	  	ELSIF state[0] = 1188 & FE_FIN_L2.Q THEN
	  		state[0] := 1288;
	  	ELSIF state[0] = 1189 & FE_FIN_L2.Q THEN
	  		state[0] := 1289;
	  	ELSIF state[0] = 1190 & FE_AZUL.Q THEN
	  		state[0] := 1288;
	  	ELSIF state[0] = 1190 & FE_VERDE.Q THEN
	  		state[0] := 1289;
	  	ELSIF state[0] = 1190 & FE_INICIO_L2.Q THEN
	  		state[0] := 1290;
	  	ELSIF state[0] = 1191 & FE_L1.Q THEN
	  		state[0] := 1285;
	  	ELSIF state[0] = 1191 & FE_L2.Q THEN
	  		state[0] := 1290;
	  	ELSIF state[0] = 1192 & FE_DESC_R.Q THEN
	  		state[0] := 480;
	  	ELSIF state[0] = 1192 & FE_INICIO_L1.Q THEN
	  		state[0] := 1286;
	  	ELSIF state[0] = 1192 & FE_INICIO_L2.Q THEN
	  		state[0] := 1291;
	  	ELSIF state[0] = 1193 & FE_GIRO_R.Q THEN
	  		state[0] := 1291;
	  	ELSIF state[0] = 1193 & FE_INICIO_L1.Q THEN
	  		state[0] := 1287;
	  	ELSIF state[0] = 1193 & FE_FIN_L2.Q THEN
	  		state[0] := 1292;
	  	ELSIF state[0] = 1194 & FE_INICIO_L1.Q THEN
	  		state[0] := 1288;
	  	ELSIF state[0] = 1194 & FE_INICIO_L2.Q THEN
	  		state[0] := 1293;
	  	ELSIF state[0] = 1195 & FE_INICIO_L1.Q THEN
	  		state[0] := 1289;
	  	ELSIF state[0] = 1195 & FE_INICIO_L2.Q THEN
	  		state[0] := 1294;
	  	ELSIF state[0] = 1196 & FE_AZUL.Q THEN
	  		state[0] := 1293;
	  	ELSIF state[0] = 1196 & FE_VERDE.Q THEN
	  		state[0] := 1294;
	  	ELSIF state[0] = 1196 & FE_INICIO_L1.Q THEN
	  		state[0] := 1290;
	  	ELSIF state[0] = 1196 & FE_FIN_L2.Q THEN
	  		state[0] := 1295;
	  	ELSIF state[0] = 1197 & FE_DESC_R.Q THEN
	  		state[0] := 481;
	  	ELSIF state[0] = 1197 & FE_FIN_L1.Q THEN
	  		state[0] := 1291;
	  	ELSIF state[0] = 1197 & FE_FIN_L2.Q THEN
	  		state[0] := 1296;
	  	ELSIF state[0] = 1198 & FE_GIRO_R.Q THEN
	  		state[0] := 1296;
	  	ELSIF state[0] = 1198 & FE_FIN_L1.Q THEN
	  		state[0] := 1292;
	  	ELSIF state[0] = 1198 & FE_INICIO_L2.Q THEN
	  		state[0] := 1297;
	  	ELSIF state[0] = 1199 & FE_FIN_L1.Q THEN
	  		state[0] := 1293;
	  	ELSIF state[0] = 1199 & FE_FIN_L2.Q THEN
	  		state[0] := 1298;
	  	ELSIF state[0] = 1200 & FE_FIN_L1.Q THEN
	  		state[0] := 1294;
	  	ELSIF state[0] = 1200 & FE_FIN_L2.Q THEN
	  		state[0] := 1299;
	  	ELSIF state[0] = 1201 & FE_AZUL.Q THEN
	  		state[0] := 1298;
	  	ELSIF state[0] = 1201 & FE_VERDE.Q THEN
	  		state[0] := 1299;
	  	ELSIF state[0] = 1201 & FE_FIN_L1.Q THEN
	  		state[0] := 1295;
	  	ELSIF state[0] = 1201 & FE_INICIO_L2.Q THEN
	  		state[0] := 1300;
	  	ELSIF state[0] = 1202 & FE_DESC_R.Q THEN
	  		state[0] := 482;
	  	ELSIF state[0] = 1202 & FE_INICIO_L1.Q THEN
	  		state[0] := 1296;
	  	ELSIF state[0] = 1202 & FE_INICIO_L2.Q THEN
	  		state[0] := 1301;
	  	ELSIF state[0] = 1203 & FE_GIRO_R.Q THEN
	  		state[0] := 1301;
	  	ELSIF state[0] = 1203 & FE_INICIO_L1.Q THEN
	  		state[0] := 1297;
	  	ELSIF state[0] = 1203 & FE_FIN_L2.Q THEN
	  		state[0] := 1302;
	  	ELSIF state[0] = 1204 & FE_INICIO_L1.Q THEN
	  		state[0] := 1298;
	  	ELSIF state[0] = 1204 & FE_INICIO_L2.Q THEN
	  		state[0] := 1303;
	  	ELSIF state[0] = 1205 & FE_INICIO_L1.Q THEN
	  		state[0] := 1299;
	  	ELSIF state[0] = 1205 & FE_INICIO_L2.Q THEN
	  		state[0] := 1304;
	  	ELSIF state[0] = 1206 & FE_AZUL.Q THEN
	  		state[0] := 1303;
	  	ELSIF state[0] = 1206 & FE_VERDE.Q THEN
	  		state[0] := 1304;
	  	ELSIF state[0] = 1206 & FE_INICIO_L1.Q THEN
	  		state[0] := 1300;
	  	ELSIF state[0] = 1207 & FE_DESC_R.Q THEN
	  		state[0] := 484;
	  	ELSIF state[0] = 1207 & FE_FIN_L1.Q THEN
	  		state[0] := 1301;
	  	ELSIF state[0] = 1207 & FE_FIN_L2.Q THEN
	  		state[0] := 1305;
	  	ELSIF state[0] = 1208 & FE_GIRO_R.Q THEN
	  		state[0] := 1305;
	  	ELSIF state[0] = 1208 & FE_FIN_L1.Q THEN
	  		state[0] := 1302;
	  	ELSIF state[0] = 1208 & FE_INICIO_L2.Q THEN
	  		state[0] := 1306;
	  	ELSIF state[0] = 1209 & FE_FIN_L1.Q THEN
	  		state[0] := 1303;
	  	ELSIF state[0] = 1210 & FE_FIN_L1.Q THEN
	  		state[0] := 1304;
	  	ELSIF state[0] = 1211 & FE_DESC_R.Q THEN
	  		state[0] := 488;
	  	ELSIF state[0] = 1211 & FE_INICIO_L1.Q THEN
	  		state[0] := 1305;
	  	ELSIF state[0] = 1211 & FE_INICIO_L2.Q THEN
	  		state[0] := 1307;
	  	ELSIF state[0] = 1212 & FE_GIRO_R.Q THEN
	  		state[0] := 1307;
	  	ELSIF state[0] = 1212 & FE_INICIO_L1.Q THEN
	  		state[0] := 1306;
	  	ELSIF state[0] = 1213 & FE_DESC_R.Q THEN
	  		state[0] := 519;
	  	ELSIF state[0] = 1213 & FE_INICIO_L1.Q THEN
	  		state[0] := 1308;
	  	ELSIF state[0] = 1213 & FE_INICIO_L2.Q THEN
	  		state[0] := 1309;
	  	ELSIF state[0] = 1214 & FE_DESC_R.Q THEN
	  		state[0] := 520;
	  	ELSIF state[0] = 1214 & FE_FIN_L1.Q THEN
	  		state[0] := 1309;
	  	ELSIF state[0] = 1214 & FE_FIN_L2.Q THEN
	  		state[0] := 1310;
	  	ELSIF state[0] = 1215 & FE_DESC_R.Q THEN
	  		state[0] := 521;
	  	ELSIF state[0] = 1215 & FE_INICIO_L1.Q THEN
	  		state[0] := 1310;
	  	ELSIF state[0] = 1215 & FE_INICIO_L2.Q THEN
	  		state[0] := 1311;
	  	ELSIF state[0] = 1216 & FE_DESC_R.Q THEN
	  		state[0] := 523;
	  	ELSIF state[0] = 1216 & FE_FIN_L1.Q THEN
	  		state[0] := 1311;
	  	ELSIF state[0] = 1216 & FE_FIN_L2.Q THEN
	  		state[0] := 1312;
	  	ELSIF state[0] = 1217 & FE_DESC_R.Q THEN
	  		state[0] := 527;
	  	ELSIF state[0] = 1217 & FE_INICIO_L1.Q THEN
	  		state[0] := 1312;
	  	ELSIF state[0] = 1217 & FE_INICIO_L2.Q THEN
	  		state[0] := 1313;
	  	ELSIF state[0] = 1218 & FE_GIRO_R.Q THEN
	  		state[0] := 1308;
	  	ELSIF state[0] = 1218 & FE_INICIO_L2.Q THEN
	  		state[0] := 1314;
	  	ELSIF state[0] = 1219 & FE_GIRO_R.Q THEN
	  		state[0] := 1309;
	  	ELSIF state[0] = 1219 & FE_INICIO_L1.Q THEN
	  		state[0] := 1314;
	  	ELSIF state[0] = 1219 & FE_FIN_L2.Q THEN
	  		state[0] := 1315;
	  	ELSIF state[0] = 1220 & FE_GIRO_R.Q THEN
	  		state[0] := 1310;
	  	ELSIF state[0] = 1220 & FE_FIN_L1.Q THEN
	  		state[0] := 1315;
	  	ELSIF state[0] = 1220 & FE_INICIO_L2.Q THEN
	  		state[0] := 1316;
	  	ELSIF state[0] = 1221 & FE_GIRO_R.Q THEN
	  		state[0] := 1311;
	  	ELSIF state[0] = 1221 & FE_INICIO_L1.Q THEN
	  		state[0] := 1316;
	  	ELSIF state[0] = 1221 & FE_FIN_L2.Q THEN
	  		state[0] := 1317;
	  	ELSIF state[0] = 1222 & FE_GIRO_R.Q THEN
	  		state[0] := 1312;
	  	ELSIF state[0] = 1222 & FE_FIN_L1.Q THEN
	  		state[0] := 1317;
	  	ELSIF state[0] = 1222 & FE_INICIO_L2.Q THEN
	  		state[0] := 1318;
	  	ELSIF state[0] = 1223 & FE_GIRO_R.Q THEN
	  		state[0] := 1313;
	  	ELSIF state[0] = 1223 & FE_INICIO_L1.Q THEN
	  		state[0] := 1318;
	  	ELSIF state[0] = 1224 & FE_FIN_L2.Q THEN
	  		state[0] := 1319;
	  	ELSIF state[0] = 1225 & FE_INICIO_L1.Q THEN
	  		state[0] := 1319;
	  	ELSIF state[0] = 1225 & FE_INICIO_L2.Q THEN
	  		state[0] := 1320;
	  	ELSIF state[0] = 1226 & FE_FIN_L1.Q THEN
	  		state[0] := 1320;
	  	ELSIF state[0] = 1226 & FE_FIN_L2.Q THEN
	  		state[0] := 1321;
	  	ELSIF state[0] = 1227 & FE_INICIO_L1.Q THEN
	  		state[0] := 1321;
	  	ELSIF state[0] = 1227 & FE_INICIO_L2.Q THEN
	  		state[0] := 1322;
	  	ELSIF state[0] = 1228 & FE_FIN_L1.Q THEN
	  		state[0] := 1322;
	  	ELSIF state[0] = 1229 & FE_FIN_L2.Q THEN
	  		state[0] := 1323;
	  	ELSIF state[0] = 1230 & FE_INICIO_L1.Q THEN
	  		state[0] := 1323;
	  	ELSIF state[0] = 1230 & FE_INICIO_L2.Q THEN
	  		state[0] := 1324;
	  	ELSIF state[0] = 1231 & FE_FIN_L1.Q THEN
	  		state[0] := 1324;
	  	ELSIF state[0] = 1231 & FE_FIN_L2.Q THEN
	  		state[0] := 1325;
	  	ELSIF state[0] = 1232 & FE_INICIO_L1.Q THEN
	  		state[0] := 1325;
	  	ELSIF state[0] = 1232 & FE_INICIO_L2.Q THEN
	  		state[0] := 1326;
	  	ELSIF state[0] = 1233 & FE_FIN_L1.Q THEN
	  		state[0] := 1326;
	  	ELSIF state[0] = 1234 & FE_AZUL.Q THEN
	  		state[0] := 1319;
	  	ELSIF state[0] = 1234 & FE_VERDE.Q THEN
	  		state[0] := 1323;
	  	ELSIF state[0] = 1234 & FE_INICIO_L2.Q THEN
	  		state[0] := 1327;
	  	ELSIF state[0] = 1235 & FE_AZUL.Q THEN
	  		state[0] := 1320;
	  	ELSIF state[0] = 1235 & FE_VERDE.Q THEN
	  		state[0] := 1324;
	  	ELSIF state[0] = 1235 & FE_INICIO_L1.Q THEN
	  		state[0] := 1327;
	  	ELSIF state[0] = 1235 & FE_FIN_L2.Q THEN
	  		state[0] := 1328;
	  	ELSIF state[0] = 1236 & FE_AZUL.Q THEN
	  		state[0] := 1321;
	  	ELSIF state[0] = 1236 & FE_VERDE.Q THEN
	  		state[0] := 1325;
	  	ELSIF state[0] = 1236 & FE_FIN_L1.Q THEN
	  		state[0] := 1328;
	  	ELSIF state[0] = 1236 & FE_INICIO_L2.Q THEN
	  		state[0] := 1329;
	  	ELSIF state[0] = 1237 & FE_AZUL.Q THEN
	  		state[0] := 1322;
	  	ELSIF state[0] = 1237 & FE_VERDE.Q THEN
	  		state[0] := 1326;
	  	ELSIF state[0] = 1237 & FE_INICIO_L1.Q THEN
	  		state[0] := 1329;
	  	ELSIF state[0] = 1238 & FE_GIRO_R.Q THEN
	  		state[0] := 1330;
	  	ELSIF state[0] = 1238 & FE_INICIO_L2.Q THEN
	  		state[0] := 1331;
	  	ELSIF state[0] = 1239 & FE_FIN_L2.Q THEN
	  		state[0] := 1332;
	  	ELSIF state[0] = 1240 & FE_FIN_L2.Q THEN
	  		state[0] := 1333;
	  	ELSIF state[0] = 1241 & FE_AZUL.Q THEN
	  		state[0] := 1332;
	  	ELSIF state[0] = 1241 & FE_VERDE.Q THEN
	  		state[0] := 1333;
	  	ELSIF state[0] = 1241 & FE_INICIO_L2.Q THEN
	  		state[0] := 1334;
	  	ELSIF state[0] = 1242 & FE_L1.Q THEN
	  		state[0] := 1329;
	  	ELSIF state[0] = 1242 & FE_L2.Q THEN
	  		state[0] := 1334;
	  	ELSIF state[0] = 1243 & FE_DESC_R.Q THEN
	  		state[0] := 519;
	  	ELSIF state[0] = 1243 & FE_INICIO_L1.Q THEN
	  		state[0] := 1330;
	  	ELSIF state[0] = 1243 & FE_INICIO_L2.Q THEN
	  		state[0] := 1335;
	  	ELSIF state[0] = 1244 & FE_GIRO_R.Q THEN
	  		state[0] := 1335;
	  	ELSIF state[0] = 1244 & FE_INICIO_L1.Q THEN
	  		state[0] := 1331;
	  	ELSIF state[0] = 1244 & FE_FIN_L2.Q THEN
	  		state[0] := 1336;
	  	ELSIF state[0] = 1245 & FE_INICIO_L1.Q THEN
	  		state[0] := 1332;
	  	ELSIF state[0] = 1245 & FE_INICIO_L2.Q THEN
	  		state[0] := 1337;
	  	ELSIF state[0] = 1246 & FE_INICIO_L1.Q THEN
	  		state[0] := 1333;
	  	ELSIF state[0] = 1246 & FE_INICIO_L2.Q THEN
	  		state[0] := 1338;
	  	ELSIF state[0] = 1247 & FE_AZUL.Q THEN
	  		state[0] := 1337;
	  	ELSIF state[0] = 1247 & FE_VERDE.Q THEN
	  		state[0] := 1338;
	  	ELSIF state[0] = 1247 & FE_INICIO_L1.Q THEN
	  		state[0] := 1334;
	  	ELSIF state[0] = 1247 & FE_FIN_L2.Q THEN
	  		state[0] := 1339;
	  	ELSIF state[0] = 1248 & FE_DESC_R.Q THEN
	  		state[0] := 520;
	  	ELSIF state[0] = 1248 & FE_FIN_L1.Q THEN
	  		state[0] := 1335;
	  	ELSIF state[0] = 1248 & FE_FIN_L2.Q THEN
	  		state[0] := 1340;
	  	ELSIF state[0] = 1249 & FE_GIRO_R.Q THEN
	  		state[0] := 1340;
	  	ELSIF state[0] = 1249 & FE_FIN_L1.Q THEN
	  		state[0] := 1336;
	  	ELSIF state[0] = 1249 & FE_INICIO_L2.Q THEN
	  		state[0] := 1341;
	  	ELSIF state[0] = 1250 & FE_FIN_L1.Q THEN
	  		state[0] := 1337;
	  	ELSIF state[0] = 1250 & FE_FIN_L2.Q THEN
	  		state[0] := 1342;
	  	ELSIF state[0] = 1251 & FE_FIN_L1.Q THEN
	  		state[0] := 1338;
	  	ELSIF state[0] = 1251 & FE_FIN_L2.Q THEN
	  		state[0] := 1343;
	  	ELSIF state[0] = 1252 & FE_AZUL.Q THEN
	  		state[0] := 1342;
	  	ELSIF state[0] = 1252 & FE_VERDE.Q THEN
	  		state[0] := 1343;
	  	ELSIF state[0] = 1252 & FE_FIN_L1.Q THEN
	  		state[0] := 1339;
	  	ELSIF state[0] = 1252 & FE_INICIO_L2.Q THEN
	  		state[0] := 1344;
	  	ELSIF state[0] = 1253 & FE_DESC_R.Q THEN
	  		state[0] := 521;
	  	ELSIF state[0] = 1253 & FE_INICIO_L1.Q THEN
	  		state[0] := 1340;
	  	ELSIF state[0] = 1253 & FE_INICIO_L2.Q THEN
	  		state[0] := 1345;
	  	ELSIF state[0] = 1254 & FE_GIRO_R.Q THEN
	  		state[0] := 1345;
	  	ELSIF state[0] = 1254 & FE_INICIO_L1.Q THEN
	  		state[0] := 1341;
	  	ELSIF state[0] = 1254 & FE_FIN_L2.Q THEN
	  		state[0] := 1346;
	  	ELSIF state[0] = 1255 & FE_INICIO_L1.Q THEN
	  		state[0] := 1342;
	  	ELSIF state[0] = 1255 & FE_INICIO_L2.Q THEN
	  		state[0] := 1347;
	  	ELSIF state[0] = 1256 & FE_INICIO_L1.Q THEN
	  		state[0] := 1343;
	  	ELSIF state[0] = 1256 & FE_INICIO_L2.Q THEN
	  		state[0] := 1348;
	  	ELSIF state[0] = 1257 & FE_AZUL.Q THEN
	  		state[0] := 1347;
	  	ELSIF state[0] = 1257 & FE_VERDE.Q THEN
	  		state[0] := 1348;
	  	ELSIF state[0] = 1257 & FE_INICIO_L1.Q THEN
	  		state[0] := 1344;
	  	ELSIF state[0] = 1258 & FE_DESC_R.Q THEN
	  		state[0] := 523;
	  	ELSIF state[0] = 1258 & FE_FIN_L1.Q THEN
	  		state[0] := 1345;
	  	ELSIF state[0] = 1258 & FE_FIN_L2.Q THEN
	  		state[0] := 1349;
	  	ELSIF state[0] = 1259 & FE_GIRO_R.Q THEN
	  		state[0] := 1349;
	  	ELSIF state[0] = 1259 & FE_FIN_L1.Q THEN
	  		state[0] := 1346;
	  	ELSIF state[0] = 1259 & FE_INICIO_L2.Q THEN
	  		state[0] := 1350;
	  	ELSIF state[0] = 1260 & FE_FIN_L1.Q THEN
	  		state[0] := 1347;
	  	ELSIF state[0] = 1261 & FE_FIN_L1.Q THEN
	  		state[0] := 1348;
	  	ELSIF state[0] = 1262 & FE_DESC_R.Q THEN
	  		state[0] := 527;
	  	ELSIF state[0] = 1262 & FE_INICIO_L1.Q THEN
	  		state[0] := 1349;
	  	ELSIF state[0] = 1262 & FE_INICIO_L2.Q THEN
	  		state[0] := 1351;
	  	ELSIF state[0] = 1263 & FE_GIRO_R.Q THEN
	  		state[0] := 1351;
	  	ELSIF state[0] = 1263 & FE_INICIO_L1.Q THEN
	  		state[0] := 1350;
	  	ELSIF state[0] = 1264 & FE_DESC_R.Q THEN
	  		state[0] := 598;
	  	ELSIF state[0] = 1264 & FE_INICIO_L2.Q THEN
	  		state[0] := 1352;
	  	ELSIF state[0] = 1265 & FE_DESC_R.Q THEN
	  		state[0] := 599;
	  	ELSIF state[0] = 1265 & FE_INICIO_L1.Q THEN
	  		state[0] := 1352;
	  	ELSIF state[0] = 1265 & FE_FIN_L2.Q THEN
	  		state[0] := 1353;
	  	ELSIF state[0] = 1266 & FE_DESC_R.Q THEN
	  		state[0] := 600;
	  	ELSIF state[0] = 1266 & FE_FIN_L1.Q THEN
	  		state[0] := 1353;
	  	ELSIF state[0] = 1266 & FE_INICIO_L2.Q THEN
	  		state[0] := 1354;
	  	ELSIF state[0] = 1267 & FE_DESC_R.Q THEN
	  		state[0] := 602;
	  	ELSIF state[0] = 1267 & FE_INICIO_L1.Q THEN
	  		state[0] := 1354;
	  	ELSIF state[0] = 1267 & FE_FIN_L2.Q THEN
	  		state[0] := 1355;
	  	ELSIF state[0] = 1268 & FE_DESC_R.Q THEN
	  		state[0] := 606;
	  	ELSIF state[0] = 1268 & FE_FIN_L1.Q THEN
	  		state[0] := 1355;
	  	ELSIF state[0] = 1268 & FE_INICIO_L2.Q THEN
	  		state[0] := 1356;
	  	ELSIF state[0] = 1269 & FE_DESC_R.Q THEN
	  		state[0] := 611;
	  	ELSIF state[0] = 1269 & FE_INICIO_L1.Q THEN
	  		state[0] := 1356;
	  	ELSIF state[0] = 1270 & FE_GIRO_R.Q THEN
	  		state[0] := 1352;
	  	ELSIF state[0] = 1270 & FE_FIN_L2.Q THEN
	  		state[0] := 1357;
	  	ELSIF state[0] = 1271 & FE_GIRO_R.Q THEN
	  		state[0] := 1353;
	  	ELSIF state[0] = 1271 & FE_INICIO_L1.Q THEN
	  		state[0] := 1357;
	  	ELSIF state[0] = 1271 & FE_INICIO_L2.Q THEN
	  		state[0] := 1358;
	  	ELSIF state[0] = 1272 & FE_GIRO_R.Q THEN
	  		state[0] := 1354;
	  	ELSIF state[0] = 1272 & FE_FIN_L1.Q THEN
	  		state[0] := 1358;
	  	ELSIF state[0] = 1272 & FE_FIN_L2.Q THEN
	  		state[0] := 1359;
	  	ELSIF state[0] = 1273 & FE_GIRO_R.Q THEN
	  		state[0] := 1355;
	  	ELSIF state[0] = 1273 & FE_INICIO_L1.Q THEN
	  		state[0] := 1359;
	  	ELSIF state[0] = 1273 & FE_INICIO_L2.Q THEN
	  		state[0] := 1360;
	  	ELSIF state[0] = 1274 & FE_GIRO_R.Q THEN
	  		state[0] := 1356;
	  	ELSIF state[0] = 1274 & FE_FIN_L1.Q THEN
	  		state[0] := 1360;
	  	ELSIF state[0] = 1275 & FE_INICIO_L2.Q THEN
	  		state[0] := 1361;
	  	ELSIF state[0] = 1276 & FE_INICIO_L1.Q THEN
	  		state[0] := 1361;
	  	ELSIF state[0] = 1276 & FE_FIN_L2.Q THEN
	  		state[0] := 1362;
	  	ELSIF state[0] = 1277 & FE_FIN_L1.Q THEN
	  		state[0] := 1362;
	  	ELSIF state[0] = 1277 & FE_INICIO_L2.Q THEN
	  		state[0] := 1363;
	  	ELSIF state[0] = 1278 & FE_INICIO_L1.Q THEN
	  		state[0] := 1363;
	  	ELSIF state[0] = 1279 & FE_INICIO_L2.Q THEN
	  		state[0] := 1364;
	  	ELSIF state[0] = 1280 & FE_INICIO_L1.Q THEN
	  		state[0] := 1364;
	  	ELSIF state[0] = 1280 & FE_FIN_L2.Q THEN
	  		state[0] := 1365;
	  	ELSIF state[0] = 1281 & FE_FIN_L1.Q THEN
	  		state[0] := 1365;
	  	ELSIF state[0] = 1281 & FE_INICIO_L2.Q THEN
	  		state[0] := 1366;
	  	ELSIF state[0] = 1282 & FE_INICIO_L1.Q THEN
	  		state[0] := 1366;
	  	ELSIF state[0] = 1283 & FE_AZUL.Q THEN
	  		state[0] := 1361;
	  	ELSIF state[0] = 1283 & FE_VERDE.Q THEN
	  		state[0] := 1364;
	  	ELSIF state[0] = 1283 & FE_FIN_L2.Q THEN
	  		state[0] := 1367;
	  	ELSIF state[0] = 1284 & FE_AZUL.Q THEN
	  		state[0] := 1362;
	  	ELSIF state[0] = 1284 & FE_VERDE.Q THEN
	  		state[0] := 1365;
	  	ELSIF state[0] = 1284 & FE_INICIO_L1.Q THEN
	  		state[0] := 1367;
	  	ELSIF state[0] = 1284 & FE_INICIO_L2.Q THEN
	  		state[0] := 1368;
	  	ELSIF state[0] = 1285 & FE_AZUL.Q THEN
	  		state[0] := 1363;
	  	ELSIF state[0] = 1285 & FE_VERDE.Q THEN
	  		state[0] := 1366;
	  	ELSIF state[0] = 1285 & FE_FIN_L1.Q THEN
	  		state[0] := 1368;
	  	ELSIF state[0] = 1286 & FE_DESC_R.Q THEN
	  		state[0] := 598;
	  	ELSIF state[0] = 1286 & FE_INICIO_L2.Q THEN
	  		state[0] := 1369;
	  	ELSIF state[0] = 1287 & FE_GIRO_R.Q THEN
	  		state[0] := 1369;
	  	ELSIF state[0] = 1287 & FE_FIN_L2.Q THEN
	  		state[0] := 1370;
	  	ELSIF state[0] = 1288 & FE_INICIO_L2.Q THEN
	  		state[0] := 1371;
	  	ELSIF state[0] = 1289 & FE_INICIO_L2.Q THEN
	  		state[0] := 1372;
	  	ELSIF state[0] = 1290 & FE_AZUL.Q THEN
	  		state[0] := 1371;
	  	ELSIF state[0] = 1290 & FE_VERDE.Q THEN
	  		state[0] := 1372;
	  	ELSIF state[0] = 1290 & FE_FIN_L2.Q THEN
	  		state[0] := 1373;
	  	ELSIF state[0] = 1291 & FE_DESC_R.Q THEN
	  		state[0] := 599;
	  	ELSIF state[0] = 1291 & FE_INICIO_L1.Q THEN
	  		state[0] := 1369;
	  	ELSIF state[0] = 1291 & FE_FIN_L2.Q THEN
	  		state[0] := 1374;
	  	ELSIF state[0] = 1292 & FE_GIRO_R.Q THEN
	  		state[0] := 1374;
	  	ELSIF state[0] = 1292 & FE_INICIO_L1.Q THEN
	  		state[0] := 1370;
	  	ELSIF state[0] = 1292 & FE_INICIO_L2.Q THEN
	  		state[0] := 1375;
	  	ELSIF state[0] = 1293 & FE_INICIO_L1.Q THEN
	  		state[0] := 1371;
	  	ELSIF state[0] = 1293 & FE_FIN_L2.Q THEN
	  		state[0] := 1376;
	  	ELSIF state[0] = 1294 & FE_INICIO_L1.Q THEN
	  		state[0] := 1372;
	  	ELSIF state[0] = 1294 & FE_FIN_L2.Q THEN
	  		state[0] := 1377;
	  	ELSIF state[0] = 1295 & FE_AZUL.Q THEN
	  		state[0] := 1376;
	  	ELSIF state[0] = 1295 & FE_VERDE.Q THEN
	  		state[0] := 1377;
	  	ELSIF state[0] = 1295 & FE_INICIO_L1.Q THEN
	  		state[0] := 1373;
	  	ELSIF state[0] = 1295 & FE_INICIO_L2.Q THEN
	  		state[0] := 1378;
	  	ELSIF state[0] = 1296 & FE_DESC_R.Q THEN
	  		state[0] := 600;
	  	ELSIF state[0] = 1296 & FE_FIN_L1.Q THEN
	  		state[0] := 1374;
	  	ELSIF state[0] = 1296 & FE_INICIO_L2.Q THEN
	  		state[0] := 1379;
	  	ELSIF state[0] = 1297 & FE_GIRO_R.Q THEN
	  		state[0] := 1379;
	  	ELSIF state[0] = 1297 & FE_FIN_L1.Q THEN
	  		state[0] := 1375;
	  	ELSIF state[0] = 1297 & FE_FIN_L2.Q THEN
	  		state[0] := 1380;
	  	ELSIF state[0] = 1298 & FE_FIN_L1.Q THEN
	  		state[0] := 1376;
	  	ELSIF state[0] = 1298 & FE_INICIO_L2.Q THEN
	  		state[0] := 1381;
	  	ELSIF state[0] = 1299 & FE_FIN_L1.Q THEN
	  		state[0] := 1377;
	  	ELSIF state[0] = 1299 & FE_INICIO_L2.Q THEN
	  		state[0] := 1382;
	  	ELSIF state[0] = 1300 & FE_AZUL.Q THEN
	  		state[0] := 1381;
	  	ELSIF state[0] = 1300 & FE_VERDE.Q THEN
	  		state[0] := 1382;
	  	ELSIF state[0] = 1300 & FE_FIN_L1.Q THEN
	  		state[0] := 1378;
	  	ELSIF state[0] = 1301 & FE_DESC_R.Q THEN
	  		state[0] := 602;
	  	ELSIF state[0] = 1301 & FE_INICIO_L1.Q THEN
	  		state[0] := 1379;
	  	ELSIF state[0] = 1301 & FE_FIN_L2.Q THEN
	  		state[0] := 1383;
	  	ELSIF state[0] = 1302 & FE_GIRO_R.Q THEN
	  		state[0] := 1383;
	  	ELSIF state[0] = 1302 & FE_INICIO_L1.Q THEN
	  		state[0] := 1380;
	  	ELSIF state[0] = 1302 & FE_INICIO_L2.Q THEN
	  		state[0] := 1384;
	  	ELSIF state[0] = 1303 & FE_INICIO_L1.Q THEN
	  		state[0] := 1381;
	  	ELSIF state[0] = 1304 & FE_INICIO_L1.Q THEN
	  		state[0] := 1382;
	  	ELSIF state[0] = 1305 & FE_DESC_R.Q THEN
	  		state[0] := 606;
	  	ELSIF state[0] = 1305 & FE_FIN_L1.Q THEN
	  		state[0] := 1383;
	  	ELSIF state[0] = 1305 & FE_INICIO_L2.Q THEN
	  		state[0] := 1385;
	  	ELSIF state[0] = 1306 & FE_GIRO_R.Q THEN
	  		state[0] := 1385;
	  	ELSIF state[0] = 1306 & FE_FIN_L1.Q THEN
	  		state[0] := 1384;
	  	ELSIF state[0] = 1307 & FE_DESC_R.Q THEN
	  		state[0] := 611;
	  	ELSIF state[0] = 1307 & FE_INICIO_L1.Q THEN
	  		state[0] := 1385;
	  	ELSIF state[0] = 1308 & FE_DESC_R.Q THEN
	  		state[0] := 641;
	  	ELSIF state[0] = 1308 & FE_INICIO_L2.Q THEN
	  		state[0] := 1386;
	  	ELSIF state[0] = 1309 & FE_DESC_R.Q THEN
	  		state[0] := 642;
	  	ELSIF state[0] = 1309 & FE_INICIO_L1.Q THEN
	  		state[0] := 1386;
	  	ELSIF state[0] = 1309 & FE_FIN_L2.Q THEN
	  		state[0] := 1387;
	  	ELSIF state[0] = 1310 & FE_DESC_R.Q THEN
	  		state[0] := 643;
	  	ELSIF state[0] = 1310 & FE_FIN_L1.Q THEN
	  		state[0] := 1387;
	  	ELSIF state[0] = 1310 & FE_INICIO_L2.Q THEN
	  		state[0] := 1388;
	  	ELSIF state[0] = 1311 & FE_DESC_R.Q THEN
	  		state[0] := 645;
	  	ELSIF state[0] = 1311 & FE_INICIO_L1.Q THEN
	  		state[0] := 1388;
	  	ELSIF state[0] = 1311 & FE_FIN_L2.Q THEN
	  		state[0] := 1389;
	  	ELSIF state[0] = 1312 & FE_DESC_R.Q THEN
	  		state[0] := 649;
	  	ELSIF state[0] = 1312 & FE_FIN_L1.Q THEN
	  		state[0] := 1389;
	  	ELSIF state[0] = 1312 & FE_INICIO_L2.Q THEN
	  		state[0] := 1390;
	  	ELSIF state[0] = 1313 & FE_DESC_R.Q THEN
	  		state[0] := 654;
	  	ELSIF state[0] = 1313 & FE_INICIO_L1.Q THEN
	  		state[0] := 1390;
	  	ELSIF state[0] = 1314 & FE_GIRO_R.Q THEN
	  		state[0] := 1386;
	  	ELSIF state[0] = 1314 & FE_FIN_L2.Q THEN
	  		state[0] := 1391;
	  	ELSIF state[0] = 1315 & FE_GIRO_R.Q THEN
	  		state[0] := 1387;
	  	ELSIF state[0] = 1315 & FE_INICIO_L1.Q THEN
	  		state[0] := 1391;
	  	ELSIF state[0] = 1315 & FE_INICIO_L2.Q THEN
	  		state[0] := 1392;
	  	ELSIF state[0] = 1316 & FE_GIRO_R.Q THEN
	  		state[0] := 1388;
	  	ELSIF state[0] = 1316 & FE_FIN_L1.Q THEN
	  		state[0] := 1392;
	  	ELSIF state[0] = 1316 & FE_FIN_L2.Q THEN
	  		state[0] := 1393;
	  	ELSIF state[0] = 1317 & FE_GIRO_R.Q THEN
	  		state[0] := 1389;
	  	ELSIF state[0] = 1317 & FE_INICIO_L1.Q THEN
	  		state[0] := 1393;
	  	ELSIF state[0] = 1317 & FE_INICIO_L2.Q THEN
	  		state[0] := 1394;
	  	ELSIF state[0] = 1318 & FE_GIRO_R.Q THEN
	  		state[0] := 1390;
	  	ELSIF state[0] = 1318 & FE_FIN_L1.Q THEN
	  		state[0] := 1394;
	  	ELSIF state[0] = 1319 & FE_INICIO_L2.Q THEN
	  		state[0] := 1395;
	  	ELSIF state[0] = 1320 & FE_INICIO_L1.Q THEN
	  		state[0] := 1395;
	  	ELSIF state[0] = 1320 & FE_FIN_L2.Q THEN
	  		state[0] := 1396;
	  	ELSIF state[0] = 1321 & FE_FIN_L1.Q THEN
	  		state[0] := 1396;
	  	ELSIF state[0] = 1321 & FE_INICIO_L2.Q THEN
	  		state[0] := 1397;
	  	ELSIF state[0] = 1322 & FE_INICIO_L1.Q THEN
	  		state[0] := 1397;
	  	ELSIF state[0] = 1323 & FE_INICIO_L2.Q THEN
	  		state[0] := 1398;
	  	ELSIF state[0] = 1324 & FE_INICIO_L1.Q THEN
	  		state[0] := 1398;
	  	ELSIF state[0] = 1324 & FE_FIN_L2.Q THEN
	  		state[0] := 1399;
	  	ELSIF state[0] = 1325 & FE_FIN_L1.Q THEN
	  		state[0] := 1399;
	  	ELSIF state[0] = 1325 & FE_INICIO_L2.Q THEN
	  		state[0] := 1400;
	  	ELSIF state[0] = 1326 & FE_INICIO_L1.Q THEN
	  		state[0] := 1400;
	  	ELSIF state[0] = 1327 & FE_AZUL.Q THEN
	  		state[0] := 1395;
	  	ELSIF state[0] = 1327 & FE_VERDE.Q THEN
	  		state[0] := 1398;
	  	ELSIF state[0] = 1327 & FE_FIN_L2.Q THEN
	  		state[0] := 1401;
	  	ELSIF state[0] = 1328 & FE_AZUL.Q THEN
	  		state[0] := 1396;
	  	ELSIF state[0] = 1328 & FE_VERDE.Q THEN
	  		state[0] := 1399;
	  	ELSIF state[0] = 1328 & FE_INICIO_L1.Q THEN
	  		state[0] := 1401;
	  	ELSIF state[0] = 1328 & FE_INICIO_L2.Q THEN
	  		state[0] := 1402;
	  	ELSIF state[0] = 1329 & FE_AZUL.Q THEN
	  		state[0] := 1397;
	  	ELSIF state[0] = 1329 & FE_VERDE.Q THEN
	  		state[0] := 1400;
	  	ELSIF state[0] = 1329 & FE_FIN_L1.Q THEN
	  		state[0] := 1402;
	  	ELSIF state[0] = 1330 & FE_DESC_R.Q THEN
	  		state[0] := 641;
	  	ELSIF state[0] = 1330 & FE_INICIO_L2.Q THEN
	  		state[0] := 1403;
	  	ELSIF state[0] = 1331 & FE_GIRO_R.Q THEN
	  		state[0] := 1403;
	  	ELSIF state[0] = 1331 & FE_FIN_L2.Q THEN
	  		state[0] := 1404;
	  	ELSIF state[0] = 1332 & FE_INICIO_L2.Q THEN
	  		state[0] := 1405;
	  	ELSIF state[0] = 1333 & FE_INICIO_L2.Q THEN
	  		state[0] := 1406;
	  	ELSIF state[0] = 1334 & FE_AZUL.Q THEN
	  		state[0] := 1405;
	  	ELSIF state[0] = 1334 & FE_VERDE.Q THEN
	  		state[0] := 1406;
	  	ELSIF state[0] = 1334 & FE_FIN_L2.Q THEN
	  		state[0] := 1407;
	  	ELSIF state[0] = 1335 & FE_DESC_R.Q THEN
	  		state[0] := 642;
	  	ELSIF state[0] = 1335 & FE_INICIO_L1.Q THEN
	  		state[0] := 1403;
	  	ELSIF state[0] = 1335 & FE_FIN_L2.Q THEN
	  		state[0] := 1408;
	  	ELSIF state[0] = 1336 & FE_GIRO_R.Q THEN
	  		state[0] := 1408;
	  	ELSIF state[0] = 1336 & FE_INICIO_L1.Q THEN
	  		state[0] := 1404;
	  	ELSIF state[0] = 1336 & FE_INICIO_L2.Q THEN
	  		state[0] := 1409;
	  	ELSIF state[0] = 1337 & FE_INICIO_L1.Q THEN
	  		state[0] := 1405;
	  	ELSIF state[0] = 1337 & FE_FIN_L2.Q THEN
	  		state[0] := 1410;
	  	ELSIF state[0] = 1338 & FE_INICIO_L1.Q THEN
	  		state[0] := 1406;
	  	ELSIF state[0] = 1338 & FE_FIN_L2.Q THEN
	  		state[0] := 1411;
	  	ELSIF state[0] = 1339 & FE_AZUL.Q THEN
	  		state[0] := 1410;
	  	ELSIF state[0] = 1339 & FE_VERDE.Q THEN
	  		state[0] := 1411;
	  	ELSIF state[0] = 1339 & FE_INICIO_L1.Q THEN
	  		state[0] := 1407;
	  	ELSIF state[0] = 1339 & FE_INICIO_L2.Q THEN
	  		state[0] := 1412;
	  	ELSIF state[0] = 1340 & FE_DESC_R.Q THEN
	  		state[0] := 643;
	  	ELSIF state[0] = 1340 & FE_FIN_L1.Q THEN
	  		state[0] := 1408;
	  	ELSIF state[0] = 1340 & FE_INICIO_L2.Q THEN
	  		state[0] := 1413;
	  	ELSIF state[0] = 1341 & FE_GIRO_R.Q THEN
	  		state[0] := 1413;
	  	ELSIF state[0] = 1341 & FE_FIN_L1.Q THEN
	  		state[0] := 1409;
	  	ELSIF state[0] = 1341 & FE_FIN_L2.Q THEN
	  		state[0] := 1414;
	  	ELSIF state[0] = 1342 & FE_FIN_L1.Q THEN
	  		state[0] := 1410;
	  	ELSIF state[0] = 1342 & FE_INICIO_L2.Q THEN
	  		state[0] := 1415;
	  	ELSIF state[0] = 1343 & FE_FIN_L1.Q THEN
	  		state[0] := 1411;
	  	ELSIF state[0] = 1343 & FE_INICIO_L2.Q THEN
	  		state[0] := 1416;
	  	ELSIF state[0] = 1344 & FE_AZUL.Q THEN
	  		state[0] := 1415;
	  	ELSIF state[0] = 1344 & FE_VERDE.Q THEN
	  		state[0] := 1416;
	  	ELSIF state[0] = 1344 & FE_FIN_L1.Q THEN
	  		state[0] := 1412;
	  	ELSIF state[0] = 1345 & FE_DESC_R.Q THEN
	  		state[0] := 645;
	  	ELSIF state[0] = 1345 & FE_INICIO_L1.Q THEN
	  		state[0] := 1413;
	  	ELSIF state[0] = 1345 & FE_FIN_L2.Q THEN
	  		state[0] := 1417;
	  	ELSIF state[0] = 1346 & FE_GIRO_R.Q THEN
	  		state[0] := 1417;
	  	ELSIF state[0] = 1346 & FE_INICIO_L1.Q THEN
	  		state[0] := 1414;
	  	ELSIF state[0] = 1346 & FE_INICIO_L2.Q THEN
	  		state[0] := 1418;
	  	ELSIF state[0] = 1347 & FE_INICIO_L1.Q THEN
	  		state[0] := 1415;
	  	ELSIF state[0] = 1348 & FE_INICIO_L1.Q THEN
	  		state[0] := 1416;
	  	ELSIF state[0] = 1349 & FE_DESC_R.Q THEN
	  		state[0] := 649;
	  	ELSIF state[0] = 1349 & FE_FIN_L1.Q THEN
	  		state[0] := 1417;
	  	ELSIF state[0] = 1349 & FE_INICIO_L2.Q THEN
	  		state[0] := 1419;
	  	ELSIF state[0] = 1350 & FE_GIRO_R.Q THEN
	  		state[0] := 1419;
	  	ELSIF state[0] = 1350 & FE_FIN_L1.Q THEN
	  		state[0] := 1418;
	  	ELSIF state[0] = 1351 & FE_DESC_R.Q THEN
	  		state[0] := 654;
	  	ELSIF state[0] = 1351 & FE_INICIO_L1.Q THEN
	  		state[0] := 1419;
	  	ELSIF state[0] = 1352 & FE_DESC_R.Q THEN
	  		state[0] := 717;
	  	ELSIF state[0] = 1352 & FE_FIN_L2.Q THEN
	  		state[0] := 1420;
	  	ELSIF state[0] = 1353 & FE_DESC_R.Q THEN
	  		state[0] := 718;
	  	ELSIF state[0] = 1353 & FE_INICIO_L1.Q THEN
	  		state[0] := 1420;
	  	ELSIF state[0] = 1353 & FE_INICIO_L2.Q THEN
	  		state[0] := 1421;
	  	ELSIF state[0] = 1354 & FE_DESC_R.Q THEN
	  		state[0] := 720;
	  	ELSIF state[0] = 1354 & FE_FIN_L1.Q THEN
	  		state[0] := 1421;
	  	ELSIF state[0] = 1354 & FE_FIN_L2.Q THEN
	  		state[0] := 1422;
	  	ELSIF state[0] = 1355 & FE_DESC_R.Q THEN
	  		state[0] := 724;
	  	ELSIF state[0] = 1355 & FE_INICIO_L1.Q THEN
	  		state[0] := 1422;
	  	ELSIF state[0] = 1355 & FE_INICIO_L2.Q THEN
	  		state[0] := 1423;
	  	ELSIF state[0] = 1356 & FE_DESC_R.Q THEN
	  		state[0] := 729;
	  	ELSIF state[0] = 1356 & FE_FIN_L1.Q THEN
	  		state[0] := 1423;
	  	ELSIF state[0] = 1357 & FE_GIRO_R.Q THEN
	  		state[0] := 1420;
	  	ELSIF state[0] = 1357 & FE_INICIO_L2.Q THEN
	  		state[0] := 1424;
	  	ELSIF state[0] = 1358 & FE_GIRO_R.Q THEN
	  		state[0] := 1421;
	  	ELSIF state[0] = 1358 & FE_INICIO_L1.Q THEN
	  		state[0] := 1424;
	  	ELSIF state[0] = 1358 & FE_FIN_L2.Q THEN
	  		state[0] := 1425;
	  	ELSIF state[0] = 1359 & FE_GIRO_R.Q THEN
	  		state[0] := 1422;
	  	ELSIF state[0] = 1359 & FE_FIN_L1.Q THEN
	  		state[0] := 1425;
	  	ELSIF state[0] = 1359 & FE_INICIO_L2.Q THEN
	  		state[0] := 1426;
	  	ELSIF state[0] = 1360 & FE_GIRO_R.Q THEN
	  		state[0] := 1423;
	  	ELSIF state[0] = 1360 & FE_INICIO_L1.Q THEN
	  		state[0] := 1426;
	  	ELSIF state[0] = 1361 & FE_FIN_L2.Q THEN
	  		state[0] := 1427;
	  	ELSIF state[0] = 1362 & FE_INICIO_L1.Q THEN
	  		state[0] := 1427;
	  	ELSIF state[0] = 1362 & FE_INICIO_L2.Q THEN
	  		state[0] := 1428;
	  	ELSIF state[0] = 1363 & FE_FIN_L1.Q THEN
	  		state[0] := 1428;
	  	ELSIF state[0] = 1364 & FE_FIN_L2.Q THEN
	  		state[0] := 1429;
	  	ELSIF state[0] = 1365 & FE_INICIO_L1.Q THEN
	  		state[0] := 1429;
	  	ELSIF state[0] = 1365 & FE_INICIO_L2.Q THEN
	  		state[0] := 1430;
	  	ELSIF state[0] = 1366 & FE_FIN_L1.Q THEN
	  		state[0] := 1430;
	  	ELSIF state[0] = 1367 & FE_AZUL.Q THEN
	  		state[0] := 1427;
	  	ELSIF state[0] = 1367 & FE_VERDE.Q THEN
	  		state[0] := 1429;
	  	ELSIF state[0] = 1367 & FE_INICIO_L2.Q THEN
	  		state[0] := 1431;
	  	ELSIF state[0] = 1368 & FE_AZUL.Q THEN
	  		state[0] := 1428;
	  	ELSIF state[0] = 1368 & FE_VERDE.Q THEN
	  		state[0] := 1430;
	  	ELSIF state[0] = 1368 & FE_INICIO_L1.Q THEN
	  		state[0] := 1431;
	  	ELSIF state[0] = 1369 & FE_DESC_R.Q THEN
	  		state[0] := 717;
	  	ELSIF state[0] = 1369 & FE_FIN_L2.Q THEN
	  		state[0] := 1432;
	  	ELSIF state[0] = 1370 & FE_GIRO_R.Q THEN
	  		state[0] := 1432;
	  	ELSIF state[0] = 1370 & FE_INICIO_L2.Q THEN
	  		state[0] := 1433;
	  	ELSIF state[0] = 1371 & FE_FIN_L2.Q THEN
	  		state[0] := 1434;
	  	ELSIF state[0] = 1372 & FE_FIN_L2.Q THEN
	  		state[0] := 1435;
	  	ELSIF state[0] = 1373 & FE_AZUL.Q THEN
	  		state[0] := 1434;
	  	ELSIF state[0] = 1373 & FE_VERDE.Q THEN
	  		state[0] := 1435;
	  	ELSIF state[0] = 1373 & FE_INICIO_L2.Q THEN
	  		state[0] := 1436;
	  	ELSIF state[0] = 1374 & FE_DESC_R.Q THEN
	  		state[0] := 718;
	  	ELSIF state[0] = 1374 & FE_INICIO_L1.Q THEN
	  		state[0] := 1432;
	  	ELSIF state[0] = 1374 & FE_INICIO_L2.Q THEN
	  		state[0] := 1437;
	  	ELSIF state[0] = 1375 & FE_GIRO_R.Q THEN
	  		state[0] := 1437;
	  	ELSIF state[0] = 1375 & FE_INICIO_L1.Q THEN
	  		state[0] := 1433;
	  	ELSIF state[0] = 1375 & FE_FIN_L2.Q THEN
	  		state[0] := 1438;
	  	ELSIF state[0] = 1376 & FE_INICIO_L1.Q THEN
	  		state[0] := 1434;
	  	ELSIF state[0] = 1376 & FE_INICIO_L2.Q THEN
	  		state[0] := 1439;
	  	ELSIF state[0] = 1377 & FE_INICIO_L1.Q THEN
	  		state[0] := 1435;
	  	ELSIF state[0] = 1377 & FE_INICIO_L2.Q THEN
	  		state[0] := 1440;
	  	ELSIF state[0] = 1378 & FE_AZUL.Q THEN
	  		state[0] := 1439;
	  	ELSIF state[0] = 1378 & FE_VERDE.Q THEN
	  		state[0] := 1440;
	  	ELSIF state[0] = 1378 & FE_INICIO_L1.Q THEN
	  		state[0] := 1436;
	  	ELSIF state[0] = 1379 & FE_DESC_R.Q THEN
	  		state[0] := 720;
	  	ELSIF state[0] = 1379 & FE_FIN_L1.Q THEN
	  		state[0] := 1437;
	  	ELSIF state[0] = 1379 & FE_FIN_L2.Q THEN
	  		state[0] := 1441;
	  	ELSIF state[0] = 1380 & FE_GIRO_R.Q THEN
	  		state[0] := 1441;
	  	ELSIF state[0] = 1380 & FE_FIN_L1.Q THEN
	  		state[0] := 1438;
	  	ELSIF state[0] = 1380 & FE_INICIO_L2.Q THEN
	  		state[0] := 1442;
	  	ELSIF state[0] = 1381 & FE_FIN_L1.Q THEN
	  		state[0] := 1439;
	  	ELSIF state[0] = 1382 & FE_FIN_L1.Q THEN
	  		state[0] := 1440;
	  	ELSIF state[0] = 1383 & FE_DESC_R.Q THEN
	  		state[0] := 724;
	  	ELSIF state[0] = 1383 & FE_INICIO_L1.Q THEN
	  		state[0] := 1441;
	  	ELSIF state[0] = 1383 & FE_INICIO_L2.Q THEN
	  		state[0] := 1443;
	  	ELSIF state[0] = 1384 & FE_GIRO_R.Q THEN
	  		state[0] := 1443;
	  	ELSIF state[0] = 1384 & FE_INICIO_L1.Q THEN
	  		state[0] := 1442;
	  	ELSIF state[0] = 1385 & FE_DESC_R.Q THEN
	  		state[0] := 729;
	  	ELSIF state[0] = 1385 & FE_FIN_L1.Q THEN
	  		state[0] := 1443;
	  	ELSIF state[0] = 1386 & FE_DESC_R.Q THEN
	  		state[0] := 764;
	  	ELSIF state[0] = 1386 & FE_FIN_L2.Q THEN
	  		state[0] := 1444;
	  	ELSIF state[0] = 1387 & FE_DESC_R.Q THEN
	  		state[0] := 765;
	  	ELSIF state[0] = 1387 & FE_INICIO_L1.Q THEN
	  		state[0] := 1444;
	  	ELSIF state[0] = 1387 & FE_INICIO_L2.Q THEN
	  		state[0] := 1445;
	  	ELSIF state[0] = 1388 & FE_DESC_R.Q THEN
	  		state[0] := 767;
	  	ELSIF state[0] = 1388 & FE_FIN_L1.Q THEN
	  		state[0] := 1445;
	  	ELSIF state[0] = 1388 & FE_FIN_L2.Q THEN
	  		state[0] := 1446;
	  	ELSIF state[0] = 1389 & FE_DESC_R.Q THEN
	  		state[0] := 771;
	  	ELSIF state[0] = 1389 & FE_INICIO_L1.Q THEN
	  		state[0] := 1446;
	  	ELSIF state[0] = 1389 & FE_INICIO_L2.Q THEN
	  		state[0] := 1447;
	  	ELSIF state[0] = 1390 & FE_DESC_R.Q THEN
	  		state[0] := 776;
	  	ELSIF state[0] = 1390 & FE_FIN_L1.Q THEN
	  		state[0] := 1447;
	  	ELSIF state[0] = 1391 & FE_GIRO_R.Q THEN
	  		state[0] := 1444;
	  	ELSIF state[0] = 1391 & FE_INICIO_L2.Q THEN
	  		state[0] := 1448;
	  	ELSIF state[0] = 1392 & FE_GIRO_R.Q THEN
	  		state[0] := 1445;
	  	ELSIF state[0] = 1392 & FE_INICIO_L1.Q THEN
	  		state[0] := 1448;
	  	ELSIF state[0] = 1392 & FE_FIN_L2.Q THEN
	  		state[0] := 1449;
	  	ELSIF state[0] = 1393 & FE_GIRO_R.Q THEN
	  		state[0] := 1446;
	  	ELSIF state[0] = 1393 & FE_FIN_L1.Q THEN
	  		state[0] := 1449;
	  	ELSIF state[0] = 1393 & FE_INICIO_L2.Q THEN
	  		state[0] := 1450;
	  	ELSIF state[0] = 1394 & FE_GIRO_R.Q THEN
	  		state[0] := 1447;
	  	ELSIF state[0] = 1394 & FE_INICIO_L1.Q THEN
	  		state[0] := 1450;
	  	ELSIF state[0] = 1395 & FE_FIN_L2.Q THEN
	  		state[0] := 1451;
	  	ELSIF state[0] = 1396 & FE_INICIO_L1.Q THEN
	  		state[0] := 1451;
	  	ELSIF state[0] = 1396 & FE_INICIO_L2.Q THEN
	  		state[0] := 1452;
	  	ELSIF state[0] = 1397 & FE_FIN_L1.Q THEN
	  		state[0] := 1452;
	  	ELSIF state[0] = 1398 & FE_FIN_L2.Q THEN
	  		state[0] := 1453;
	  	ELSIF state[0] = 1399 & FE_INICIO_L1.Q THEN
	  		state[0] := 1453;
	  	ELSIF state[0] = 1399 & FE_INICIO_L2.Q THEN
	  		state[0] := 1454;
	  	ELSIF state[0] = 1400 & FE_FIN_L1.Q THEN
	  		state[0] := 1454;
	  	ELSIF state[0] = 1401 & FE_AZUL.Q THEN
	  		state[0] := 1451;
	  	ELSIF state[0] = 1401 & FE_VERDE.Q THEN
	  		state[0] := 1453;
	  	ELSIF state[0] = 1401 & FE_INICIO_L2.Q THEN
	  		state[0] := 1455;
	  	ELSIF state[0] = 1402 & FE_AZUL.Q THEN
	  		state[0] := 1452;
	  	ELSIF state[0] = 1402 & FE_VERDE.Q THEN
	  		state[0] := 1454;
	  	ELSIF state[0] = 1402 & FE_INICIO_L1.Q THEN
	  		state[0] := 1455;
	  	ELSIF state[0] = 1403 & FE_DESC_R.Q THEN
	  		state[0] := 764;
	  	ELSIF state[0] = 1403 & FE_FIN_L2.Q THEN
	  		state[0] := 1456;
	  	ELSIF state[0] = 1404 & FE_GIRO_R.Q THEN
	  		state[0] := 1456;
	  	ELSIF state[0] = 1404 & FE_INICIO_L2.Q THEN
	  		state[0] := 1457;
	  	ELSIF state[0] = 1405 & FE_FIN_L2.Q THEN
	  		state[0] := 1458;
	  	ELSIF state[0] = 1406 & FE_FIN_L2.Q THEN
	  		state[0] := 1459;
	  	ELSIF state[0] = 1407 & FE_AZUL.Q THEN
	  		state[0] := 1458;
	  	ELSIF state[0] = 1407 & FE_VERDE.Q THEN
	  		state[0] := 1459;
	  	ELSIF state[0] = 1407 & FE_INICIO_L2.Q THEN
	  		state[0] := 1460;
	  	ELSIF state[0] = 1408 & FE_DESC_R.Q THEN
	  		state[0] := 765;
	  	ELSIF state[0] = 1408 & FE_INICIO_L1.Q THEN
	  		state[0] := 1456;
	  	ELSIF state[0] = 1408 & FE_INICIO_L2.Q THEN
	  		state[0] := 1461;
	  	ELSIF state[0] = 1409 & FE_GIRO_R.Q THEN
	  		state[0] := 1461;
	  	ELSIF state[0] = 1409 & FE_INICIO_L1.Q THEN
	  		state[0] := 1457;
	  	ELSIF state[0] = 1409 & FE_FIN_L2.Q THEN
	  		state[0] := 1462;
	  	ELSIF state[0] = 1410 & FE_INICIO_L1.Q THEN
	  		state[0] := 1458;
	  	ELSIF state[0] = 1410 & FE_INICIO_L2.Q THEN
	  		state[0] := 1463;
	  	ELSIF state[0] = 1411 & FE_INICIO_L1.Q THEN
	  		state[0] := 1459;
	  	ELSIF state[0] = 1411 & FE_INICIO_L2.Q THEN
	  		state[0] := 1464;
	  	ELSIF state[0] = 1412 & FE_AZUL.Q THEN
	  		state[0] := 1463;
	  	ELSIF state[0] = 1412 & FE_VERDE.Q THEN
	  		state[0] := 1464;
	  	ELSIF state[0] = 1412 & FE_INICIO_L1.Q THEN
	  		state[0] := 1460;
	  	ELSIF state[0] = 1413 & FE_DESC_R.Q THEN
	  		state[0] := 767;
	  	ELSIF state[0] = 1413 & FE_FIN_L1.Q THEN
	  		state[0] := 1461;
	  	ELSIF state[0] = 1413 & FE_FIN_L2.Q THEN
	  		state[0] := 1465;
	  	ELSIF state[0] = 1414 & FE_GIRO_R.Q THEN
	  		state[0] := 1465;
	  	ELSIF state[0] = 1414 & FE_FIN_L1.Q THEN
	  		state[0] := 1462;
	  	ELSIF state[0] = 1414 & FE_INICIO_L2.Q THEN
	  		state[0] := 1466;
	  	ELSIF state[0] = 1415 & FE_FIN_L1.Q THEN
	  		state[0] := 1463;
	  	ELSIF state[0] = 1416 & FE_FIN_L1.Q THEN
	  		state[0] := 1464;
	  	ELSIF state[0] = 1417 & FE_DESC_R.Q THEN
	  		state[0] := 771;
	  	ELSIF state[0] = 1417 & FE_INICIO_L1.Q THEN
	  		state[0] := 1465;
	  	ELSIF state[0] = 1417 & FE_INICIO_L2.Q THEN
	  		state[0] := 1467;
	  	ELSIF state[0] = 1418 & FE_GIRO_R.Q THEN
	  		state[0] := 1467;
	  	ELSIF state[0] = 1418 & FE_INICIO_L1.Q THEN
	  		state[0] := 1466;
	  	ELSIF state[0] = 1419 & FE_DESC_R.Q THEN
	  		state[0] := 776;
	  	ELSIF state[0] = 1419 & FE_FIN_L1.Q THEN
	  		state[0] := 1467;
	  	ELSIF state[0] = 1420 & FE_DESC_R.Q THEN
	  		state[0] := 836;
	  	ELSIF state[0] = 1420 & FE_INICIO_L2.Q THEN
	  		state[0] := 1468;
	  	ELSIF state[0] = 1421 & FE_DESC_R.Q THEN
	  		state[0] := 838;
	  	ELSIF state[0] = 1421 & FE_INICIO_L1.Q THEN
	  		state[0] := 1468;
	  	ELSIF state[0] = 1421 & FE_FIN_L2.Q THEN
	  		state[0] := 1469;
	  	ELSIF state[0] = 1422 & FE_DESC_R.Q THEN
	  		state[0] := 842;
	  	ELSIF state[0] = 1422 & FE_FIN_L1.Q THEN
	  		state[0] := 1469;
	  	ELSIF state[0] = 1422 & FE_INICIO_L2.Q THEN
	  		state[0] := 1470;
	  	ELSIF state[0] = 1423 & FE_DESC_R.Q THEN
	  		state[0] := 847;
	  	ELSIF state[0] = 1423 & FE_INICIO_L1.Q THEN
	  		state[0] := 1470;
	  	ELSIF state[0] = 1424 & FE_GIRO_R.Q THEN
	  		state[0] := 1468;
	  	ELSIF state[0] = 1424 & FE_FIN_L2.Q THEN
	  		state[0] := 1471;
	  	ELSIF state[0] = 1425 & FE_GIRO_R.Q THEN
	  		state[0] := 1469;
	  	ELSIF state[0] = 1425 & FE_INICIO_L1.Q THEN
	  		state[0] := 1471;
	  	ELSIF state[0] = 1425 & FE_INICIO_L2.Q THEN
	  		state[0] := 1472;
	  	ELSIF state[0] = 1426 & FE_GIRO_R.Q THEN
	  		state[0] := 1470;
	  	ELSIF state[0] = 1426 & FE_FIN_L1.Q THEN
	  		state[0] := 1472;
	  	ELSIF state[0] = 1427 & FE_INICIO_L2.Q THEN
	  		state[0] := 1473;
	  	ELSIF state[0] = 1428 & FE_INICIO_L1.Q THEN
	  		state[0] := 1473;
	  	ELSIF state[0] = 1429 & FE_INICIO_L2.Q THEN
	  		state[0] := 1474;
	  	ELSIF state[0] = 1430 & FE_INICIO_L1.Q THEN
	  		state[0] := 1474;
	  	ELSIF state[0] = 1431 & FE_AZUL.Q THEN
	  		state[0] := 1473;
	  	ELSIF state[0] = 1431 & FE_VERDE.Q THEN
	  		state[0] := 1474;
	  	ELSIF state[0] = 1432 & FE_DESC_R.Q THEN
	  		state[0] := 836;
	  	ELSIF state[0] = 1432 & FE_INICIO_L2.Q THEN
	  		state[0] := 1475;
	  	ELSIF state[0] = 1433 & FE_GIRO_R.Q THEN
	  		state[0] := 1475;
	  	ELSIF state[0] = 1433 & FE_FIN_L2.Q THEN
	  		state[0] := 1476;
	  	ELSIF state[0] = 1434 & FE_INICIO_L2.Q THEN
	  		state[0] := 1477;
	  	ELSIF state[0] = 1435 & FE_INICIO_L2.Q THEN
	  		state[0] := 1478;
	  	ELSIF state[0] = 1436 & FE_AZUL.Q THEN
	  		state[0] := 1477;
	  	ELSIF state[0] = 1436 & FE_VERDE.Q THEN
	  		state[0] := 1478;
	  	ELSIF state[0] = 1437 & FE_DESC_R.Q THEN
	  		state[0] := 838;
	  	ELSIF state[0] = 1437 & FE_INICIO_L1.Q THEN
	  		state[0] := 1475;
	  	ELSIF state[0] = 1437 & FE_FIN_L2.Q THEN
	  		state[0] := 1479;
	  	ELSIF state[0] = 1438 & FE_GIRO_R.Q THEN
	  		state[0] := 1479;
	  	ELSIF state[0] = 1438 & FE_INICIO_L1.Q THEN
	  		state[0] := 1476;
	  	ELSIF state[0] = 1438 & FE_INICIO_L2.Q THEN
	  		state[0] := 1480;
	  	ELSIF state[0] = 1439 & FE_INICIO_L1.Q THEN
	  		state[0] := 1477;
	  	ELSIF state[0] = 1440 & FE_INICIO_L1.Q THEN
	  		state[0] := 1478;
	  	ELSIF state[0] = 1441 & FE_DESC_R.Q THEN
	  		state[0] := 842;
	  	ELSIF state[0] = 1441 & FE_FIN_L1.Q THEN
	  		state[0] := 1479;
	  	ELSIF state[0] = 1441 & FE_INICIO_L2.Q THEN
	  		state[0] := 1481;
	  	ELSIF state[0] = 1442 & FE_GIRO_R.Q THEN
	  		state[0] := 1481;
	  	ELSIF state[0] = 1442 & FE_FIN_L1.Q THEN
	  		state[0] := 1480;
	  	ELSIF state[0] = 1443 & FE_DESC_R.Q THEN
	  		state[0] := 847;
	  	ELSIF state[0] = 1443 & FE_INICIO_L1.Q THEN
	  		state[0] := 1481;
	  	ELSIF state[0] = 1444 & FE_DESC_R.Q THEN
	  		state[0] := 887;
	  	ELSIF state[0] = 1444 & FE_INICIO_L2.Q THEN
	  		state[0] := 1482;
	  	ELSIF state[0] = 1445 & FE_DESC_R.Q THEN
	  		state[0] := 889;
	  	ELSIF state[0] = 1445 & FE_INICIO_L1.Q THEN
	  		state[0] := 1482;
	  	ELSIF state[0] = 1445 & FE_FIN_L2.Q THEN
	  		state[0] := 1483;
	  	ELSIF state[0] = 1446 & FE_DESC_R.Q THEN
	  		state[0] := 893;
	  	ELSIF state[0] = 1446 & FE_FIN_L1.Q THEN
	  		state[0] := 1483;
	  	ELSIF state[0] = 1446 & FE_INICIO_L2.Q THEN
	  		state[0] := 1484;
	  	ELSIF state[0] = 1447 & FE_DESC_R.Q THEN
	  		state[0] := 898;
	  	ELSIF state[0] = 1447 & FE_INICIO_L1.Q THEN
	  		state[0] := 1484;
	  	ELSIF state[0] = 1448 & FE_GIRO_R.Q THEN
	  		state[0] := 1482;
	  	ELSIF state[0] = 1448 & FE_FIN_L2.Q THEN
	  		state[0] := 1485;
	  	ELSIF state[0] = 1449 & FE_GIRO_R.Q THEN
	  		state[0] := 1483;
	  	ELSIF state[0] = 1449 & FE_INICIO_L1.Q THEN
	  		state[0] := 1485;
	  	ELSIF state[0] = 1449 & FE_INICIO_L2.Q THEN
	  		state[0] := 1486;
	  	ELSIF state[0] = 1450 & FE_GIRO_R.Q THEN
	  		state[0] := 1484;
	  	ELSIF state[0] = 1450 & FE_FIN_L1.Q THEN
	  		state[0] := 1486;
	  	ELSIF state[0] = 1451 & FE_INICIO_L2.Q THEN
	  		state[0] := 1487;
	  	ELSIF state[0] = 1452 & FE_INICIO_L1.Q THEN
	  		state[0] := 1487;
	  	ELSIF state[0] = 1453 & FE_INICIO_L2.Q THEN
	  		state[0] := 1488;
	  	ELSIF state[0] = 1454 & FE_INICIO_L1.Q THEN
	  		state[0] := 1488;
	  	ELSIF state[0] = 1455 & FE_AZUL.Q THEN
	  		state[0] := 1487;
	  	ELSIF state[0] = 1455 & FE_VERDE.Q THEN
	  		state[0] := 1488;
	  	ELSIF state[0] = 1456 & FE_DESC_R.Q THEN
	  		state[0] := 887;
	  	ELSIF state[0] = 1456 & FE_INICIO_L2.Q THEN
	  		state[0] := 1489;
	  	ELSIF state[0] = 1457 & FE_GIRO_R.Q THEN
	  		state[0] := 1489;
	  	ELSIF state[0] = 1457 & FE_FIN_L2.Q THEN
	  		state[0] := 1490;
	  	ELSIF state[0] = 1458 & FE_INICIO_L2.Q THEN
	  		state[0] := 1491;
	  	ELSIF state[0] = 1459 & FE_INICIO_L2.Q THEN
	  		state[0] := 1492;
	  	ELSIF state[0] = 1460 & FE_AZUL.Q THEN
	  		state[0] := 1491;
	  	ELSIF state[0] = 1460 & FE_VERDE.Q THEN
	  		state[0] := 1492;
	  	ELSIF state[0] = 1461 & FE_DESC_R.Q THEN
	  		state[0] := 889;
	  	ELSIF state[0] = 1461 & FE_INICIO_L1.Q THEN
	  		state[0] := 1489;
	  	ELSIF state[0] = 1461 & FE_FIN_L2.Q THEN
	  		state[0] := 1493;
	  	ELSIF state[0] = 1462 & FE_GIRO_R.Q THEN
	  		state[0] := 1493;
	  	ELSIF state[0] = 1462 & FE_INICIO_L1.Q THEN
	  		state[0] := 1490;
	  	ELSIF state[0] = 1462 & FE_INICIO_L2.Q THEN
	  		state[0] := 1494;
	  	ELSIF state[0] = 1463 & FE_INICIO_L1.Q THEN
	  		state[0] := 1491;
	  	ELSIF state[0] = 1464 & FE_INICIO_L1.Q THEN
	  		state[0] := 1492;
	  	ELSIF state[0] = 1465 & FE_DESC_R.Q THEN
	  		state[0] := 893;
	  	ELSIF state[0] = 1465 & FE_FIN_L1.Q THEN
	  		state[0] := 1493;
	  	ELSIF state[0] = 1465 & FE_INICIO_L2.Q THEN
	  		state[0] := 1495;
	  	ELSIF state[0] = 1466 & FE_GIRO_R.Q THEN
	  		state[0] := 1495;
	  	ELSIF state[0] = 1466 & FE_FIN_L1.Q THEN
	  		state[0] := 1494;
	  	ELSIF state[0] = 1467 & FE_DESC_R.Q THEN
	  		state[0] := 898;
	  	ELSIF state[0] = 1467 & FE_INICIO_L1.Q THEN
	  		state[0] := 1495;
	  	ELSIF state[0] = 1468 & FE_DESC_R.Q THEN
	  		state[0] := 956;
	  	ELSIF state[0] = 1468 & FE_FIN_L2.Q THEN
	  		state[0] := 1496;
	  	ELSIF state[0] = 1469 & FE_DESC_R.Q THEN
	  		state[0] := 960;
	  	ELSIF state[0] = 1469 & FE_INICIO_L1.Q THEN
	  		state[0] := 1496;
	  	ELSIF state[0] = 1469 & FE_INICIO_L2.Q THEN
	  		state[0] := 1497;
	  	ELSIF state[0] = 1470 & FE_DESC_R.Q THEN
	  		state[0] := 965;
	  	ELSIF state[0] = 1470 & FE_FIN_L1.Q THEN
	  		state[0] := 1497;
	  	ELSIF state[0] = 1471 & FE_GIRO_R.Q THEN
	  		state[0] := 1496;
	  	ELSIF state[0] = 1471 & FE_INICIO_L2.Q THEN
	  		state[0] := 1498;
	  	ELSIF state[0] = 1472 & FE_GIRO_R.Q THEN
	  		state[0] := 1497;
	  	ELSIF state[0] = 1472 & FE_INICIO_L1.Q THEN
	  		state[0] := 1498;
	  	ELSIF state[0] = 1475 & FE_DESC_R.Q THEN
	  		state[0] := 956;
	  	ELSIF state[0] = 1475 & FE_FIN_L2.Q THEN
	  		state[0] := 1499;
	  	ELSIF state[0] = 1476 & FE_GIRO_R.Q THEN
	  		state[0] := 1499;
	  	ELSIF state[0] = 1476 & FE_INICIO_L2.Q THEN
	  		state[0] := 1500;
	  	ELSIF state[0] = 1479 & FE_DESC_R.Q THEN
	  		state[0] := 960;
	  	ELSIF state[0] = 1479 & FE_INICIO_L1.Q THEN
	  		state[0] := 1499;
	  	ELSIF state[0] = 1479 & FE_INICIO_L2.Q THEN
	  		state[0] := 1501;
	  	ELSIF state[0] = 1480 & FE_GIRO_R.Q THEN
	  		state[0] := 1501;
	  	ELSIF state[0] = 1480 & FE_INICIO_L1.Q THEN
	  		state[0] := 1500;
	  	ELSIF state[0] = 1481 & FE_DESC_R.Q THEN
	  		state[0] := 965;
	  	ELSIF state[0] = 1481 & FE_FIN_L1.Q THEN
	  		state[0] := 1501;
	  	ELSIF state[0] = 1482 & FE_DESC_R.Q THEN
	  		state[0] := 1011;
	  	ELSIF state[0] = 1482 & FE_FIN_L2.Q THEN
	  		state[0] := 1502;
	  	ELSIF state[0] = 1483 & FE_DESC_R.Q THEN
	  		state[0] := 1015;
	  	ELSIF state[0] = 1483 & FE_INICIO_L1.Q THEN
	  		state[0] := 1502;
	  	ELSIF state[0] = 1483 & FE_INICIO_L2.Q THEN
	  		state[0] := 1503;
	  	ELSIF state[0] = 1484 & FE_DESC_R.Q THEN
	  		state[0] := 1020;
	  	ELSIF state[0] = 1484 & FE_FIN_L1.Q THEN
	  		state[0] := 1503;
	  	ELSIF state[0] = 1485 & FE_GIRO_R.Q THEN
	  		state[0] := 1502;
	  	ELSIF state[0] = 1485 & FE_INICIO_L2.Q THEN
	  		state[0] := 1504;
	  	ELSIF state[0] = 1486 & FE_GIRO_R.Q THEN
	  		state[0] := 1503;
	  	ELSIF state[0] = 1486 & FE_INICIO_L1.Q THEN
	  		state[0] := 1504;
	  	ELSIF state[0] = 1489 & FE_DESC_R.Q THEN
	  		state[0] := 1011;
	  	ELSIF state[0] = 1489 & FE_FIN_L2.Q THEN
	  		state[0] := 1505;
	  	ELSIF state[0] = 1490 & FE_GIRO_R.Q THEN
	  		state[0] := 1505;
	  	ELSIF state[0] = 1490 & FE_INICIO_L2.Q THEN
	  		state[0] := 1506;
	  	ELSIF state[0] = 1493 & FE_DESC_R.Q THEN
	  		state[0] := 1015;
	  	ELSIF state[0] = 1493 & FE_INICIO_L1.Q THEN
	  		state[0] := 1505;
	  	ELSIF state[0] = 1493 & FE_INICIO_L2.Q THEN
	  		state[0] := 1507;
	  	ELSIF state[0] = 1494 & FE_GIRO_R.Q THEN
	  		state[0] := 1507;
	  	ELSIF state[0] = 1494 & FE_INICIO_L1.Q THEN
	  		state[0] := 1506;
	  	ELSIF state[0] = 1495 & FE_DESC_R.Q THEN
	  		state[0] := 1020;
	  	ELSIF state[0] = 1495 & FE_FIN_L1.Q THEN
	  		state[0] := 1507;
	  	ELSIF state[0] = 1496 & FE_DESC_R.Q THEN
	  		state[0] := 1077;
	  	ELSIF state[0] = 1496 & FE_INICIO_L2.Q THEN
	  		state[0] := 1508;
	  	ELSIF state[0] = 1497 & FE_DESC_R.Q THEN
	  		state[0] := 1082;
	  	ELSIF state[0] = 1497 & FE_INICIO_L1.Q THEN
	  		state[0] := 1508;
	  	ELSIF state[0] = 1498 & FE_GIRO_R.Q THEN
	  		state[0] := 1508;
	  	ELSIF state[0] = 1499 & FE_DESC_R.Q THEN
	  		state[0] := 1077;
	  	ELSIF state[0] = 1499 & FE_INICIO_L2.Q THEN
	  		state[0] := 1509;
	  	ELSIF state[0] = 1500 & FE_GIRO_R.Q THEN
	  		state[0] := 1509;
	  	ELSIF state[0] = 1501 & FE_DESC_R.Q THEN
	  		state[0] := 1082;
	  	ELSIF state[0] = 1501 & FE_INICIO_L1.Q THEN
	  		state[0] := 1509;
	  	ELSIF state[0] = 1502 & FE_DESC_R.Q THEN
	  		state[0] := 1133;
	  	ELSIF state[0] = 1502 & FE_INICIO_L2.Q THEN
	  		state[0] := 1510;
	  	ELSIF state[0] = 1503 & FE_DESC_R.Q THEN
	  		state[0] := 1138;
	  	ELSIF state[0] = 1503 & FE_INICIO_L1.Q THEN
	  		state[0] := 1510;
	  	ELSIF state[0] = 1504 & FE_GIRO_R.Q THEN
	  		state[0] := 1510;
	  	ELSIF state[0] = 1505 & FE_DESC_R.Q THEN
	  		state[0] := 1133;
	  	ELSIF state[0] = 1505 & FE_INICIO_L2.Q THEN
	  		state[0] := 1511;
	  	ELSIF state[0] = 1506 & FE_GIRO_R.Q THEN
	  		state[0] := 1511;
	  	ELSIF state[0] = 1507 & FE_DESC_R.Q THEN
	  		state[0] := 1138;
	  	ELSIF state[0] = 1507 & FE_INICIO_L1.Q THEN
	  		state[0] := 1511;
	  	ELSIF state[0] = 1508 & FE_DESC_R.Q THEN
	  		state[0] := 1191;
	  	ELSIF state[0] = 1509 & FE_DESC_R.Q THEN
	  		state[0] := 1191;
	  	ELSIF state[0] = 1510 & FE_DESC_R.Q THEN
	  		state[0] := 1242;
	  	ELSIF state[0] = 1511 & FE_DESC_R.Q THEN
	  		state[0] := 1242;
	  	END_IF;
	
	
	
	
	
	
	
	
		CASE state[0] OF
	  		2:
	  			GD_OUT_3 := 1;
			3:
	  			GD_OUT_5 := 1;
			4:
	  			GD_OUT_3 := 1;
			5:
	  			GD_OUT_5 := 1;
			7:
	  			CASE slt0[0] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[0] := (random_num + slt0[0]) MOD 2;
	  			random_num := random_num - slt0[0];
	 		10:
	  			CASE slt0[1] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[1] := (random_num + slt0[1]) MOD 2;
	  			random_num := random_num - slt0[1];
	 		12:
	  			GD_OUT_3 := 1;
			13:
	  			GD_OUT_5 := 1;
			14:
	  			GD_OUT_3 := 1;
			15:
	  			GD_OUT_5 := 1;
			17:
	  			GD_OUT_3 := 1;
			18:
	  			GD_OUT_5 := 1;
			19:
	  			GD_OUT_3 := 1;
			21:
	  			GD_OUT_5 := 1;
			22:
	  			GD_OUT_2 := 0;
	  		23:
	  			CASE slt0[2] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[2] := (random_num + slt0[2]) MOD 2;
	  			random_num := random_num - slt0[2];
	 		25:
	  			CASE slt0[3] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[3] := (random_num + slt0[3]) MOD 2;
	  			random_num := random_num - slt0[3];
	 		26:
	  			GD_OUT_4 := 0;
	  		27:
	  			CASE slt0[4] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[4] := (random_num + slt0[4]) MOD 2;
	  			random_num := random_num - slt0[4];
	 		28:
	  			CASE slt0[5] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[5] := (random_num + slt0[5]) MOD 2;
	  			random_num := random_num - slt0[5];
	 		29:
	  			GD_OUT_3 := 1;
			30:
	  			GD_OUT_5 := 1;
			31:
	  			GD_OUT_2 := 0;
	  		32:
	  			CASE slt0[6] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[6] := (random_num + slt0[6]) MOD 2;
	  			random_num := random_num - slt0[6];
	 		34:
	  			GD_OUT_3 := 1;
			35:
	  			CASE slt0[7] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[7] := (random_num + slt0[7]) MOD 2;
	  			random_num := random_num - slt0[7];
	 		36:
	  			CASE slt0[8] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[8] := (random_num + slt0[8]) MOD 2;
	  			random_num := random_num - slt0[8];
	 		37:
	  			CASE slt0[9] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[9] := (random_num + slt0[9]) MOD 2;
	  			random_num := random_num - slt0[9];
	 		38:
	  			GD_OUT_5 := 1;
			39:
	  			GD_OUT_4 := 0;
	  		40:
	  			GD_OUT_3 := 1;
			41:
	  			CASE slt0[10] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[10] := (random_num + slt0[10]) MOD 2;
	  			random_num := random_num - slt0[10];
	 		42:
	  			GD_OUT_3 := 1;
			43:
	  			GD_OUT_5 := 1;
			44:
	  			CASE slt0[11] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[11] := (random_num + slt0[11]) MOD 2;
	  			random_num := random_num - slt0[11];
	 		45:
	  			GD_OUT_5 := 1;
			48:
	  			CASE slt0[12] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[12] := (random_num + slt0[12]) MOD 3;
	  			random_num := random_num - slt0[12];
	 		49:
	  			CASE slt0[13] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[13] := (random_num + slt0[13]) MOD 3;
	  			random_num := random_num - slt0[13];
	 		51:
	  			CASE slt0[14] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[14] := (random_num + slt0[14]) MOD 3;
	  			random_num := random_num - slt0[14];
	 		52:
	  			CASE slt0[15] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[15] := (random_num + slt0[15]) MOD 3;
	  			random_num := random_num - slt0[15];
	 		54:
	  			CASE slt0[16] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[16] := (random_num + slt0[16]) MOD 2;
	  			random_num := random_num - slt0[16];
	 		56:
	  			GD_OUT_3 := 1;
			57:
	  			CASE slt0[17] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[17] := (random_num + slt0[17]) MOD 2;
	  			random_num := random_num - slt0[17];
	 		58:
	  			GD_OUT_3 := 1;
			60:
	  			GD_OUT_5 := 1;
			61:
	  			CASE slt0[18] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[18] := (random_num + slt0[18]) MOD 3;
	  			random_num := random_num - slt0[18];
	 		62:
	  			CASE slt0[19] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[19] := (random_num + slt0[19]) MOD 3;
	  			random_num := random_num - slt0[19];
	 		63:
	  			CASE slt0[20] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[20] := (random_num + slt0[20]) MOD 2;
	  			random_num := random_num - slt0[20];
	 		64:
	  			CASE slt0[21] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[21] := (random_num + slt0[21]) MOD 2;
	  			random_num := random_num - slt0[21];
	 		67:
	  			CASE slt0[22] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[22] := (random_num + slt0[22]) MOD 3;
	  			random_num := random_num - slt0[22];
	 		69:
	  			CASE slt0[23] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[23] := (random_num + slt0[23]) MOD 3;
	  			random_num := random_num - slt0[23];
	 		71:
	  			GD_OUT_5 := 1;
			72:
	  			CASE slt0[24] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[24] := (random_num + slt0[24]) MOD 2;
	  			random_num := random_num - slt0[24];
	 		73:
	  			GD_OUT_2 := 0;
	  		74:
	  			CASE slt0[25] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[25] := (random_num + slt0[25]) MOD 2;
	  			random_num := random_num - slt0[25];
	 		75:
	  			GD_OUT_4 := 0;
	  		76:
	  			CASE slt0[26] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[26] := (random_num + slt0[26]) MOD 2;
	  			random_num := random_num - slt0[26];
	 		78:
	  			GD_OUT_3 := 1;
			79:
	  			GD_OUT_5 := 1;
			81:
	  			GD_OUT_3 := 1;
			82:
	  			GD_OUT_5 := 1;
			83:
	  			CASE slt0[27] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[27] := (random_num + slt0[27]) MOD 2;
	  			random_num := random_num - slt0[27];
	 		84:
	  			CASE slt0[28] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[28] := (random_num + slt0[28]) MOD 4;
	  			random_num := random_num - slt0[28];
	 		85:
	  			CASE slt0[29] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[29] := (random_num + slt0[29]) MOD 2;
	  			random_num := random_num - slt0[29];
	 		87:
	  			GD_OUT_3 := 1;
			88:
	  			GD_OUT_5 := 1;
			89:
	  			CASE slt0[30] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[30] := (random_num + slt0[30]) MOD 2;
	  			random_num := random_num - slt0[30];
	 		90:
	  			CASE slt0[31] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[31] := (random_num + slt0[31]) MOD 4;
	  			random_num := random_num - slt0[31];
	 		91:
	  			CASE slt0[32] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[32] := (random_num + slt0[32]) MOD 2;
	  			random_num := random_num - slt0[32];
	 		92:
	  			GD_OUT_3 := 1;
			93:
	  			GD_OUT_5 := 1;
			94:
	  			GD_OUT_3 := 1;
			95:
	  			GD_OUT_5 := 1;
			96:
	  			CASE slt0[33] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[33] := (random_num + slt0[33]) MOD 2;
	  			random_num := random_num - slt0[33];
	 		97:
	  			GD_OUT_2 := 0;
	  		98:
	  			GD_OUT_3 := 1;
			99:
	  			CASE slt0[34] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[34] := (random_num + slt0[34]) MOD 2;
	  			random_num := random_num - slt0[34];
	 		100:
	  			CASE slt0[35] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[35] := (random_num + slt0[35]) MOD 2;
	  			random_num := random_num - slt0[35];
	 		101:
	  			CASE slt0[36] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[36] := (random_num + slt0[36]) MOD 2;
	  			random_num := random_num - slt0[36];
	 		102:
	  			GD_OUT_5 := 1;
			103:
	  			GD_OUT_4 := 0;
	  		104:
	  			GD_OUT_3 := 1;
			105:
	  			GD_OUT_3 := 1;
			106:
	  			CASE slt0[37] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[37] := (random_num + slt0[37]) MOD 4;
	  			random_num := random_num - slt0[37];
	 		107:
	  			GD_OUT_3 := 1;
			108:
	  			CASE slt0[38] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[38] := (random_num + slt0[38]) MOD 4;
	  			random_num := random_num - slt0[38];
	 		109:
	  			GD_OUT_3 := 1;
			110:
	  			CASE slt0[39] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[39] := (random_num + slt0[39]) MOD 2;
	  			random_num := random_num - slt0[39];
	 		112:
	  			GD_OUT_5 := 1;
			114:
	  			GD_OUT_5 := 1;
			115:
	  			CASE slt0[40] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[40] := (random_num + slt0[40]) MOD 2;
	  			random_num := random_num - slt0[40];
	 		117:
	  			GD_OUT_5 := 1;
			118:
	  			CASE slt0[41] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[41] := (random_num + slt0[41]) MOD 2;
	  			random_num := random_num - slt0[41];
	 		119:
	  			GD_OUT_5 := 1;
			120:
	  			GD_OUT_3 := 1;
			121:
	  			CASE slt0[42] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[42] := (random_num + slt0[42]) MOD 2;
	  			random_num := random_num - slt0[42];
	 		122:
	  			CASE slt0[43] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[43] := (random_num + slt0[43]) MOD 2;
	  			random_num := random_num - slt0[43];
	 		123:
	  			GD_OUT_5 := 1;
			125:
	  			GD_OUT_3 := 1;
			126:
	  			GD_OUT_5 := 1;
			128:
	  			CASE slt0[44] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[44] := (random_num + slt0[44]) MOD 2;
	  			random_num := random_num - slt0[44];
	 		130:
	  			GD_OUT_3 := 1;
			131:
	  			GD_OUT_5 := 1;
			133:
	  			CASE slt0[45] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[45] := (random_num + slt0[45]) MOD 2;
	  			random_num := random_num - slt0[45];
	 		135:
	  			CASE slt0[46] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[46] := (random_num + slt0[46]) MOD 3;
	  			random_num := random_num - slt0[46];
	 		136:
	  			CASE slt0[47] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[47] := (random_num + slt0[47]) MOD 3;
	  			random_num := random_num - slt0[47];
	 		137:
	  			CASE slt0[48] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[48] := (random_num + slt0[48]) MOD 3;
	  			random_num := random_num - slt0[48];
	 		138:
	  			CASE slt0[49] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[49] := (random_num + slt0[49]) MOD 3;
	  			random_num := random_num - slt0[49];
	 		140:
	  			GD_OUT_3 := 1;
			141:
	  			GD_OUT_5 := 1;
			143:
	  			CASE slt0[50] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[50] := (random_num + slt0[50]) MOD 2;
	  			random_num := random_num - slt0[50];
	 		145:
	  			CASE slt0[51] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[51] := (random_num + slt0[51]) MOD 3;
	  			random_num := random_num - slt0[51];
	 		146:
	  			CASE slt0[52] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[52] := (random_num + slt0[52]) MOD 3;
	  			random_num := random_num - slt0[52];
	 		147:
	  			CASE slt0[53] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[53] := (random_num + slt0[53]) MOD 3;
	  			random_num := random_num - slt0[53];
	 		148:
	  			CASE slt0[54] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[54] := (random_num + slt0[54]) MOD 3;
	  			random_num := random_num - slt0[54];
	 		149:
	  			GD_OUT_2 := 0;
	  		150:
	  			CASE slt0[55] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[55] := (random_num + slt0[55]) MOD 2;
	  			random_num := random_num - slt0[55];
	 		152:
	  			CASE slt0[56] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[56] := (random_num + slt0[56]) MOD 2;
	  			random_num := random_num - slt0[56];
	 		153:
	  			GD_OUT_4 := 0;
	  		154:
	  			GD_OUT_3 := 1;
			155:
	  			GD_OUT_2 := 0;
	  		156:
	  			CASE slt0[57] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[57] := (random_num + slt0[57]) MOD 2;
	  			random_num := random_num - slt0[57];
	 		157:
	  			CASE slt0[58] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[58] := (random_num + slt0[58]) MOD 3;
	  			random_num := random_num - slt0[58];
	 		158:
	  			CASE slt0[59] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[59] := (random_num + slt0[59]) MOD 3;
	  			random_num := random_num - slt0[59];
	 		159:
	  			CASE slt0[60] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[60] := (random_num + slt0[60]) MOD 2;
	  			random_num := random_num - slt0[60];
	 		160:
	  			CASE slt0[61] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[61] := (random_num + slt0[61]) MOD 2;
	  			random_num := random_num - slt0[61];
	 		163:
	  			CASE slt0[62] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[62] := (random_num + slt0[62]) MOD 3;
	  			random_num := random_num - slt0[62];
	 		165:
	  			CASE slt0[63] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[63] := (random_num + slt0[63]) MOD 3;
	  			random_num := random_num - slt0[63];
	 		167:
	  			GD_OUT_5 := 1;
			168:
	  			GD_OUT_3 := 1;
			169:
	  			CASE slt0[64] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[64] := (random_num + slt0[64]) MOD 2;
	  			random_num := random_num - slt0[64];
	 		170:
	  			GD_OUT_3 := 1;
			171:
	  			CASE slt0[65] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[65] := (random_num + slt0[65]) MOD 2;
	  			random_num := random_num - slt0[65];
	 		172:
	  			CASE slt0[66] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[66] := (random_num + slt0[66]) MOD 3;
	  			random_num := random_num - slt0[66];
	 		173:
	  			GD_OUT_3 := 1;
			174:
	  			CASE slt0[67] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[67] := (random_num + slt0[67]) MOD 2;
	  			random_num := random_num - slt0[67];
	 		175:
	  			CASE slt0[68] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[68] := (random_num + slt0[68]) MOD 3;
	  			random_num := random_num - slt0[68];
	 		176:
	  			CASE slt0[69] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[69] := (random_num + slt0[69]) MOD 2;
	  			random_num := random_num - slt0[69];
	 		177:
	  			GD_OUT_5 := 1;
			179:
	  			GD_OUT_5 := 1;
			181:
	  			CASE slt0[70] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[70] := (random_num + slt0[70]) MOD 3;
	  			random_num := random_num - slt0[70];
	 		182:
	  			GD_OUT_5 := 1;
			184:
	  			CASE slt0[71] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[71] := (random_num + slt0[71]) MOD 3;
	  			random_num := random_num - slt0[71];
	 		185:
	  			GD_OUT_4 := 0;
	  		186:
	  			CASE slt0[72] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[72] := (random_num + slt0[72]) MOD 2;
	  			random_num := random_num - slt0[72];
	 		187:
	  			CASE slt0[73] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[73] := (random_num + slt0[73]) MOD 2;
	  			random_num := random_num - slt0[73];
	 		188:
	  			CASE slt0[74] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[74] := (random_num + slt0[74]) MOD 2;
	  			random_num := random_num - slt0[74];
	 		189:
	  			GD_OUT_3 := 1;
			190:
	  			GD_OUT_5 := 1;
			192:
	  			CASE slt0[75] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[75] := (random_num + slt0[75]) MOD 2;
	  			random_num := random_num - slt0[75];
	 		194:
	  			GD_OUT_3 := 1;
			195:
	  			GD_OUT_5 := 1;
			196:
	  			GD_OUT_3 := 1;
			197:
	  			GD_OUT_5 := 1;
			199:
	  			CASE slt0[76] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[76] := (random_num + slt0[76]) MOD 2;
	  			random_num := random_num - slt0[76];
	 		201:
	  			GD_OUT_3 := 1;
			202:
	  			GD_OUT_5 := 1;
			203:
	  			GD_OUT_3 := 1;
			204:
	  			GD_OUT_5 := 1;
			205:
	  			CASE slt0[77] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[77] := (random_num + slt0[77]) MOD 3;
	  			random_num := random_num - slt0[77];
	 		206:
	  			CASE slt0[78] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[78] := (random_num + slt0[78]) MOD 4;
	  			random_num := random_num - slt0[78];
	 		207:
	  			CASE slt0[79] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[79] := (random_num + slt0[79]) MOD 2;
	  			random_num := random_num - slt0[79];
	 		208:
	  			CASE slt0[80] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[80] := (random_num + slt0[80]) MOD 4;
	  			random_num := random_num - slt0[80];
	 		209:
	  			CASE slt0[81] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[81] := (random_num + slt0[81]) MOD 3;
	  			random_num := random_num - slt0[81];
	 		210:
	  			GD_OUT_3 := 1;
			211:
	  			GD_OUT_5 := 1;
			213:
	  			CASE slt0[82] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[82] := (random_num + slt0[82]) MOD 2;
	  			random_num := random_num - slt0[82];
	 		215:
	  			GD_OUT_3 := 1;
			216:
	  			GD_OUT_5 := 1;
			217:
	  			GD_OUT_3 := 1;
			218:
	  			GD_OUT_5 := 1;
			219:
	  			CASE slt0[83] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[83] := (random_num + slt0[83]) MOD 3;
	  			random_num := random_num - slt0[83];
	 		220:
	  			CASE slt0[84] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[84] := (random_num + slt0[84]) MOD 4;
	  			random_num := random_num - slt0[84];
	 		221:
	  			CASE slt0[85] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[85] := (random_num + slt0[85]) MOD 2;
	  			random_num := random_num - slt0[85];
	 		222:
	  			CASE slt0[86] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[86] := (random_num + slt0[86]) MOD 4;
	  			random_num := random_num - slt0[86];
	 		223:
	  			CASE slt0[87] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[87] := (random_num + slt0[87]) MOD 3;
	  			random_num := random_num - slt0[87];
	 		224:
	  			GD_OUT_3 := 1;
			225:
	  			CASE slt0[88] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[88] := (random_num + slt0[88]) MOD 2;
	  			random_num := random_num - slt0[88];
	 		226:
	  			GD_OUT_3 := 1;
			227:
	  			GD_OUT_5 := 1;
			228:
	  			CASE slt0[89] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[89] := (random_num + slt0[89]) MOD 2;
	  			random_num := random_num - slt0[89];
	 		229:
	  			GD_OUT_5 := 1;
			230:
	  			GD_OUT_3 := 1;
			231:
	  			CASE slt0[90] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[90] := (random_num + slt0[90]) MOD 2;
	  			random_num := random_num - slt0[90];
	 		232:
	  			CASE slt0[91] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[91] := (random_num + slt0[91]) MOD 3;
	  			random_num := random_num - slt0[91];
	 		233:
	  			CASE slt0[92] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[92] := (random_num + slt0[92]) MOD 3;
	  			random_num := random_num - slt0[92];
	 		234:
	  			CASE slt0[93] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[93] := (random_num + slt0[93]) MOD 2;
	  			random_num := random_num - slt0[93];
	 		235:
	  			CASE slt0[94] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[94] := (random_num + slt0[94]) MOD 2;
	  			random_num := random_num - slt0[94];
	 		236:
	  			GD_OUT_3 := 1;
			237:
	  			GD_OUT_3 := 1;
			238:
	  			CASE slt0[95] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[95] := (random_num + slt0[95]) MOD 4;
	  			random_num := random_num - slt0[95];
	 		239:
	  			GD_OUT_3 := 1;
			240:
	  			CASE slt0[96] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[96] := (random_num + slt0[96]) MOD 4;
	  			random_num := random_num - slt0[96];
	 		241:
	  			GD_OUT_3 := 1;
			242:
	  			CASE slt0[97] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[97] := (random_num + slt0[97]) MOD 2;
	  			random_num := random_num - slt0[97];
	 		244:
	  			GD_OUT_5 := 1;
			246:
	  			GD_OUT_5 := 1;
			247:
	  			CASE slt0[98] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[98] := (random_num + slt0[98]) MOD 2;
	  			random_num := random_num - slt0[98];
	 		249:
	  			GD_OUT_5 := 1;
			250:
	  			CASE slt0[99] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[99] := (random_num + slt0[99]) MOD 2;
	  			random_num := random_num - slt0[99];
	 		251:
	  			GD_OUT_5 := 1;
			252:
	  			CASE slt0[100] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[100] := (random_num + slt0[100]) MOD 2;
	  			random_num := random_num - slt0[100];
	 		253:
	  			GD_OUT_3 := 1;
			254:
	  			CASE slt0[101] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[101] := (random_num + slt0[101]) MOD 2;
	  			random_num := random_num - slt0[101];
	 		255:
	  			GD_OUT_3 := 1;
			256:
	  			CASE slt0[102] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[102] := (random_num + slt0[102]) MOD 4;
	  			random_num := random_num - slt0[102];
	 		257:
	  			CASE slt0[103] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[103] := (random_num + slt0[103]) MOD 2;
	  			random_num := random_num - slt0[103];
	 		258:
	  			GD_OUT_3 := 1;
			259:
	  			CASE slt0[104] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[104] := (random_num + slt0[104]) MOD 4;
	  			random_num := random_num - slt0[104];
	 		260:
	  			CASE slt0[105] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[105] := (random_num + slt0[105]) MOD 2;
	  			random_num := random_num - slt0[105];
	 		262:
	  			GD_OUT_5 := 1;
			264:
	  			GD_OUT_5 := 1;
			265:
	  			CASE slt0[106] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[106] := (random_num + slt0[106]) MOD 3;
	  			random_num := random_num - slt0[106];
	 		267:
	  			GD_OUT_5 := 1;
			268:
	  			CASE slt0[107] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[107] := (random_num + slt0[107]) MOD 3;
	  			random_num := random_num - slt0[107];
	 		269:
	  			GD_OUT_5 := 1;
			270:
	  			CASE slt0[108] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[108] := (random_num + slt0[108]) MOD 2;
	  			random_num := random_num - slt0[108];
	 		271:
	  			CASE slt0[109] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[109] := (random_num + slt0[109]) MOD 2;
	  			random_num := random_num - slt0[109];
	 		273:
	  			CASE slt0[110] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[110] := (random_num + slt0[110]) MOD 2;
	  			random_num := random_num - slt0[110];
	 		275:
	  			GD_OUT_3 := 1;
			276:
	  			GD_OUT_5 := 1;
			277:
	  			GD_OUT_3 := 1;
			278:
	  			GD_OUT_5 := 1;
			279:
	  			GD_OUT_2 := 0;
	  		280:
	  			CASE slt0[111] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[111] := (random_num + slt0[111]) MOD 2;
	  			random_num := random_num - slt0[111];
	 		282:
	  			CASE slt0[112] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[112] := (random_num + slt0[112]) MOD 2;
	  			random_num := random_num - slt0[112];
	 		283:
	  			GD_OUT_4 := 0;
	  		284:
	  			GD_OUT_3 := 1;
			285:
	  			GD_OUT_5 := 1;
			286:
	  			GD_OUT_3 := 1;
			287:
	  			GD_OUT_5 := 1;
			288:
	  			GD_OUT_2 := 0;
	  		289:
	  			CASE slt0[113] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[113] := (random_num + slt0[113]) MOD 2;
	  			random_num := random_num - slt0[113];
	 		291:
	  			CASE slt0[114] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[114] := (random_num + slt0[114]) MOD 2;
	  			random_num := random_num - slt0[114];
	 		292:
	  			GD_OUT_4 := 0;
	  		293:
	  			CASE slt0[115] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[115] := (random_num + slt0[115]) MOD 3;
	  			random_num := random_num - slt0[115];
	 		294:
	  			CASE slt0[116] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[116] := (random_num + slt0[116]) MOD 4;
	  			random_num := random_num - slt0[116];
	 		295:
	  			CASE slt0[117] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[117] := (random_num + slt0[117]) MOD 3;
	  			random_num := random_num - slt0[117];
	 		296:
	  			CASE slt0[118] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[118] := (random_num + slt0[118]) MOD 3;
	  			random_num := random_num - slt0[118];
	 		297:
	  			CASE slt0[119] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[119] := (random_num + slt0[119]) MOD 4;
	  			random_num := random_num - slt0[119];
	 		298:
	  			CASE slt0[120] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[120] := (random_num + slt0[120]) MOD 3;
	  			random_num := random_num - slt0[120];
	 		300:
	  			CASE slt0[121] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[121] := (random_num + slt0[121]) MOD 2;
	  			random_num := random_num - slt0[121];
	 		302:
	  			GD_OUT_3 := 1;
			303:
	  			GD_OUT_5 := 1;
			304:
	  			GD_OUT_3 := 1;
			305:
	  			GD_OUT_5 := 1;
			306:
	  			GD_OUT_2 := 0;
	  		307:
	  			CASE slt0[122] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[122] := (random_num + slt0[122]) MOD 2;
	  			random_num := random_num - slt0[122];
	 		309:
	  			CASE slt0[123] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[123] := (random_num + slt0[123]) MOD 2;
	  			random_num := random_num - slt0[123];
	 		310:
	  			GD_OUT_4 := 0;
	  		311:
	  			CASE slt0[124] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[124] := (random_num + slt0[124]) MOD 3;
	  			random_num := random_num - slt0[124];
	 		312:
	  			CASE slt0[125] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[125] := (random_num + slt0[125]) MOD 4;
	  			random_num := random_num - slt0[125];
	 		313:
	  			CASE slt0[126] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[126] := (random_num + slt0[126]) MOD 3;
	  			random_num := random_num - slt0[126];
	 		314:
	  			CASE slt0[127] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[127] := (random_num + slt0[127]) MOD 3;
	  			random_num := random_num - slt0[127];
	 		315:
	  			CASE slt0[128] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[128] := (random_num + slt0[128]) MOD 4;
	  			random_num := random_num - slt0[128];
	 		316:
	  			CASE slt0[129] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[129] := (random_num + slt0[129]) MOD 3;
	  			random_num := random_num - slt0[129];
	 		317:
	  			CASE slt0[130] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[130] := (random_num + slt0[130]) MOD 2;
	  			random_num := random_num - slt0[130];
	 		318:
	  			GD_OUT_2 := 0;
	  		319:
	  			CASE slt0[131] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[131] := (random_num + slt0[131]) MOD 2;
	  			random_num := random_num - slt0[131];
	 		320:
	  			GD_OUT_4 := 0;
	  		321:
	  			CASE slt0[132] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[132] := (random_num + slt0[132]) MOD 2;
	  			random_num := random_num - slt0[132];
	 		322:
	  			CASE slt0[133] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[133] := (random_num + slt0[133]) MOD 3;
	  			random_num := random_num - slt0[133];
	 		323:
	  			CASE slt0[134] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[134] := (random_num + slt0[134]) MOD 3;
	  			random_num := random_num - slt0[134];
	 		324:
	  			CASE slt0[135] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[135] := (random_num + slt0[135]) MOD 2;
	  			random_num := random_num - slt0[135];
	 		325:
	  			CASE slt0[136] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[136] := (random_num + slt0[136]) MOD 2;
	  			random_num := random_num - slt0[136];
	 		326:
	  			GD_OUT_2 := 0;
	  		327:
	  			GD_OUT_2 := 0;
	  		328:
	  			CASE slt0[137] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[137] := (random_num + slt0[137]) MOD 4;
	  			random_num := random_num - slt0[137];
	 		329:
	  			GD_OUT_2 := 0;
	  		330:
	  			CASE slt0[138] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[138] := (random_num + slt0[138]) MOD 4;
	  			random_num := random_num - slt0[138];
	 		331:
	  			GD_OUT_2 := 0;
	  		332:
	  			CASE slt0[139] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[139] := (random_num + slt0[139]) MOD 2;
	  			random_num := random_num - slt0[139];
	 		333:
	  			GD_OUT_3 := 1;
			334:
	  			CASE slt0[140] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[140] := (random_num + slt0[140]) MOD 2;
	  			random_num := random_num - slt0[140];
	 		335:
	  			GD_OUT_3 := 1;
			336:
	  			CASE slt0[141] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[141] := (random_num + slt0[141]) MOD 2;
	  			random_num := random_num - slt0[141];
	 		337:
	  			CASE slt0[142] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[142] := (random_num + slt0[142]) MOD 3;
	  			random_num := random_num - slt0[142];
	 		338:
	  			GD_OUT_3 := 1;
			339:
	  			CASE slt0[143] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[143] := (random_num + slt0[143]) MOD 2;
	  			random_num := random_num - slt0[143];
	 		340:
	  			CASE slt0[144] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[144] := (random_num + slt0[144]) MOD 3;
	  			random_num := random_num - slt0[144];
	 		341:
	  			CASE slt0[145] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[145] := (random_num + slt0[145]) MOD 2;
	  			random_num := random_num - slt0[145];
	 		342:
	  			GD_OUT_5 := 1;
			344:
	  			GD_OUT_5 := 1;
			346:
	  			CASE slt0[146] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[146] := (random_num + slt0[146]) MOD 3;
	  			random_num := random_num - slt0[146];
	 		347:
	  			GD_OUT_5 := 1;
			349:
	  			CASE slt0[147] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[147] := (random_num + slt0[147]) MOD 3;
	  			random_num := random_num - slt0[147];
	 		350:
	  			GD_OUT_4 := 0;
	  		351:
	  			GD_OUT_3 := 1;
			352:
	  			CASE slt0[148] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[148] := (random_num + slt0[148]) MOD 2;
	  			random_num := random_num - slt0[148];
	 		353:
	  			GD_OUT_3 := 1;
			354:
	  			CASE slt0[149] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[149] := (random_num + slt0[149]) MOD 2;
	  			random_num := random_num - slt0[149];
	 		355:
	  			CASE slt0[150] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[150] := (random_num + slt0[150]) MOD 4;
	  			random_num := random_num - slt0[150];
	 		356:
	  			GD_OUT_3 := 1;
			357:
	  			CASE slt0[151] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[151] := (random_num + slt0[151]) MOD 2;
	  			random_num := random_num - slt0[151];
	 		358:
	  			CASE slt0[152] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[152] := (random_num + slt0[152]) MOD 4;
	  			random_num := random_num - slt0[152];
	 		359:
	  			CASE slt0[153] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[153] := (random_num + slt0[153]) MOD 2;
	  			random_num := random_num - slt0[153];
	 		360:
	  			GD_OUT_5 := 1;
			361:
	  			GD_OUT_4 := 0;
	  		362:
	  			GD_OUT_5 := 1;
			363:
	  			GD_OUT_4 := 0;
	  		364:
	  			CASE slt0[154] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[154] := (random_num + slt0[154]) MOD 3;
	  			random_num := random_num - slt0[154];
	 		365:
	  			GD_OUT_5 := 1;
			366:
	  			GD_OUT_4 := 0;
	  		367:
	  			CASE slt0[155] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[155] := (random_num + slt0[155]) MOD 3;
	  			random_num := random_num - slt0[155];
	 		368:
	  			CASE slt0[156] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[156] := (random_num + slt0[156]) MOD 2;
	  			random_num := random_num - slt0[156];
	 		370:
	  			GD_OUT_3 := 1;
			371:
	  			GD_OUT_5 := 1;
			372:
	  			GD_OUT_3 := 1;
			374:
	  			GD_OUT_5 := 1;
			375:
	  			GD_OUT_2 := 0;
	  		376:
	  			CASE slt0[157] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[157] := (random_num + slt0[157]) MOD 2;
	  			random_num := random_num - slt0[157];
	 		378:
	  			CASE slt0[158] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[158] := (random_num + slt0[158]) MOD 2;
	  			random_num := random_num - slt0[158];
	 		379:
	  			GD_OUT_4 := 0;
	  		380:
	  			GD_OUT_3 := 1;
			381:
	  			CASE slt0[159] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[159] := (random_num + slt0[159]) MOD 2;
	  			random_num := random_num - slt0[159];
	 		382:
	  			GD_OUT_3 := 1;
			383:
	  			GD_OUT_5 := 1;
			384:
	  			CASE slt0[160] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[160] := (random_num + slt0[160]) MOD 2;
	  			random_num := random_num - slt0[160];
	 		385:
	  			GD_OUT_5 := 1;
			386:
	  			GD_OUT_2 := 0;
	  		387:
	  			CASE slt0[161] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[161] := (random_num + slt0[161]) MOD 2;
	  			random_num := random_num - slt0[161];
	 		389:
	  			CASE slt0[162] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[162] := (random_num + slt0[162]) MOD 2;
	  			random_num := random_num - slt0[162];
	 		390:
	  			GD_OUT_4 := 0;
	  		391:
	  			GD_OUT_3 := 1;
			392:
	  			CASE slt0[163] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[163] := (random_num + slt0[163]) MOD 2;
	  			random_num := random_num - slt0[163];
	 		393:
	  			GD_OUT_3 := 1;
			394:
	  			GD_OUT_5 := 1;
			395:
	  			CASE slt0[164] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[164] := (random_num + slt0[164]) MOD 2;
	  			random_num := random_num - slt0[164];
	 		396:
	  			GD_OUT_5 := 1;
			397:
	  			CASE slt0[165] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[165] := (random_num + slt0[165]) MOD 4;
	  			random_num := random_num - slt0[165];
	 		398:
	  			CASE slt0[166] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[166] := (random_num + slt0[166]) MOD 3;
	  			random_num := random_num - slt0[166];
	 		399:
	  			CASE slt0[167] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[167] := (random_num + slt0[167]) MOD 4;
	  			random_num := random_num - slt0[167];
	 		400:
	  			CASE slt0[168] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[168] := (random_num + slt0[168]) MOD 3;
	  			random_num := random_num - slt0[168];
	 		401:
	  			CASE slt0[169] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[169] := (random_num + slt0[169]) MOD 4;
	  			random_num := random_num - slt0[169];
	 		403:
	  			GD_OUT_3 := 1;
			404:
	  			GD_OUT_5 := 1;
			405:
	  			GD_OUT_3 := 1;
			407:
	  			GD_OUT_5 := 1;
			408:
	  			GD_OUT_2 := 0;
	  		409:
	  			CASE slt0[170] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[170] := (random_num + slt0[170]) MOD 2;
	  			random_num := random_num - slt0[170];
	 		411:
	  			CASE slt0[171] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[171] := (random_num + slt0[171]) MOD 2;
	  			random_num := random_num - slt0[171];
	 		412:
	  			GD_OUT_4 := 0;
	  		413:
	  			GD_OUT_3 := 1;
			414:
	  			CASE slt0[172] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[172] := (random_num + slt0[172]) MOD 2;
	  			random_num := random_num - slt0[172];
	 		415:
	  			GD_OUT_3 := 1;
			416:
	  			GD_OUT_5 := 1;
			417:
	  			CASE slt0[173] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[173] := (random_num + slt0[173]) MOD 2;
	  			random_num := random_num - slt0[173];
	 		418:
	  			GD_OUT_5 := 1;
			419:
	  			CASE slt0[174] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[174] := (random_num + slt0[174]) MOD 4;
	  			random_num := random_num - slt0[174];
	 		420:
	  			CASE slt0[175] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[175] := (random_num + slt0[175]) MOD 3;
	  			random_num := random_num - slt0[175];
	 		421:
	  			CASE slt0[176] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[176] := (random_num + slt0[176]) MOD 4;
	  			random_num := random_num - slt0[176];
	 		422:
	  			CASE slt0[177] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[177] := (random_num + slt0[177]) MOD 3;
	  			random_num := random_num - slt0[177];
	 		423:
	  			CASE slt0[178] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[178] := (random_num + slt0[178]) MOD 4;
	  			random_num := random_num - slt0[178];
	 		424:
	  			GD_OUT_3 := 1;
			425:
	  			CASE slt0[179] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[179] := (random_num + slt0[179]) MOD 2;
	  			random_num := random_num - slt0[179];
	 		426:
	  			CASE slt0[180] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[180] := (random_num + slt0[180]) MOD 2;
	  			random_num := random_num - slt0[180];
	 		427:
	  			GD_OUT_5 := 1;
			428:
	  			GD_OUT_3 := 1;
			429:
	  			GD_OUT_3 := 1;
			430:
	  			CASE slt0[181] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[181] := (random_num + slt0[181]) MOD 4;
	  			random_num := random_num - slt0[181];
	 		431:
	  			GD_OUT_3 := 1;
			432:
	  			CASE slt0[182] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[182] := (random_num + slt0[182]) MOD 4;
	  			random_num := random_num - slt0[182];
	 		433:
	  			GD_OUT_3 := 1;
			434:
	  			CASE slt0[183] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[183] := (random_num + slt0[183]) MOD 2;
	  			random_num := random_num - slt0[183];
	 		435:
	  			GD_OUT_2 := 0;
	  		436:
	  			CASE slt0[184] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[184] := (random_num + slt0[184]) MOD 2;
	  			random_num := random_num - slt0[184];
	 		437:
	  			GD_OUT_2 := 0;
	  		438:
	  			CASE slt0[185] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[185] := (random_num + slt0[185]) MOD 2;
	  			random_num := random_num - slt0[185];
	 		439:
	  			CASE slt0[186] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[186] := (random_num + slt0[186]) MOD 3;
	  			random_num := random_num - slt0[186];
	 		440:
	  			GD_OUT_2 := 0;
	  		441:
	  			CASE slt0[187] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[187] := (random_num + slt0[187]) MOD 2;
	  			random_num := random_num - slt0[187];
	 		442:
	  			CASE slt0[188] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[188] := (random_num + slt0[188]) MOD 3;
	  			random_num := random_num - slt0[188];
	 		443:
	  			CASE slt0[189] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[189] := (random_num + slt0[189]) MOD 2;
	  			random_num := random_num - slt0[189];
	 		444:
	  			CASE slt0[190] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[190] := (random_num + slt0[190]) MOD 2;
	  			random_num := random_num - slt0[190];
	 		445:
	  			GD_OUT_3 := 1;
			446:
	  			CASE slt0[191] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[191] := (random_num + slt0[191]) MOD 2;
	  			random_num := random_num - slt0[191];
	 		447:
	  			GD_OUT_3 := 1;
			448:
	  			CASE slt0[192] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[192] := (random_num + slt0[192]) MOD 4;
	  			random_num := random_num - slt0[192];
	 		449:
	  			CASE slt0[193] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[193] := (random_num + slt0[193]) MOD 2;
	  			random_num := random_num - slt0[193];
	 		450:
	  			GD_OUT_3 := 1;
			451:
	  			CASE slt0[194] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[194] := (random_num + slt0[194]) MOD 4;
	  			random_num := random_num - slt0[194];
	 		452:
	  			CASE slt0[195] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[195] := (random_num + slt0[195]) MOD 2;
	  			random_num := random_num - slt0[195];
	 		454:
	  			GD_OUT_5 := 1;
			456:
	  			GD_OUT_5 := 1;
			457:
	  			CASE slt0[196] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[196] := (random_num + slt0[196]) MOD 3;
	  			random_num := random_num - slt0[196];
	 		459:
	  			GD_OUT_5 := 1;
			460:
	  			CASE slt0[197] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[197] := (random_num + slt0[197]) MOD 3;
	  			random_num := random_num - slt0[197];
	 		461:
	  			GD_OUT_5 := 1;
			462:
	  			CASE slt0[198] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[198] := (random_num + slt0[198]) MOD 2;
	  			random_num := random_num - slt0[198];
	 		463:
	  			CASE slt0[199] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[199] := (random_num + slt0[199]) MOD 2;
	  			random_num := random_num - slt0[199];
	 		464:
	  			CASE slt0[200] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[200] := (random_num + slt0[200]) MOD 2;
	  			random_num := random_num - slt0[200];
	 		465:
	  			CASE slt0[201] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[201] := (random_num + slt0[201]) MOD 2;
	  			random_num := random_num - slt0[201];
	 		466:
	  			CASE slt0[202] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[202] := (random_num + slt0[202]) MOD 4;
	  			random_num := random_num - slt0[202];
	 		467:
	  			CASE slt0[203] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[203] := (random_num + slt0[203]) MOD 2;
	  			random_num := random_num - slt0[203];
	 		468:
	  			CASE slt0[204] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[204] := (random_num + slt0[204]) MOD 2;
	  			random_num := random_num - slt0[204];
	 		469:
	  			CASE slt0[205] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[205] := (random_num + slt0[205]) MOD 4;
	  			random_num := random_num - slt0[205];
	 		470:
	  			GD_OUT_4 := 0;
	  		471:
	  			GD_OUT_5 := 1;
			472:
	  			GD_OUT_4 := 0;
	  		473:
	  			GD_OUT_5 := 1;
			474:
	  			GD_OUT_4 := 0;
	  		475:
	  			GD_OUT_5 := 1;
			476:
	  			GD_OUT_1 := 1;
			477:
	  			CASE slt0[206] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[206] := (random_num + slt0[206]) MOD 2;
	  			random_num := random_num - slt0[206];
	 		478:
	  			GD_OUT_3 := 1;
			479:
	  			GD_OUT_5 := 1;
			480:
	  			GD_OUT_2 := 0;
	  		481:
	  			CASE slt0[207] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[207] := (random_num + slt0[207]) MOD 2;
	  			random_num := random_num - slt0[207];
	 		483:
	  			GD_OUT_3 := 1;
			484:
	  			CASE slt0[208] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[208] := (random_num + slt0[208]) MOD 2;
	  			random_num := random_num - slt0[208];
	 		485:
	  			GD_OUT_1 := 1;
			486:
	  			CASE slt0[209] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[209] := (random_num + slt0[209]) MOD 2;
	  			random_num := random_num - slt0[209];
	 		487:
	  			GD_OUT_5 := 1;
			488:
	  			GD_OUT_4 := 0;
	  		489:
	  			GD_OUT_3 := 1;
			490:
	  			CASE slt0[210] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[210] := (random_num + slt0[210]) MOD 2;
	  			random_num := random_num - slt0[210];
	 		491:
	  			GD_OUT_3 := 1;
			492:
	  			GD_OUT_5 := 1;
			493:
	  			CASE slt0[211] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[211] := (random_num + slt0[211]) MOD 2;
	  			random_num := random_num - slt0[211];
	 		494:
	  			GD_OUT_5 := 1;
			495:
	  			CASE slt0[212] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[212] := (random_num + slt0[212]) MOD 2;
	  			random_num := random_num - slt0[212];
	 		496:
	  			GD_OUT_2 := 0;
	  		497:
	  			CASE slt0[213] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[213] := (random_num + slt0[213]) MOD 2;
	  			random_num := random_num - slt0[213];
	 		498:
	  			GD_OUT_4 := 0;
	  		499:
	  			CASE slt0[214] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[214] := (random_num + slt0[214]) MOD 2;
	  			random_num := random_num - slt0[214];
	 		500:
	  			GD_OUT_3 := 1;
			501:
	  			CASE slt0[215] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[215] := (random_num + slt0[215]) MOD 2;
	  			random_num := random_num - slt0[215];
	 		502:
	  			GD_OUT_3 := 1;
			503:
	  			GD_OUT_5 := 1;
			504:
	  			CASE slt0[216] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[216] := (random_num + slt0[216]) MOD 2;
	  			random_num := random_num - slt0[216];
	 		505:
	  			GD_OUT_5 := 1;
			506:
	  			CASE slt0[217] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[217] := (random_num + slt0[217]) MOD 2;
	  			random_num := random_num - slt0[217];
	 		507:
	  			GD_OUT_2 := 0;
	  		508:
	  			CASE slt0[218] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[218] := (random_num + slt0[218]) MOD 2;
	  			random_num := random_num - slt0[218];
	 		509:
	  			GD_OUT_4 := 0;
	  		510:
	  			CASE slt0[219] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[219] := (random_num + slt0[219]) MOD 2;
	  			random_num := random_num - slt0[219];
	 		511:
	  			CASE slt0[220] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[220] := (random_num + slt0[220]) MOD 3;
	  			random_num := random_num - slt0[220];
	 		512:
	  			CASE slt0[221] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[221] := (random_num + slt0[221]) MOD 4;
	  			random_num := random_num - slt0[221];
	 		513:
	  			CASE slt0[222] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[222] := (random_num + slt0[222]) MOD 4;
	  			random_num := random_num - slt0[222];
	 		514:
	  			CASE slt0[223] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[223] := (random_num + slt0[223]) MOD 3;
	  			random_num := random_num - slt0[223];
	 		515:
	  			CASE slt0[224] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[224] := (random_num + slt0[224]) MOD 2;
	  			random_num := random_num - slt0[224];
	 		516:
	  			GD_OUT_1 := 1;
			517:
	  			GD_OUT_3 := 1;
			518:
	  			GD_OUT_5 := 1;
			519:
	  			GD_OUT_2 := 0;
	  		520:
	  			CASE slt0[225] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[225] := (random_num + slt0[225]) MOD 2;
	  			random_num := random_num - slt0[225];
	 		522:
	  			GD_OUT_3 := 1;
			523:
	  			CASE slt0[226] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[226] := (random_num + slt0[226]) MOD 2;
	  			random_num := random_num - slt0[226];
	 		524:
	  			CASE slt0[227] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[227] := (random_num + slt0[227]) MOD 2;
	  			random_num := random_num - slt0[227];
	 		525:
	  			GD_OUT_1 := 1;
			526:
	  			GD_OUT_5 := 1;
			527:
	  			GD_OUT_4 := 0;
	  		528:
	  			GD_OUT_3 := 1;
			529:
	  			CASE slt0[228] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[228] := (random_num + slt0[228]) MOD 2;
	  			random_num := random_num - slt0[228];
	 		530:
	  			GD_OUT_3 := 1;
			531:
	  			GD_OUT_5 := 1;
			532:
	  			CASE slt0[229] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[229] := (random_num + slt0[229]) MOD 2;
	  			random_num := random_num - slt0[229];
	 		533:
	  			GD_OUT_5 := 1;
			534:
	  			CASE slt0[230] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[230] := (random_num + slt0[230]) MOD 2;
	  			random_num := random_num - slt0[230];
	 		535:
	  			GD_OUT_2 := 0;
	  		536:
	  			CASE slt0[231] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[231] := (random_num + slt0[231]) MOD 2;
	  			random_num := random_num - slt0[231];
	 		537:
	  			GD_OUT_4 := 0;
	  		538:
	  			CASE slt0[232] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[232] := (random_num + slt0[232]) MOD 2;
	  			random_num := random_num - slt0[232];
	 		539:
	  			CASE slt0[233] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[233] := (random_num + slt0[233]) MOD 3;
	  			random_num := random_num - slt0[233];
	 		540:
	  			CASE slt0[234] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[234] := (random_num + slt0[234]) MOD 4;
	  			random_num := random_num - slt0[234];
	 		541:
	  			CASE slt0[235] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[235] := (random_num + slt0[235]) MOD 4;
	  			random_num := random_num - slt0[235];
	 		542:
	  			CASE slt0[236] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[236] := (random_num + slt0[236]) MOD 3;
	  			random_num := random_num - slt0[236];
	 		543:
	  			CASE slt0[237] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[237] := (random_num + slt0[237]) MOD 2;
	  			random_num := random_num - slt0[237];
	 		544:
	  			CASE slt0[238] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[238] := (random_num + slt0[238]) MOD 2;
	  			random_num := random_num - slt0[238];
	 		545:
	  			CASE slt0[239] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[239] := (random_num + slt0[239]) MOD 2;
	  			random_num := random_num - slt0[239];
	 		546:
	  			GD_OUT_3 := 1;
			547:
	  			CASE slt0[240] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[240] := (random_num + slt0[240]) MOD 2;
	  			random_num := random_num - slt0[240];
	 		548:
	  			GD_OUT_3 := 1;
			549:
	  			CASE slt0[241] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[241] := (random_num + slt0[241]) MOD 2;
	  			random_num := random_num - slt0[241];
	 		550:
	  			CASE slt0[242] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[242] := (random_num + slt0[242]) MOD 3;
	  			random_num := random_num - slt0[242];
	 		551:
	  			GD_OUT_3 := 1;
			552:
	  			CASE slt0[243] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[243] := (random_num + slt0[243]) MOD 2;
	  			random_num := random_num - slt0[243];
	 		553:
	  			CASE slt0[244] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[244] := (random_num + slt0[244]) MOD 3;
	  			random_num := random_num - slt0[244];
	 		554:
	  			CASE slt0[245] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[245] := (random_num + slt0[245]) MOD 2;
	  			random_num := random_num - slt0[245];
	 		555:
	  			CASE slt0[246] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[246] := (random_num + slt0[246]) MOD 2;
	  			random_num := random_num - slt0[246];
	 		556:
	  			GD_OUT_2 := 0;
	  		557:
	  			CASE slt0[247] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[247] := (random_num + slt0[247]) MOD 2;
	  			random_num := random_num - slt0[247];
	 		558:
	  			GD_OUT_2 := 0;
	  		559:
	  			CASE slt0[248] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[248] := (random_num + slt0[248]) MOD 4;
	  			random_num := random_num - slt0[248];
	 		560:
	  			CASE slt0[249] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[249] := (random_num + slt0[249]) MOD 2;
	  			random_num := random_num - slt0[249];
	 		561:
	  			GD_OUT_2 := 0;
	  		562:
	  			CASE slt0[250] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[250] := (random_num + slt0[250]) MOD 4;
	  			random_num := random_num - slt0[250];
	 		563:
	  			CASE slt0[251] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[251] := (random_num + slt0[251]) MOD 2;
	  			random_num := random_num - slt0[251];
	 		564:
	  			GD_OUT_3 := 1;
			565:
	  			CASE slt0[252] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[252] := (random_num + slt0[252]) MOD 2;
	  			random_num := random_num - slt0[252];
	 		566:
	  			GD_OUT_3 := 1;
			567:
	  			CASE slt0[253] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[253] := (random_num + slt0[253]) MOD 2;
	  			random_num := random_num - slt0[253];
	 		568:
	  			CASE slt0[254] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[254] := (random_num + slt0[254]) MOD 4;
	  			random_num := random_num - slt0[254];
	 		569:
	  			GD_OUT_3 := 1;
			570:
	  			CASE slt0[255] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[255] := (random_num + slt0[255]) MOD 2;
	  			random_num := random_num - slt0[255];
	 		571:
	  			CASE slt0[256] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[256] := (random_num + slt0[256]) MOD 4;
	  			random_num := random_num - slt0[256];
	 		572:
	  			CASE slt0[257] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[257] := (random_num + slt0[257]) MOD 2;
	  			random_num := random_num - slt0[257];
	 		573:
	  			GD_OUT_5 := 1;
			574:
	  			GD_OUT_4 := 0;
	  		575:
	  			GD_OUT_5 := 1;
			576:
	  			GD_OUT_4 := 0;
	  		577:
	  			CASE slt0[258] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[258] := (random_num + slt0[258]) MOD 3;
	  			random_num := random_num - slt0[258];
	 		578:
	  			GD_OUT_5 := 1;
			579:
	  			GD_OUT_4 := 0;
	  		580:
	  			CASE slt0[259] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[259] := (random_num + slt0[259]) MOD 3;
	  			random_num := random_num - slt0[259];
	 		581:
	  			CASE slt0[260] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[260] := (random_num + slt0[260]) MOD 2;
	  			random_num := random_num - slt0[260];
	 		582:
	  			CASE slt0[261] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[261] := (random_num + slt0[261]) MOD 2;
	  			random_num := random_num - slt0[261];
	 		583:
	  			CASE slt0[262] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[262] := (random_num + slt0[262]) MOD 2;
	  			random_num := random_num - slt0[262];
	 		584:
	  			CASE slt0[263] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[263] := (random_num + slt0[263]) MOD 2;
	  			random_num := random_num - slt0[263];
	 		585:
	  			CASE slt0[264] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[264] := (random_num + slt0[264]) MOD 2;
	  			random_num := random_num - slt0[264];
	 		586:
	  			CASE slt0[265] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[265] := (random_num + slt0[265]) MOD 2;
	  			random_num := random_num - slt0[265];
	 		587:
	  			GD_OUT_5 := 1;
			588:
	  			GD_OUT_5 := 1;
			589:
	  			GD_OUT_5 := 1;
			591:
	  			CASE slt0[266] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[266] := (random_num + slt0[266]) MOD 2;
	  			random_num := random_num - slt0[266];
	 		592:
	  			CASE slt0[267] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[267] := (random_num + slt0[267]) MOD 2;
	  			random_num := random_num - slt0[267];
	 		593:
	  			CASE slt0[268] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[268] := (random_num + slt0[268]) MOD 3;
	  			random_num := random_num - slt0[268];
	 		594:
	  			CASE slt0[269] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[269] := (random_num + slt0[269]) MOD 3;
	  			random_num := random_num - slt0[269];
	 		596:
	  			CASE slt0[270] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[270] := (random_num + slt0[270]) MOD 2;
	  			random_num := random_num - slt0[270];
	 		598:
	  			GD_OUT_3 := 1;
			599:
	  			CASE slt0[271] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[271] := (random_num + slt0[271]) MOD 2;
	  			random_num := random_num - slt0[271];
	 		600:
	  			GD_OUT_3 := 1;
			602:
	  			GD_OUT_5 := 1;
			603:
	  			CASE slt0[272] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[272] := (random_num + slt0[272]) MOD 2;
	  			random_num := random_num - slt0[272];
	 		604:
	  			CASE slt0[273] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[273] := (random_num + slt0[273]) MOD 3;
	  			random_num := random_num - slt0[273];
	 		605:
	  			CASE slt0[274] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[274] := (random_num + slt0[274]) MOD 2;
	  			random_num := random_num - slt0[274];
	 		606:
	  			CASE slt0[275] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[275] := (random_num + slt0[275]) MOD 2;
	  			random_num := random_num - slt0[275];
	 		608:
	  			CASE slt0[276] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[276] := (random_num + slt0[276]) MOD 2;
	  			random_num := random_num - slt0[276];
	 		609:
	  			CASE slt0[277] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[277] := (random_num + slt0[277]) MOD 3;
	  			random_num := random_num - slt0[277];
	 		611:
	  			GD_OUT_5 := 1;
			612:
	  			CASE slt0[278] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[278] := (random_num + slt0[278]) MOD 2;
	  			random_num := random_num - slt0[278];
	 		613:
	  			GD_OUT_2 := 0;
	  		614:
	  			CASE slt0[279] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[279] := (random_num + slt0[279]) MOD 2;
	  			random_num := random_num - slt0[279];
	 		615:
	  			GD_OUT_4 := 0;
	  		616:
	  			CASE slt0[280] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[280] := (random_num + slt0[280]) MOD 2;
	  			random_num := random_num - slt0[280];
	 		617:
	  			GD_OUT_3 := 1;
			618:
	  			CASE slt0[281] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[281] := (random_num + slt0[281]) MOD 2;
	  			random_num := random_num - slt0[281];
	 		619:
	  			CASE slt0[282] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[282] := (random_num + slt0[282]) MOD 2;
	  			random_num := random_num - slt0[282];
	 		620:
	  			GD_OUT_5 := 1;
			621:
	  			CASE slt0[283] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[283] := (random_num + slt0[283]) MOD 2;
	  			random_num := random_num - slt0[283];
	 		622:
	  			GD_OUT_2 := 0;
	  		623:
	  			CASE slt0[284] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[284] := (random_num + slt0[284]) MOD 2;
	  			random_num := random_num - slt0[284];
	 		624:
	  			GD_OUT_4 := 0;
	  		625:
	  			CASE slt0[285] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[285] := (random_num + slt0[285]) MOD 2;
	  			random_num := random_num - slt0[285];
	 		626:
	  			GD_OUT_3 := 1;
			627:
	  			CASE slt0[286] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[286] := (random_num + slt0[286]) MOD 2;
	  			random_num := random_num - slt0[286];
	 		628:
	  			CASE slt0[287] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[287] := (random_num + slt0[287]) MOD 2;
	  			random_num := random_num - slt0[287];
	 		629:
	  			GD_OUT_5 := 1;
			630:
	  			CASE slt0[288] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[288] := (random_num + slt0[288]) MOD 4;
	  			random_num := random_num - slt0[288];
	 		631:
	  			CASE slt0[289] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[289] := (random_num + slt0[289]) MOD 4;
	  			random_num := random_num - slt0[289];
	 		632:
	  			CASE slt0[290] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[290] := (random_num + slt0[290]) MOD 4;
	  			random_num := random_num - slt0[290];
	 		634:
	  			CASE slt0[291] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[291] := (random_num + slt0[291]) MOD 3;
	  			random_num := random_num - slt0[291];
	 		635:
	  			CASE slt0[292] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[292] := (random_num + slt0[292]) MOD 3;
	  			random_num := random_num - slt0[292];
	 		636:
	  			CASE slt0[293] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[293] := (random_num + slt0[293]) MOD 2;
	  			random_num := random_num - slt0[293];
	 		637:
	  			CASE slt0[294] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[294] := (random_num + slt0[294]) MOD 2;
	  			random_num := random_num - slt0[294];
	 		639:
	  			CASE slt0[295] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[295] := (random_num + slt0[295]) MOD 2;
	  			random_num := random_num - slt0[295];
	 		641:
	  			GD_OUT_3 := 1;
			642:
	  			CASE slt0[296] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[296] := (random_num + slt0[296]) MOD 2;
	  			random_num := random_num - slt0[296];
	 		643:
	  			GD_OUT_3 := 1;
			645:
	  			GD_OUT_5 := 1;
			646:
	  			CASE slt0[297] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[297] := (random_num + slt0[297]) MOD 3;
	  			random_num := random_num - slt0[297];
	 		647:
	  			CASE slt0[298] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[298] := (random_num + slt0[298]) MOD 2;
	  			random_num := random_num - slt0[298];
	 		648:
	  			CASE slt0[299] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[299] := (random_num + slt0[299]) MOD 2;
	  			random_num := random_num - slt0[299];
	 		649:
	  			CASE slt0[300] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[300] := (random_num + slt0[300]) MOD 2;
	  			random_num := random_num - slt0[300];
	 		651:
	  			CASE slt0[301] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[301] := (random_num + slt0[301]) MOD 3;
	  			random_num := random_num - slt0[301];
	 		652:
	  			CASE slt0[302] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[302] := (random_num + slt0[302]) MOD 2;
	  			random_num := random_num - slt0[302];
	 		654:
	  			GD_OUT_5 := 1;
			655:
	  			CASE slt0[303] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[303] := (random_num + slt0[303]) MOD 2;
	  			random_num := random_num - slt0[303];
	 		656:
	  			GD_OUT_2 := 0;
	  		657:
	  			CASE slt0[304] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[304] := (random_num + slt0[304]) MOD 2;
	  			random_num := random_num - slt0[304];
	 		658:
	  			GD_OUT_4 := 0;
	  		659:
	  			CASE slt0[305] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[305] := (random_num + slt0[305]) MOD 2;
	  			random_num := random_num - slt0[305];
	 		660:
	  			GD_OUT_3 := 1;
			661:
	  			CASE slt0[306] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[306] := (random_num + slt0[306]) MOD 2;
	  			random_num := random_num - slt0[306];
	 		662:
	  			CASE slt0[307] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[307] := (random_num + slt0[307]) MOD 2;
	  			random_num := random_num - slt0[307];
	 		663:
	  			GD_OUT_5 := 1;
			664:
	  			CASE slt0[308] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[308] := (random_num + slt0[308]) MOD 4;
	  			random_num := random_num - slt0[308];
	 		665:
	  			CASE slt0[309] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[309] := (random_num + slt0[309]) MOD 4;
	  			random_num := random_num - slt0[309];
	 		666:
	  			CASE slt0[310] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[310] := (random_num + slt0[310]) MOD 4;
	  			random_num := random_num - slt0[310];
	 		667:
	  			CASE slt0[311] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[311] := (random_num + slt0[311]) MOD 2;
	  			random_num := random_num - slt0[311];
	 		668:
	  			CASE slt0[312] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[312] := (random_num + slt0[312]) MOD 2;
	  			random_num := random_num - slt0[312];
	 		669:
	  			CASE slt0[313] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[313] := (random_num + slt0[313]) MOD 2;
	  			random_num := random_num - slt0[313];
	 		670:
	  			GD_OUT_3 := 1;
			671:
	  			CASE slt0[314] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[314] := (random_num + slt0[314]) MOD 2;
	  			random_num := random_num - slt0[314];
	 		672:
	  			GD_OUT_3 := 1;
			673:
	  			CASE slt0[315] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[315] := (random_num + slt0[315]) MOD 4;
	  			random_num := random_num - slt0[315];
	 		674:
	  			CASE slt0[316] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[316] := (random_num + slt0[316]) MOD 2;
	  			random_num := random_num - slt0[316];
	 		675:
	  			GD_OUT_3 := 1;
			676:
	  			CASE slt0[317] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[317] := (random_num + slt0[317]) MOD 4;
	  			random_num := random_num - slt0[317];
	 		677:
	  			CASE slt0[318] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[318] := (random_num + slt0[318]) MOD 2;
	  			random_num := random_num - slt0[318];
	 		678:
	  			GD_OUT_2 := 0;
	  		679:
	  			CASE slt0[319] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[319] := (random_num + slt0[319]) MOD 2;
	  			random_num := random_num - slt0[319];
	 		680:
	  			GD_OUT_2 := 0;
	  		681:
	  			CASE slt0[320] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[320] := (random_num + slt0[320]) MOD 2;
	  			random_num := random_num - slt0[320];
	 		682:
	  			CASE slt0[321] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[321] := (random_num + slt0[321]) MOD 4;
	  			random_num := random_num - slt0[321];
	 		683:
	  			GD_OUT_2 := 0;
	  		684:
	  			CASE slt0[322] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[322] := (random_num + slt0[322]) MOD 2;
	  			random_num := random_num - slt0[322];
	 		685:
	  			CASE slt0[323] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[323] := (random_num + slt0[323]) MOD 4;
	  			random_num := random_num - slt0[323];
	 		686:
	  			CASE slt0[324] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[324] := (random_num + slt0[324]) MOD 2;
	  			random_num := random_num - slt0[324];
	 		687:
	  			CASE slt0[325] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[325] := (random_num + slt0[325]) MOD 2;
	  			random_num := random_num - slt0[325];
	 		688:
	  			CASE slt0[326] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[326] := (random_num + slt0[326]) MOD 2;
	  			random_num := random_num - slt0[326];
	 		689:
	  			CASE slt0[327] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[327] := (random_num + slt0[327]) MOD 2;
	  			random_num := random_num - slt0[327];
	 		690:
	  			CASE slt0[328] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[328] := (random_num + slt0[328]) MOD 2;
	  			random_num := random_num - slt0[328];
	 		691:
	  			CASE slt0[329] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[329] := (random_num + slt0[329]) MOD 4;
	  			random_num := random_num - slt0[329];
	 		692:
	  			CASE slt0[330] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[330] := (random_num + slt0[330]) MOD 2;
	  			random_num := random_num - slt0[330];
	 		693:
	  			CASE slt0[331] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[331] := (random_num + slt0[331]) MOD 2;
	  			random_num := random_num - slt0[331];
	 		694:
	  			CASE slt0[332] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[332] := (random_num + slt0[332]) MOD 4;
	  			random_num := random_num - slt0[332];
	 		695:
	  			GD_OUT_4 := 0;
	  		696:
	  			GD_OUT_5 := 1;
			697:
	  			GD_OUT_4 := 0;
	  		698:
	  			GD_OUT_5 := 1;
			699:
	  			GD_OUT_4 := 0;
	  		700:
	  			GD_OUT_5 := 1;
			701:
	  			CASE slt0[333] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[333] := (random_num + slt0[333]) MOD 2;
	  			random_num := random_num - slt0[333];
	 		702:
	  			CASE slt0[334] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[334] := (random_num + slt0[334]) MOD 2;
	  			random_num := random_num - slt0[334];
	 		703:
	  			CASE slt0[335] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[335] := (random_num + slt0[335]) MOD 2;
	  			random_num := random_num - slt0[335];
	 		705:
	  			GD_OUT_3 := 1;
			706:
	  			GD_OUT_5 := 1;
			707:
	  			GD_OUT_1 := 1;
			708:
	  			CASE slt0[336] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[336] := (random_num + slt0[336]) MOD 3;
	  			random_num := random_num - slt0[336];
	 		709:
	  			GD_OUT_1 := 1;
			710:
	  			CASE slt0[337] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[337] := (random_num + slt0[337]) MOD 2;
	  			random_num := random_num - slt0[337];
	 		711:
	  			CASE slt0[338] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[338] := (random_num + slt0[338]) MOD 4;
	  			random_num := random_num - slt0[338];
	 		712:
	  			CASE slt0[339] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[339] := (random_num + slt0[339]) MOD 2;
	  			random_num := random_num - slt0[339];
	 		713:
	  			GD_OUT_3 := 1;
			714:
	  			GD_OUT_5 := 1;
			715:
	  			GD_OUT_3 := 1;
			716:
	  			GD_OUT_5 := 1;
			717:
	  			CASE slt0[340] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[340] := (random_num + slt0[340]) MOD 2;
	  			random_num := random_num - slt0[340];
	 		718:
	  			GD_OUT_2 := 0;
	  		719:
	  			GD_OUT_3 := 1;
			720:
	  			CASE slt0[341] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[341] := (random_num + slt0[341]) MOD 2;
	  			random_num := random_num - slt0[341];
	 		721:
	  			GD_OUT_1 := 1;
			722:
	  			CASE slt0[342] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[342] := (random_num + slt0[342]) MOD 2;
	  			random_num := random_num - slt0[342];
	 		723:
	  			GD_OUT_5 := 1;
			724:
	  			GD_OUT_4 := 0;
	  		725:
	  			GD_OUT_3 := 1;
			726:
	  			CASE slt0[343] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[343] := (random_num + slt0[343]) MOD 3;
	  			random_num := random_num - slt0[343];
	 		727:
	  			CASE slt0[344] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[344] := (random_num + slt0[344]) MOD 4;
	  			random_num := random_num - slt0[344];
	 		728:
	  			GD_OUT_3 := 1;
			729:
	  			CASE slt0[345] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[345] := (random_num + slt0[345]) MOD 2;
	  			random_num := random_num - slt0[345];
	 		731:
	  			GD_OUT_5 := 1;
			732:
	  			GD_OUT_1 := 1;
			733:
	  			CASE slt0[346] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[346] := (random_num + slt0[346]) MOD 2;
	  			random_num := random_num - slt0[346];
	 		734:
	  			GD_OUT_5 := 1;
			735:
	  			GD_OUT_3 := 1;
			736:
	  			CASE slt0[347] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[347] := (random_num + slt0[347]) MOD 2;
	  			random_num := random_num - slt0[347];
	 		737:
	  			CASE slt0[348] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[348] := (random_num + slt0[348]) MOD 2;
	  			random_num := random_num - slt0[348];
	 		738:
	  			GD_OUT_5 := 1;
			739:
	  			CASE slt0[349] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[349] := (random_num + slt0[349]) MOD 2;
	  			random_num := random_num - slt0[349];
	 		740:
	  			CASE slt0[350] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[350] := (random_num + slt0[350]) MOD 2;
	  			random_num := random_num - slt0[350];
	 		741:
	  			CASE slt0[351] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[351] := (random_num + slt0[351]) MOD 2;
	  			random_num := random_num - slt0[351];
	 		742:
	  			GD_OUT_3 := 1;
			743:
	  			CASE slt0[352] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[352] := (random_num + slt0[352]) MOD 2;
	  			random_num := random_num - slt0[352];
	 		744:
	  			CASE slt0[353] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[353] := (random_num + slt0[353]) MOD 2;
	  			random_num := random_num - slt0[353];
	 		745:
	  			GD_OUT_5 := 1;
			746:
	  			CASE slt0[354] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[354] := (random_num + slt0[354]) MOD 2;
	  			random_num := random_num - slt0[354];
	 		747:
	  			CASE slt0[355] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[355] := (random_num + slt0[355]) MOD 2;
	  			random_num := random_num - slt0[355];
	 		748:
	  			CASE slt0[356] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[356] := (random_num + slt0[356]) MOD 2;
	  			random_num := random_num - slt0[356];
	 		749:
	  			CASE slt0[357] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[357] := (random_num + slt0[357]) MOD 4;
	  			random_num := random_num - slt0[357];
	 		750:
	  			CASE slt0[358] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[358] := (random_num + slt0[358]) MOD 4;
	  			random_num := random_num - slt0[358];
	 		752:
	  			GD_OUT_3 := 1;
			753:
	  			GD_OUT_5 := 1;
			754:
	  			CASE slt0[359] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[359] := (random_num + slt0[359]) MOD 2;
	  			random_num := random_num - slt0[359];
	 		755:
	  			CASE slt0[360] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[360] := (random_num + slt0[360]) MOD 4;
	  			random_num := random_num - slt0[360];
	 		756:
	  			CASE slt0[361] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[361] := (random_num + slt0[361]) MOD 2;
	  			random_num := random_num - slt0[361];
	 		757:
	  			GD_OUT_1 := 1;
			758:
	  			CASE slt0[362] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[362] := (random_num + slt0[362]) MOD 3;
	  			random_num := random_num - slt0[362];
	 		759:
	  			GD_OUT_1 := 1;
			760:
	  			GD_OUT_3 := 1;
			761:
	  			GD_OUT_5 := 1;
			762:
	  			GD_OUT_3 := 1;
			763:
	  			GD_OUT_5 := 1;
			764:
	  			CASE slt0[363] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[363] := (random_num + slt0[363]) MOD 2;
	  			random_num := random_num - slt0[363];
	 		765:
	  			GD_OUT_2 := 0;
	  		766:
	  			GD_OUT_3 := 1;
			767:
	  			CASE slt0[364] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[364] := (random_num + slt0[364]) MOD 2;
	  			random_num := random_num - slt0[364];
	 		768:
	  			CASE slt0[365] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[365] := (random_num + slt0[365]) MOD 2;
	  			random_num := random_num - slt0[365];
	 		769:
	  			GD_OUT_1 := 1;
			770:
	  			GD_OUT_5 := 1;
			771:
	  			GD_OUT_4 := 0;
	  		772:
	  			GD_OUT_3 := 1;
			773:
	  			CASE slt0[366] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[366] := (random_num + slt0[366]) MOD 4;
	  			random_num := random_num - slt0[366];
	 		774:
	  			CASE slt0[367] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[367] := (random_num + slt0[367]) MOD 3;
	  			random_num := random_num - slt0[367];
	 		775:
	  			GD_OUT_3 := 1;
			776:
	  			CASE slt0[368] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[368] := (random_num + slt0[368]) MOD 2;
	  			random_num := random_num - slt0[368];
	 		778:
	  			GD_OUT_5 := 1;
			779:
	  			CASE slt0[369] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[369] := (random_num + slt0[369]) MOD 2;
	  			random_num := random_num - slt0[369];
	 		780:
	  			GD_OUT_1 := 1;
			781:
	  			GD_OUT_5 := 1;
			782:
	  			GD_OUT_3 := 1;
			783:
	  			CASE slt0[370] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[370] := (random_num + slt0[370]) MOD 2;
	  			random_num := random_num - slt0[370];
	 		784:
	  			CASE slt0[371] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[371] := (random_num + slt0[371]) MOD 2;
	  			random_num := random_num - slt0[371];
	 		785:
	  			GD_OUT_5 := 1;
			786:
	  			CASE slt0[372] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[372] := (random_num + slt0[372]) MOD 2;
	  			random_num := random_num - slt0[372];
	 		787:
	  			CASE slt0[373] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[373] := (random_num + slt0[373]) MOD 2;
	  			random_num := random_num - slt0[373];
	 		788:
	  			CASE slt0[374] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[374] := (random_num + slt0[374]) MOD 2;
	  			random_num := random_num - slt0[374];
	 		789:
	  			CASE slt0[375] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[375] := (random_num + slt0[375]) MOD 4;
	  			random_num := random_num - slt0[375];
	 		790:
	  			CASE slt0[376] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[376] := (random_num + slt0[376]) MOD 4;
	  			random_num := random_num - slt0[376];
	 		791:
	  			CASE slt0[377] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[377] := (random_num + slt0[377]) MOD 2;
	  			random_num := random_num - slt0[377];
	 		792:
	  			GD_OUT_3 := 1;
			793:
	  			CASE slt0[378] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[378] := (random_num + slt0[378]) MOD 2;
	  			random_num := random_num - slt0[378];
	 		794:
	  			GD_OUT_3 := 1;
			795:
	  			CASE slt0[379] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[379] := (random_num + slt0[379]) MOD 2;
	  			random_num := random_num - slt0[379];
	 		796:
	  			CASE slt0[380] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[380] := (random_num + slt0[380]) MOD 4;
	  			random_num := random_num - slt0[380];
	 		797:
	  			GD_OUT_3 := 1;
			798:
	  			CASE slt0[381] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[381] := (random_num + slt0[381]) MOD 2;
	  			random_num := random_num - slt0[381];
	 		799:
	  			CASE slt0[382] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[382] := (random_num + slt0[382]) MOD 4;
	  			random_num := random_num - slt0[382];
	 		800:
	  			CASE slt0[383] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[383] := (random_num + slt0[383]) MOD 2;
	  			random_num := random_num - slt0[383];
	 		801:
	  			CASE slt0[384] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[384] := (random_num + slt0[384]) MOD 2;
	  			random_num := random_num - slt0[384];
	 		802:
	  			CASE slt0[385] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[385] := (random_num + slt0[385]) MOD 2;
	  			random_num := random_num - slt0[385];
	 		803:
	  			CASE slt0[386] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[386] := (random_num + slt0[386]) MOD 2;
	  			random_num := random_num - slt0[386];
	 		804:
	  			CASE slt0[387] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[387] := (random_num + slt0[387]) MOD 2;
	  			random_num := random_num - slt0[387];
	 		805:
	  			CASE slt0[388] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[388] := (random_num + slt0[388]) MOD 4;
	  			random_num := random_num - slt0[388];
	 		806:
	  			CASE slt0[389] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[389] := (random_num + slt0[389]) MOD 2;
	  			random_num := random_num - slt0[389];
	 		807:
	  			CASE slt0[390] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[390] := (random_num + slt0[390]) MOD 2;
	  			random_num := random_num - slt0[390];
	 		808:
	  			CASE slt0[391] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[391] := (random_num + slt0[391]) MOD 4;
	  			random_num := random_num - slt0[391];
	 		809:
	  			CASE slt0[392] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[392] := (random_num + slt0[392]) MOD 2;
	  			random_num := random_num - slt0[392];
	 		810:
	  			CASE slt0[393] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[393] := (random_num + slt0[393]) MOD 2;
	  			random_num := random_num - slt0[393];
	 		811:
	  			CASE slt0[394] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[394] := (random_num + slt0[394]) MOD 2;
	  			random_num := random_num - slt0[394];
	 		812:
	  			CASE slt0[395] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[395] := (random_num + slt0[395]) MOD 2;
	  			random_num := random_num - slt0[395];
	 		813:
	  			CASE slt0[396] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[396] := (random_num + slt0[396]) MOD 2;
	  			random_num := random_num - slt0[396];
	 		814:
	  			CASE slt0[397] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[397] := (random_num + slt0[397]) MOD 2;
	  			random_num := random_num - slt0[397];
	 		815:
	  			GD_OUT_5 := 1;
			816:
	  			GD_OUT_5 := 1;
			817:
	  			GD_OUT_5 := 1;
			818:
	  			GD_OUT_3 := 1;
			819:
	  			GD_OUT_5 := 1;
			821:
	  			CASE slt0[398] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[398] := (random_num + slt0[398]) MOD 2;
	  			random_num := random_num - slt0[398];
	 		823:
	  			CASE slt0[399] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[399] := (random_num + slt0[399]) MOD 2;
	  			random_num := random_num - slt0[399];
	 		824:
	  			CASE slt0[400] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[400] := (random_num + slt0[400]) MOD 2;
	  			random_num := random_num - slt0[400];
	 		825:
	  			CASE slt0[401] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[401] := (random_num + slt0[401]) MOD 2;
	  			random_num := random_num - slt0[401];
	 		826:
	  			CASE slt0[402] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[402] := (random_num + slt0[402]) MOD 2;
	  			random_num := random_num - slt0[402];
	 		827:
	  			CASE slt0[403] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[403] := (random_num + slt0[403]) MOD 3;
	  			random_num := random_num - slt0[403];
	 		828:
	  			CASE slt0[404] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[404] := (random_num + slt0[404]) MOD 3;
	  			random_num := random_num - slt0[404];
	 		829:
	  			CASE slt0[405] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[405] := (random_num + slt0[405]) MOD 3;
	  			random_num := random_num - slt0[405];
	 		830:
	  			CASE slt0[406] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[406] := (random_num + slt0[406]) MOD 3;
	  			random_num := random_num - slt0[406];
	 		831:
	  			GD_OUT_2 := 0;
	  		832:
	  			CASE slt0[407] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[407] := (random_num + slt0[407]) MOD 2;
	  			random_num := random_num - slt0[407];
	 		834:
	  			CASE slt0[408] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[408] := (random_num + slt0[408]) MOD 2;
	  			random_num := random_num - slt0[408];
	 		835:
	  			GD_OUT_4 := 0;
	  		836:
	  			GD_OUT_3 := 1;
			837:
	  			GD_OUT_2 := 0;
	  		838:
	  			CASE slt0[409] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[409] := (random_num + slt0[409]) MOD 2;
	  			random_num := random_num - slt0[409];
	 		839:
	  			CASE slt0[410] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[410] := (random_num + slt0[410]) MOD 2;
	  			random_num := random_num - slt0[410];
	 		840:
	  			CASE slt0[411] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[411] := (random_num + slt0[411]) MOD 3;
	  			random_num := random_num - slt0[411];
	 		841:
	  			CASE slt0[412] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[412] := (random_num + slt0[412]) MOD 2;
	  			random_num := random_num - slt0[412];
	 		842:
	  			CASE slt0[413] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[413] := (random_num + slt0[413]) MOD 2;
	  			random_num := random_num - slt0[413];
	 		844:
	  			CASE slt0[414] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[414] := (random_num + slt0[414]) MOD 2;
	  			random_num := random_num - slt0[414];
	 		845:
	  			CASE slt0[415] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[415] := (random_num + slt0[415]) MOD 3;
	  			random_num := random_num - slt0[415];
	 		847:
	  			GD_OUT_5 := 1;
			848:
	  			GD_OUT_3 := 1;
			849:
	  			CASE slt0[416] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[416] := (random_num + slt0[416]) MOD 2;
	  			random_num := random_num - slt0[416];
	 		850:
	  			CASE slt0[417] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[417] := (random_num + slt0[417]) MOD 2;
	  			random_num := random_num - slt0[417];
	 		851:
	  			CASE slt0[418] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[418] := (random_num + slt0[418]) MOD 3;
	  			random_num := random_num - slt0[418];
	 		852:
	  			CASE slt0[419] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[419] := (random_num + slt0[419]) MOD 2;
	  			random_num := random_num - slt0[419];
	 		853:
	  			GD_OUT_5 := 1;
			855:
	  			CASE slt0[420] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[420] := (random_num + slt0[420]) MOD 2;
	  			random_num := random_num - slt0[420];
	 		856:
	  			CASE slt0[421] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[421] := (random_num + slt0[421]) MOD 3;
	  			random_num := random_num - slt0[421];
	 		857:
	  			GD_OUT_4 := 0;
	  		858:
	  			CASE slt0[422] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[422] := (random_num + slt0[422]) MOD 2;
	  			random_num := random_num - slt0[422];
	 		859:
	  			CASE slt0[423] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[423] := (random_num + slt0[423]) MOD 2;
	  			random_num := random_num - slt0[423];
	 		860:
	  			CASE slt0[424] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[424] := (random_num + slt0[424]) MOD 2;
	  			random_num := random_num - slt0[424];
	 		861:
	  			CASE slt0[425] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[425] := (random_num + slt0[425]) MOD 2;
	  			random_num := random_num - slt0[425];
	 		862:
	  			CASE slt0[426] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[426] := (random_num + slt0[426]) MOD 2;
	  			random_num := random_num - slt0[426];
	 		863:
	  			CASE slt0[427] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[427] := (random_num + slt0[427]) MOD 2;
	  			random_num := random_num - slt0[427];
	 		864:
	  			CASE slt0[428] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[428] := (random_num + slt0[428]) MOD 2;
	  			random_num := random_num - slt0[428];
	 		865:
	  			CASE slt0[429] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[429] := (random_num + slt0[429]) MOD 2;
	  			random_num := random_num - slt0[429];
	 		866:
	  			CASE slt0[430] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[430] := (random_num + slt0[430]) MOD 2;
	  			random_num := random_num - slt0[430];
	 		867:
	  			CASE slt0[431] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[431] := (random_num + slt0[431]) MOD 2;
	  			random_num := random_num - slt0[431];
	 		868:
	  			CASE slt0[432] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[432] := (random_num + slt0[432]) MOD 4;
	  			random_num := random_num - slt0[432];
	 		869:
	  			GD_OUT_3 := 1;
			870:
	  			GD_OUT_5 := 1;
			872:
	  			CASE slt0[433] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[433] := (random_num + slt0[433]) MOD 2;
	  			random_num := random_num - slt0[433];
	 		874:
	  			CASE slt0[434] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[434] := (random_num + slt0[434]) MOD 3;
	  			random_num := random_num - slt0[434];
	 		875:
	  			CASE slt0[435] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[435] := (random_num + slt0[435]) MOD 3;
	  			random_num := random_num - slt0[435];
	 		876:
	  			CASE slt0[436] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[436] := (random_num + slt0[436]) MOD 3;
	  			random_num := random_num - slt0[436];
	 		877:
	  			CASE slt0[437] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[437] := (random_num + slt0[437]) MOD 3;
	  			random_num := random_num - slt0[437];
	 		878:
	  			CASE slt0[438] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[438] := (random_num + slt0[438]) MOD 2;
	  			random_num := random_num - slt0[438];
	 		879:
	  			CASE slt0[439] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[439] := (random_num + slt0[439]) MOD 2;
	  			random_num := random_num - slt0[439];
	 		880:
	  			CASE slt0[440] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[440] := (random_num + slt0[440]) MOD 2;
	  			random_num := random_num - slt0[440];
	 		881:
	  			CASE slt0[441] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[441] := (random_num + slt0[441]) MOD 2;
	  			random_num := random_num - slt0[441];
	 		882:
	  			GD_OUT_2 := 0;
	  		883:
	  			CASE slt0[442] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[442] := (random_num + slt0[442]) MOD 2;
	  			random_num := random_num - slt0[442];
	 		885:
	  			CASE slt0[443] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[443] := (random_num + slt0[443]) MOD 2;
	  			random_num := random_num - slt0[443];
	 		886:
	  			GD_OUT_4 := 0;
	  		887:
	  			GD_OUT_3 := 1;
			888:
	  			GD_OUT_2 := 0;
	  		889:
	  			CASE slt0[444] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[444] := (random_num + slt0[444]) MOD 2;
	  			random_num := random_num - slt0[444];
	 		890:
	  			CASE slt0[445] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[445] := (random_num + slt0[445]) MOD 3;
	  			random_num := random_num - slt0[445];
	 		891:
	  			CASE slt0[446] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[446] := (random_num + slt0[446]) MOD 2;
	  			random_num := random_num - slt0[446];
	 		892:
	  			CASE slt0[447] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[447] := (random_num + slt0[447]) MOD 2;
	  			random_num := random_num - slt0[447];
	 		893:
	  			CASE slt0[448] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[448] := (random_num + slt0[448]) MOD 2;
	  			random_num := random_num - slt0[448];
	 		895:
	  			CASE slt0[449] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[449] := (random_num + slt0[449]) MOD 3;
	  			random_num := random_num - slt0[449];
	 		896:
	  			CASE slt0[450] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[450] := (random_num + slt0[450]) MOD 2;
	  			random_num := random_num - slt0[450];
	 		898:
	  			GD_OUT_5 := 1;
			899:
	  			GD_OUT_3 := 1;
			900:
	  			CASE slt0[451] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[451] := (random_num + slt0[451]) MOD 2;
	  			random_num := random_num - slt0[451];
	 		901:
	  			CASE slt0[452] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[452] := (random_num + slt0[452]) MOD 3;
	  			random_num := random_num - slt0[452];
	 		902:
	  			CASE slt0[453] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[453] := (random_num + slt0[453]) MOD 2;
	  			random_num := random_num - slt0[453];
	 		903:
	  			CASE slt0[454] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[454] := (random_num + slt0[454]) MOD 2;
	  			random_num := random_num - slt0[454];
	 		904:
	  			GD_OUT_5 := 1;
			906:
	  			CASE slt0[455] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[455] := (random_num + slt0[455]) MOD 3;
	  			random_num := random_num - slt0[455];
	 		907:
	  			CASE slt0[456] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[456] := (random_num + slt0[456]) MOD 2;
	  			random_num := random_num - slt0[456];
	 		908:
	  			GD_OUT_4 := 0;
	  		909:
	  			CASE slt0[457] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[457] := (random_num + slt0[457]) MOD 2;
	  			random_num := random_num - slt0[457];
	 		910:
	  			CASE slt0[458] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[458] := (random_num + slt0[458]) MOD 2;
	  			random_num := random_num - slt0[458];
	 		911:
	  			CASE slt0[459] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[459] := (random_num + slt0[459]) MOD 2;
	  			random_num := random_num - slt0[459];
	 		912:
	  			CASE slt0[460] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[460] := (random_num + slt0[460]) MOD 2;
	  			random_num := random_num - slt0[460];
	 		913:
	  			CASE slt0[461] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[461] := (random_num + slt0[461]) MOD 2;
	  			random_num := random_num - slt0[461];
	 		914:
	  			CASE slt0[462] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[462] := (random_num + slt0[462]) MOD 4;
	  			random_num := random_num - slt0[462];
	 		915:
	  			CASE slt0[463] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[463] := (random_num + slt0[463]) MOD 2;
	  			random_num := random_num - slt0[463];
	 		916:
	  			CASE slt0[464] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[464] := (random_num + slt0[464]) MOD 2;
	  			random_num := random_num - slt0[464];
	 		917:
	  			CASE slt0[465] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[465] := (random_num + slt0[465]) MOD 2;
	  			random_num := random_num - slt0[465];
	 		918:
	  			CASE slt0[466] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[466] := (random_num + slt0[466]) MOD 2;
	  			random_num := random_num - slt0[466];
	 		919:
	  			CASE slt0[467] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[467] := (random_num + slt0[467]) MOD 4;
	  			random_num := random_num - slt0[467];
	 		920:
	  			CASE slt0[468] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[468] := (random_num + slt0[468]) MOD 2;
	  			random_num := random_num - slt0[468];
	 		921:
	  			CASE slt0[469] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[469] := (random_num + slt0[469]) MOD 2;
	  			random_num := random_num - slt0[469];
	 		922:
	  			CASE slt0[470] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[470] := (random_num + slt0[470]) MOD 4;
	  			random_num := random_num - slt0[470];
	 		923:
	  			CASE slt0[471] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[471] := (random_num + slt0[471]) MOD 2;
	  			random_num := random_num - slt0[471];
	 		924:
	  			CASE slt0[472] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[472] := (random_num + slt0[472]) MOD 2;
	  			random_num := random_num - slt0[472];
	 		925:
	  			CASE slt0[473] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[473] := (random_num + slt0[473]) MOD 2;
	  			random_num := random_num - slt0[473];
	 		926:
	  			CASE slt0[474] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[474] := (random_num + slt0[474]) MOD 2;
	  			random_num := random_num - slt0[474];
	 		927:
	  			CASE slt0[475] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[475] := (random_num + slt0[475]) MOD 2;
	  			random_num := random_num - slt0[475];
	 		928:
	  			CASE slt0[476] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[476] := (random_num + slt0[476]) MOD 2;
	  			random_num := random_num - slt0[476];
	 		929:
	  			CASE slt0[477] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[477] := (random_num + slt0[477]) MOD 2;
	  			random_num := random_num - slt0[477];
	 		930:
	  			CASE slt0[478] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[478] := (random_num + slt0[478]) MOD 2;
	  			random_num := random_num - slt0[478];
	 		931:
	  			CASE slt0[479] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[479] := (random_num + slt0[479]) MOD 2;
	  			random_num := random_num - slt0[479];
	 		933:
	  			CASE slt0[480] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[480] := (random_num + slt0[480]) MOD 2;
	  			random_num := random_num - slt0[480];
	 		935:
	  			GD_OUT_3 := 1;
			936:
	  			GD_OUT_5 := 1;
			937:
	  			GD_OUT_3 := 1;
			938:
	  			GD_OUT_5 := 1;
			939:
	  			CASE slt0[481] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[481] := (random_num + slt0[481]) MOD 2;
	  			random_num := random_num - slt0[481];
	 		940:
	  			CASE slt0[482] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[482] := (random_num + slt0[482]) MOD 3;
	  			random_num := random_num - slt0[482];
	 		941:
	  			GD_OUT_1 := 1;
			942:
	  			CASE slt0[483] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[483] := (random_num + slt0[483]) MOD 3;
	  			random_num := random_num - slt0[483];
	 		943:
	  			CASE slt0[484] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[484] := (random_num + slt0[484]) MOD 2;
	  			random_num := random_num - slt0[484];
	 		944:
	  			CASE slt0[485] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[485] := (random_num + slt0[485]) MOD 3;
	  			random_num := random_num - slt0[485];
	 		945:
	  			CASE slt0[486] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[486] := (random_num + slt0[486]) MOD 4;
	  			random_num := random_num - slt0[486];
	 		946:
	  			CASE slt0[487] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[487] := (random_num + slt0[487]) MOD 2;
	  			random_num := random_num - slt0[487];
	 		947:
	  			CASE slt0[488] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[488] := (random_num + slt0[488]) MOD 4;
	  			random_num := random_num - slt0[488];
	 		948:
	  			CASE slt0[489] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[489] := (random_num + slt0[489]) MOD 3;
	  			random_num := random_num - slt0[489];
	 		949:
	  			GD_OUT_3 := 1;
			950:
	  			CASE slt0[490] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[490] := (random_num + slt0[490]) MOD 2;
	  			random_num := random_num - slt0[490];
	 		951:
	  			GD_OUT_3 := 1;
			952:
	  			GD_OUT_5 := 1;
			953:
	  			CASE slt0[491] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[491] := (random_num + slt0[491]) MOD 2;
	  			random_num := random_num - slt0[491];
	 		954:
	  			GD_OUT_5 := 1;
			955:
	  			GD_OUT_3 := 1;
			956:
	  			CASE slt0[492] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[492] := (random_num + slt0[492]) MOD 2;
	  			random_num := random_num - slt0[492];
	 		957:
	  			CASE slt0[493] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[493] := (random_num + slt0[493]) MOD 2;
	  			random_num := random_num - slt0[493];
	 		958:
	  			CASE slt0[494] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[494] := (random_num + slt0[494]) MOD 3;
	  			random_num := random_num - slt0[494];
	 		959:
	  			CASE slt0[495] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[495] := (random_num + slt0[495]) MOD 2;
	  			random_num := random_num - slt0[495];
	 		960:
	  			CASE slt0[496] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[496] := (random_num + slt0[496]) MOD 2;
	  			random_num := random_num - slt0[496];
	 		961:
	  			GD_OUT_3 := 1;
			962:
	  			CASE slt0[497] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[497] := (random_num + slt0[497]) MOD 3;
	  			random_num := random_num - slt0[497];
	 		963:
	  			CASE slt0[498] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[498] := (random_num + slt0[498]) MOD 4;
	  			random_num := random_num - slt0[498];
	 		964:
	  			GD_OUT_3 := 1;
			965:
	  			CASE slt0[499] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[499] := (random_num + slt0[499]) MOD 2;
	  			random_num := random_num - slt0[499];
	 		967:
	  			GD_OUT_5 := 1;
			968:
	  			GD_OUT_1 := 1;
			969:
	  			CASE slt0[500] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[500] := (random_num + slt0[500]) MOD 2;
	  			random_num := random_num - slt0[500];
	 		970:
	  			GD_OUT_5 := 1;
			971:
	  			CASE slt0[501] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[501] := (random_num + slt0[501]) MOD 2;
	  			random_num := random_num - slt0[501];
	 		972:
	  			GD_OUT_3 := 1;
			973:
	  			CASE slt0[502] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[502] := (random_num + slt0[502]) MOD 3;
	  			random_num := random_num - slt0[502];
	 		974:
	  			CASE slt0[503] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[503] := (random_num + slt0[503]) MOD 4;
	  			random_num := random_num - slt0[503];
	 		975:
	  			CASE slt0[504] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[504] := (random_num + slt0[504]) MOD 2;
	  			random_num := random_num - slt0[504];
	 		977:
	  			GD_OUT_5 := 1;
			978:
	  			CASE slt0[505] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[505] := (random_num + slt0[505]) MOD 2;
	  			random_num := random_num - slt0[505];
	 		979:
	  			CASE slt0[506] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[506] := (random_num + slt0[506]) MOD 3;
	  			random_num := random_num - slt0[506];
	 		980:
	  			GD_OUT_5 := 1;
			981:
	  			CASE slt0[507] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[507] := (random_num + slt0[507]) MOD 2;
	  			random_num := random_num - slt0[507];
	 		982:
	  			CASE slt0[508] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[508] := (random_num + slt0[508]) MOD 2;
	  			random_num := random_num - slt0[508];
	 		983:
	  			CASE slt0[509] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[509] := (random_num + slt0[509]) MOD 2;
	  			random_num := random_num - slt0[509];
	 		984:
	  			CASE slt0[510] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[510] := (random_num + slt0[510]) MOD 2;
	  			random_num := random_num - slt0[510];
	 		985:
	  			CASE slt0[511] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[511] := (random_num + slt0[511]) MOD 2;
	  			random_num := random_num - slt0[511];
	 		986:
	  			CASE slt0[512] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[512] := (random_num + slt0[512]) MOD 2;
	  			random_num := random_num - slt0[512];
	 		988:
	  			CASE slt0[513] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[513] := (random_num + slt0[513]) MOD 2;
	  			random_num := random_num - slt0[513];
	 		990:
	  			GD_OUT_3 := 1;
			991:
	  			GD_OUT_5 := 1;
			992:
	  			GD_OUT_3 := 1;
			993:
	  			GD_OUT_5 := 1;
			994:
	  			CASE slt0[514] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[514] := (random_num + slt0[514]) MOD 3;
	  			random_num := random_num - slt0[514];
	 		995:
	  			CASE slt0[515] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[515] := (random_num + slt0[515]) MOD 4;
	  			random_num := random_num - slt0[515];
	 		996:
	  			CASE slt0[516] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[516] := (random_num + slt0[516]) MOD 2;
	  			random_num := random_num - slt0[516];
	 		997:
	  			CASE slt0[517] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[517] := (random_num + slt0[517]) MOD 4;
	  			random_num := random_num - slt0[517];
	 		998:
	  			CASE slt0[518] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[518] := (random_num + slt0[518]) MOD 3;
	  			random_num := random_num - slt0[518];
	 		999:
	  			CASE slt0[519] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[519] := (random_num + slt0[519]) MOD 2;
	  			random_num := random_num - slt0[519];
	 		1000:
	  			CASE slt0[520] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[520] := (random_num + slt0[520]) MOD 3;
	  			random_num := random_num - slt0[520];
	 		1001:
	  			GD_OUT_1 := 1;
			1002:
	  			CASE slt0[521] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[521] := (random_num + slt0[521]) MOD 3;
	  			random_num := random_num - slt0[521];
	 		1003:
	  			CASE slt0[522] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[522] := (random_num + slt0[522]) MOD 2;
	  			random_num := random_num - slt0[522];
	 		1004:
	  			GD_OUT_3 := 1;
			1005:
	  			CASE slt0[523] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[523] := (random_num + slt0[523]) MOD 2;
	  			random_num := random_num - slt0[523];
	 		1006:
	  			GD_OUT_3 := 1;
			1007:
	  			GD_OUT_5 := 1;
			1008:
	  			CASE slt0[524] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[524] := (random_num + slt0[524]) MOD 2;
	  			random_num := random_num - slt0[524];
	 		1009:
	  			GD_OUT_5 := 1;
			1010:
	  			GD_OUT_3 := 1;
			1011:
	  			CASE slt0[525] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[525] := (random_num + slt0[525]) MOD 2;
	  			random_num := random_num - slt0[525];
	 		1012:
	  			CASE slt0[526] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[526] := (random_num + slt0[526]) MOD 3;
	  			random_num := random_num - slt0[526];
	 		1013:
	  			CASE slt0[527] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[527] := (random_num + slt0[527]) MOD 2;
	  			random_num := random_num - slt0[527];
	 		1014:
	  			CASE slt0[528] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[528] := (random_num + slt0[528]) MOD 2;
	  			random_num := random_num - slt0[528];
	 		1015:
	  			CASE slt0[529] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[529] := (random_num + slt0[529]) MOD 2;
	  			random_num := random_num - slt0[529];
	 		1016:
	  			GD_OUT_3 := 1;
			1017:
	  			CASE slt0[530] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[530] := (random_num + slt0[530]) MOD 4;
	  			random_num := random_num - slt0[530];
	 		1018:
	  			CASE slt0[531] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[531] := (random_num + slt0[531]) MOD 3;
	  			random_num := random_num - slt0[531];
	 		1019:
	  			GD_OUT_3 := 1;
			1020:
	  			CASE slt0[532] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[532] := (random_num + slt0[532]) MOD 2;
	  			random_num := random_num - slt0[532];
	 		1022:
	  			GD_OUT_5 := 1;
			1023:
	  			CASE slt0[533] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  			END_CASE;
	  			slt0[533] := (random_num + slt0[533]) MOD 2;
	  			random_num := random_num - slt0[533];
	 		1024:
	  			GD_OUT_1 := 1;
			1025:
	  			GD_OUT_5 := 1;
			1026:
	  			CASE slt0[534] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[534] := (random_num + slt0[534]) MOD 2;
	  			random_num := random_num - slt0[534];
	 		1027:
	  			GD_OUT_3 := 1;
			1028:
	  			CASE slt0[535] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[535] := (random_num + slt0[535]) MOD 4;
	  			random_num := random_num - slt0[535];
	 		1029:
	  			CASE slt0[536] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[536] := (random_num + slt0[536]) MOD 3;
	  			random_num := random_num - slt0[536];
	 		1030:
	  			CASE slt0[537] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[537] := (random_num + slt0[537]) MOD 2;
	  			random_num := random_num - slt0[537];
	 		1032:
	  			GD_OUT_5 := 1;
			1033:
	  			CASE slt0[538] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[538] := (random_num + slt0[538]) MOD 3;
	  			random_num := random_num - slt0[538];
	 		1034:
	  			CASE slt0[539] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[539] := (random_num + slt0[539]) MOD 2;
	  			random_num := random_num - slt0[539];
	 		1035:
	  			GD_OUT_5 := 1;
			1036:
	  			CASE slt0[540] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[540] := (random_num + slt0[540]) MOD 2;
	  			random_num := random_num - slt0[540];
	 		1037:
	  			CASE slt0[541] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[541] := (random_num + slt0[541]) MOD 2;
	  			random_num := random_num - slt0[541];
	 		1038:
	  			CASE slt0[542] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[542] := (random_num + slt0[542]) MOD 2;
	  			random_num := random_num - slt0[542];
	 		1039:
	  			CASE slt0[543] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[543] := (random_num + slt0[543]) MOD 2;
	  			random_num := random_num - slt0[543];
	 		1040:
	  			CASE slt0[544] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[544] := (random_num + slt0[544]) MOD 2;
	  			random_num := random_num - slt0[544];
	 		1041:
	  			CASE slt0[545] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[545] := (random_num + slt0[545]) MOD 2;
	  			random_num := random_num - slt0[545];
	 		1042:
	  			CASE slt0[546] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[546] := (random_num + slt0[546]) MOD 2;
	  			random_num := random_num - slt0[546];
	 		1043:
	  			CASE slt0[547] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[547] := (random_num + slt0[547]) MOD 2;
	  			random_num := random_num - slt0[547];
	 		1044:
	  			CASE slt0[548] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[548] := (random_num + slt0[548]) MOD 2;
	  			random_num := random_num - slt0[548];
	 		1045:
	  			CASE slt0[549] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[549] := (random_num + slt0[549]) MOD 2;
	  			random_num := random_num - slt0[549];
	 		1046:
	  			CASE slt0[550] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[550] := (random_num + slt0[550]) MOD 2;
	  			random_num := random_num - slt0[550];
	 		1047:
	  			CASE slt0[551] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[551] := (random_num + slt0[551]) MOD 2;
	  			random_num := random_num - slt0[551];
	 		1048:
	  			GD_OUT_3 := 1;
			1049:
	  			GD_OUT_5 := 1;
			1050:
	  			GD_OUT_3 := 1;
			1051:
	  			GD_OUT_5 := 1;
			1052:
	  			GD_OUT_2 := 0;
	  		1053:
	  			CASE slt0[552] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[552] := (random_num + slt0[552]) MOD 2;
	  			random_num := random_num - slt0[552];
	 		1055:
	  			CASE slt0[553] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[553] := (random_num + slt0[553]) MOD 2;
	  			random_num := random_num - slt0[553];
	 		1056:
	  			GD_OUT_4 := 0;
	  		1057:
	  			CASE slt0[554] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[554] := (random_num + slt0[554]) MOD 2;
	  			random_num := random_num - slt0[554];
	 		1058:
	  			CASE slt0[555] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[555] := (random_num + slt0[555]) MOD 3;
	  			random_num := random_num - slt0[555];
	 		1059:
	  			CASE slt0[556] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[556] := (random_num + slt0[556]) MOD 2;
	  			random_num := random_num - slt0[556];
	 		1060:
	  			CASE slt0[557] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[557] := (random_num + slt0[557]) MOD 2;
	  			random_num := random_num - slt0[557];
	 		1061:
	  			CASE slt0[558] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[558] := (random_num + slt0[558]) MOD 3;
	  			random_num := random_num - slt0[558];
	 		1062:
	  			CASE slt0[559] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[559] := (random_num + slt0[559]) MOD 2;
	  			random_num := random_num - slt0[559];
	 		1063:
	  			CASE slt0[560] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[560] := (random_num + slt0[560]) MOD 3;
	  			random_num := random_num - slt0[560];
	 		1064:
	  			CASE slt0[561] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[561] := (random_num + slt0[561]) MOD 4;
	  			random_num := random_num - slt0[561];
	 		1065:
	  			CASE slt0[562] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[562] := (random_num + slt0[562]) MOD 3;
	  			random_num := random_num - slt0[562];
	 		1066:
	  			CASE slt0[563] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[563] := (random_num + slt0[563]) MOD 3;
	  			random_num := random_num - slt0[563];
	 		1067:
	  			CASE slt0[564] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[564] := (random_num + slt0[564]) MOD 4;
	  			random_num := random_num - slt0[564];
	 		1068:
	  			CASE slt0[565] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[565] := (random_num + slt0[565]) MOD 3;
	  			random_num := random_num - slt0[565];
	 		1069:
	  			CASE slt0[566] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[566] := (random_num + slt0[566]) MOD 2;
	  			random_num := random_num - slt0[566];
	 		1070:
	  			GD_OUT_2 := 0;
	  		1071:
	  			CASE slt0[567] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[567] := (random_num + slt0[567]) MOD 2;
	  			random_num := random_num - slt0[567];
	 		1072:
	  			GD_OUT_4 := 0;
	  		1073:
	  			CASE slt0[568] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[568] := (random_num + slt0[568]) MOD 2;
	  			random_num := random_num - slt0[568];
	 		1074:
	  			CASE slt0[569] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[569] := (random_num + slt0[569]) MOD 2;
	  			random_num := random_num - slt0[569];
	 		1075:
	  			CASE slt0[570] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[570] := (random_num + slt0[570]) MOD 3;
	  			random_num := random_num - slt0[570];
	 		1076:
	  			CASE slt0[571] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[571] := (random_num + slt0[571]) MOD 2;
	  			random_num := random_num - slt0[571];
	 		1077:
	  			CASE slt0[572] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[572] := (random_num + slt0[572]) MOD 2;
	  			random_num := random_num - slt0[572];
	 		1078:
	  			GD_OUT_2 := 0;
	  		1079:
	  			CASE slt0[573] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[573] := (random_num + slt0[573]) MOD 3;
	  			random_num := random_num - slt0[573];
	 		1080:
	  			CASE slt0[574] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[574] := (random_num + slt0[574]) MOD 4;
	  			random_num := random_num - slt0[574];
	 		1081:
	  			GD_OUT_2 := 0;
	  		1082:
	  			CASE slt0[575] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[575] := (random_num + slt0[575]) MOD 2;
	  			random_num := random_num - slt0[575];
	 		1083:
	  			GD_OUT_3 := 1;
			1084:
	  			CASE slt0[576] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[576] := (random_num + slt0[576]) MOD 2;
	  			random_num := random_num - slt0[576];
	 		1085:
	  			CASE slt0[577] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[577] := (random_num + slt0[577]) MOD 2;
	  			random_num := random_num - slt0[577];
	 		1086:
	  			CASE slt0[578] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[578] := (random_num + slt0[578]) MOD 3;
	  			random_num := random_num - slt0[578];
	 		1087:
	  			CASE slt0[579] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[579] := (random_num + slt0[579]) MOD 2;
	  			random_num := random_num - slt0[579];
	 		1088:
	  			GD_OUT_5 := 1;
			1090:
	  			CASE slt0[580] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[580] := (random_num + slt0[580]) MOD 2;
	  			random_num := random_num - slt0[580];
	 		1091:
	  			CASE slt0[581] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[581] := (random_num + slt0[581]) MOD 3;
	  			random_num := random_num - slt0[581];
	 		1092:
	  			GD_OUT_4 := 0;
	  		1093:
	  			GD_OUT_3 := 1;
			1094:
	  			CASE slt0[582] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[582] := (random_num + slt0[582]) MOD 2;
	  			random_num := random_num - slt0[582];
	 		1095:
	  			CASE slt0[583] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[583] := (random_num + slt0[583]) MOD 3;
	  			random_num := random_num - slt0[583];
	 		1096:
	  			CASE slt0[584] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[584] := (random_num + slt0[584]) MOD 4;
	  			random_num := random_num - slt0[584];
	 		1097:
	  			CASE slt0[585] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[585] := (random_num + slt0[585]) MOD 2;
	  			random_num := random_num - slt0[585];
	 		1098:
	  			GD_OUT_5 := 1;
			1099:
	  			GD_OUT_4 := 0;
	  		1100:
	  			CASE slt0[586] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[586] := (random_num + slt0[586]) MOD 2;
	  			random_num := random_num - slt0[586];
	 		1101:
	  			CASE slt0[587] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[587] := (random_num + slt0[587]) MOD 3;
	  			random_num := random_num - slt0[587];
	 		1102:
	  			CASE slt0[588] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[588] := (random_num + slt0[588]) MOD 2;
	  			random_num := random_num - slt0[588];
	 		1103:
	  			CASE slt0[589] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[589] := (random_num + slt0[589]) MOD 2;
	  			random_num := random_num - slt0[589];
	 		1104:
	  			GD_OUT_3 := 1;
			1105:
	  			GD_OUT_5 := 1;
			1106:
	  			GD_OUT_3 := 1;
			1107:
	  			GD_OUT_5 := 1;
			1108:
	  			GD_OUT_2 := 0;
	  		1109:
	  			CASE slt0[590] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[590] := (random_num + slt0[590]) MOD 2;
	  			random_num := random_num - slt0[590];
	 		1111:
	  			CASE slt0[591] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[591] := (random_num + slt0[591]) MOD 2;
	  			random_num := random_num - slt0[591];
	 		1112:
	  			GD_OUT_4 := 0;
	  		1113:
	  			CASE slt0[592] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[592] := (random_num + slt0[592]) MOD 3;
	  			random_num := random_num - slt0[592];
	 		1114:
	  			CASE slt0[593] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[593] := (random_num + slt0[593]) MOD 4;
	  			random_num := random_num - slt0[593];
	 		1115:
	  			CASE slt0[594] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[594] := (random_num + slt0[594]) MOD 3;
	  			random_num := random_num - slt0[594];
	 		1116:
	  			CASE slt0[595] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[595] := (random_num + slt0[595]) MOD 3;
	  			random_num := random_num - slt0[595];
	 		1117:
	  			CASE slt0[596] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[596] := (random_num + slt0[596]) MOD 4;
	  			random_num := random_num - slt0[596];
	 		1118:
	  			CASE slt0[597] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[597] := (random_num + slt0[597]) MOD 3;
	  			random_num := random_num - slt0[597];
	 		1119:
	  			CASE slt0[598] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[598] := (random_num + slt0[598]) MOD 2;
	  			random_num := random_num - slt0[598];
	 		1120:
	  			CASE slt0[599] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[599] := (random_num + slt0[599]) MOD 3;
	  			random_num := random_num - slt0[599];
	 		1121:
	  			CASE slt0[600] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[600] := (random_num + slt0[600]) MOD 2;
	  			random_num := random_num - slt0[600];
	 		1122:
	  			CASE slt0[601] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[601] := (random_num + slt0[601]) MOD 2;
	  			random_num := random_num - slt0[601];
	 		1123:
	  			CASE slt0[602] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[602] := (random_num + slt0[602]) MOD 3;
	  			random_num := random_num - slt0[602];
	 		1124:
	  			CASE slt0[603] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[603] := (random_num + slt0[603]) MOD 2;
	  			random_num := random_num - slt0[603];
	 		1125:
	  			CASE slt0[604] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[604] := (random_num + slt0[604]) MOD 2;
	  			random_num := random_num - slt0[604];
	 		1126:
	  			GD_OUT_2 := 0;
	  		1127:
	  			CASE slt0[605] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[605] := (random_num + slt0[605]) MOD 2;
	  			random_num := random_num - slt0[605];
	 		1128:
	  			GD_OUT_4 := 0;
	  		1129:
	  			CASE slt0[606] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[606] := (random_num + slt0[606]) MOD 2;
	  			random_num := random_num - slt0[606];
	 		1130:
	  			CASE slt0[607] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[607] := (random_num + slt0[607]) MOD 3;
	  			random_num := random_num - slt0[607];
	 		1131:
	  			CASE slt0[608] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[608] := (random_num + slt0[608]) MOD 2;
	  			random_num := random_num - slt0[608];
	 		1132:
	  			CASE slt0[609] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[609] := (random_num + slt0[609]) MOD 2;
	  			random_num := random_num - slt0[609];
	 		1133:
	  			CASE slt0[610] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[610] := (random_num + slt0[610]) MOD 2;
	  			random_num := random_num - slt0[610];
	 		1134:
	  			GD_OUT_2 := 0;
	  		1135:
	  			CASE slt0[611] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[611] := (random_num + slt0[611]) MOD 4;
	  			random_num := random_num - slt0[611];
	 		1136:
	  			CASE slt0[612] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[612] := (random_num + slt0[612]) MOD 3;
	  			random_num := random_num - slt0[612];
	 		1137:
	  			GD_OUT_2 := 0;
	  		1138:
	  			CASE slt0[613] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[613] := (random_num + slt0[613]) MOD 2;
	  			random_num := random_num - slt0[613];
	 		1139:
	  			GD_OUT_3 := 1;
			1140:
	  			CASE slt0[614] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[614] := (random_num + slt0[614]) MOD 2;
	  			random_num := random_num - slt0[614];
	 		1141:
	  			CASE slt0[615] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[615] := (random_num + slt0[615]) MOD 3;
	  			random_num := random_num - slt0[615];
	 		1142:
	  			CASE slt0[616] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[616] := (random_num + slt0[616]) MOD 2;
	  			random_num := random_num - slt0[616];
	 		1143:
	  			CASE slt0[617] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[617] := (random_num + slt0[617]) MOD 2;
	  			random_num := random_num - slt0[617];
	 		1144:
	  			GD_OUT_5 := 1;
			1146:
	  			CASE slt0[618] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[618] := (random_num + slt0[618]) MOD 3;
	  			random_num := random_num - slt0[618];
	 		1147:
	  			CASE slt0[619] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[619] := (random_num + slt0[619]) MOD 2;
	  			random_num := random_num - slt0[619];
	 		1148:
	  			GD_OUT_4 := 0;
	  		1149:
	  			GD_OUT_3 := 1;
			1150:
	  			CASE slt0[620] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[620] := (random_num + slt0[620]) MOD 2;
	  			random_num := random_num - slt0[620];
	 		1151:
	  			CASE slt0[621] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[621] := (random_num + slt0[621]) MOD 4;
	  			random_num := random_num - slt0[621];
	 		1152:
	  			CASE slt0[622] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[622] := (random_num + slt0[622]) MOD 3;
	  			random_num := random_num - slt0[622];
	 		1153:
	  			CASE slt0[623] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[623] := (random_num + slt0[623]) MOD 2;
	  			random_num := random_num - slt0[623];
	 		1154:
	  			GD_OUT_5 := 1;
			1155:
	  			GD_OUT_4 := 0;
	  		1156:
	  			CASE slt0[624] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[624] := (random_num + slt0[624]) MOD 3;
	  			random_num := random_num - slt0[624];
	 		1157:
	  			CASE slt0[625] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[625] := (random_num + slt0[625]) MOD 2;
	  			random_num := random_num - slt0[625];
	 		1158:
	  			CASE slt0[626] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[626] := (random_num + slt0[626]) MOD 2;
	  			random_num := random_num - slt0[626];
	 		1159:
	  			CASE slt0[627] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[627] := (random_num + slt0[627]) MOD 2;
	  			random_num := random_num - slt0[627];
	 		1160:
	  			CASE slt0[628] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[628] := (random_num + slt0[628]) MOD 2;
	  			random_num := random_num - slt0[628];
	 		1161:
	  			CASE slt0[629] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[629] := (random_num + slt0[629]) MOD 2;
	  			random_num := random_num - slt0[629];
	 		1162:
	  			GD_OUT_2 := 0;
	  		1163:
	  			CASE slt0[630] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[630] := (random_num + slt0[630]) MOD 2;
	  			random_num := random_num - slt0[630];
	 		1165:
	  			CASE slt0[631] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[631] := (random_num + slt0[631]) MOD 2;
	  			random_num := random_num - slt0[631];
	 		1166:
	  			GD_OUT_4 := 0;
	  		1167:
	  			GD_OUT_3 := 1;
			1168:
	  			CASE slt0[632] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[632] := (random_num + slt0[632]) MOD 2;
	  			random_num := random_num - slt0[632];
	 		1169:
	  			GD_OUT_3 := 1;
			1170:
	  			GD_OUT_5 := 1;
			1171:
	  			CASE slt0[633] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[633] := (random_num + slt0[633]) MOD 2;
	  			random_num := random_num - slt0[633];
	 		1172:
	  			GD_OUT_5 := 1;
			1173:
	  			CASE slt0[634] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[634] := (random_num + slt0[634]) MOD 3;
	  			random_num := random_num - slt0[634];
	 		1174:
	  			CASE slt0[635] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[635] := (random_num + slt0[635]) MOD 2;
	  			random_num := random_num - slt0[635];
	 		1175:
	  			CASE slt0[636] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[636] := (random_num + slt0[636]) MOD 3;
	  			random_num := random_num - slt0[636];
	 		1176:
	  			CASE slt0[637] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[637] := (random_num + slt0[637]) MOD 2;
	  			random_num := random_num - slt0[637];
	 		1177:
	  			CASE slt0[638] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[638] := (random_num + slt0[638]) MOD 3;
	  			random_num := random_num - slt0[638];
	 		1178:
	  			CASE slt0[639] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[639] := (random_num + slt0[639]) MOD 4;
	  			random_num := random_num - slt0[639];
	 		1179:
	  			CASE slt0[640] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[640] := (random_num + slt0[640]) MOD 3;
	  			random_num := random_num - slt0[640];
	 		1180:
	  			CASE slt0[641] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[641] := (random_num + slt0[641]) MOD 4;
	  			random_num := random_num - slt0[641];
	 		1181:
	  			CASE slt0[642] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[642] := (random_num + slt0[642]) MOD 3;
	  			random_num := random_num - slt0[642];
	 		1182:
	  			CASE slt0[643] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[643] := (random_num + slt0[643]) MOD 4;
	  			random_num := random_num - slt0[643];
	 		1183:
	  			GD_OUT_3 := 1;
			1184:
	  			CASE slt0[644] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[644] := (random_num + slt0[644]) MOD 2;
	  			random_num := random_num - slt0[644];
	 		1185:
	  			CASE slt0[645] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[645] := (random_num + slt0[645]) MOD 2;
	  			random_num := random_num - slt0[645];
	 		1186:
	  			GD_OUT_5 := 1;
			1187:
	  			GD_OUT_3 := 1;
			1188:
	  			CASE slt0[646] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[646] := (random_num + slt0[646]) MOD 3;
	  			random_num := random_num - slt0[646];
	 		1189:
	  			CASE slt0[647] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[647] := (random_num + slt0[647]) MOD 4;
	  			random_num := random_num - slt0[647];
	 		1190:
	  			GD_OUT_3 := 1;
			1191:
	  			CASE slt0[648] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[648] := (random_num + slt0[648]) MOD 2;
	  			random_num := random_num - slt0[648];
	 		1192:
	  			GD_OUT_2 := 0;
	  		1193:
	  			CASE slt0[649] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[649] := (random_num + slt0[649]) MOD 2;
	  			random_num := random_num - slt0[649];
	 		1194:
	  			CASE slt0[650] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[650] := (random_num + slt0[650]) MOD 2;
	  			random_num := random_num - slt0[650];
	 		1195:
	  			CASE slt0[651] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[651] := (random_num + slt0[651]) MOD 3;
	  			random_num := random_num - slt0[651];
	 		1196:
	  			CASE slt0[652] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[652] := (random_num + slt0[652]) MOD 2;
	  			random_num := random_num - slt0[652];
	 		1197:
	  			CASE slt0[653] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[653] := (random_num + slt0[653]) MOD 2;
	  			random_num := random_num - slt0[653];
	 		1198:
	  			GD_OUT_3 := 1;
			1199:
	  			CASE slt0[654] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[654] := (random_num + slt0[654]) MOD 3;
	  			random_num := random_num - slt0[654];
	 		1200:
	  			CASE slt0[655] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[655] := (random_num + slt0[655]) MOD 4;
	  			random_num := random_num - slt0[655];
	 		1201:
	  			CASE slt0[656] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[656] := (random_num + slt0[656]) MOD 2;
	  			random_num := random_num - slt0[656];
	 		1203:
	  			GD_OUT_5 := 1;
			1204:
	  			CASE slt0[657] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[657] := (random_num + slt0[657]) MOD 2;
	  			random_num := random_num - slt0[657];
	 		1205:
	  			CASE slt0[658] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[658] := (random_num + slt0[658]) MOD 3;
	  			random_num := random_num - slt0[658];
	 		1206:
	  			GD_OUT_5 := 1;
			1207:
	  			CASE slt0[659] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[659] := (random_num + slt0[659]) MOD 2;
	  			random_num := random_num - slt0[659];
	 		1208:
	  			CASE slt0[660] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[660] := (random_num + slt0[660]) MOD 2;
	  			random_num := random_num - slt0[660];
	 		1209:
	  			CASE slt0[661] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[661] := (random_num + slt0[661]) MOD 3;
	  			random_num := random_num - slt0[661];
	 		1210:
	  			CASE slt0[662] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[662] := (random_num + slt0[662]) MOD 4;
	  			random_num := random_num - slt0[662];
	 		1211:
	  			GD_OUT_4 := 0;
	  		1212:
	  			GD_OUT_5 := 1;
			1213:
	  			GD_OUT_2 := 0;
	  		1214:
	  			CASE slt0[663] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[663] := (random_num + slt0[663]) MOD 2;
	  			random_num := random_num - slt0[663];
	 		1216:
	  			CASE slt0[664] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[664] := (random_num + slt0[664]) MOD 2;
	  			random_num := random_num - slt0[664];
	 		1217:
	  			GD_OUT_4 := 0;
	  		1218:
	  			GD_OUT_3 := 1;
			1219:
	  			CASE slt0[665] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[665] := (random_num + slt0[665]) MOD 2;
	  			random_num := random_num - slt0[665];
	 		1220:
	  			GD_OUT_3 := 1;
			1221:
	  			GD_OUT_5 := 1;
			1222:
	  			CASE slt0[666] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[666] := (random_num + slt0[666]) MOD 2;
	  			random_num := random_num - slt0[666];
	 		1223:
	  			GD_OUT_5 := 1;
			1224:
	  			CASE slt0[667] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[667] := (random_num + slt0[667]) MOD 4;
	  			random_num := random_num - slt0[667];
	 		1225:
	  			CASE slt0[668] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[668] := (random_num + slt0[668]) MOD 3;
	  			random_num := random_num - slt0[668];
	 		1226:
	  			CASE slt0[669] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[669] := (random_num + slt0[669]) MOD 4;
	  			random_num := random_num - slt0[669];
	 		1227:
	  			CASE slt0[670] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[670] := (random_num + slt0[670]) MOD 3;
	  			random_num := random_num - slt0[670];
	 		1228:
	  			CASE slt0[671] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[671] := (random_num + slt0[671]) MOD 4;
	  			random_num := random_num - slt0[671];
	 		1229:
	  			CASE slt0[672] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[672] := (random_num + slt0[672]) MOD 3;
	  			random_num := random_num - slt0[672];
	 		1230:
	  			CASE slt0[673] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[673] := (random_num + slt0[673]) MOD 2;
	  			random_num := random_num - slt0[673];
	 		1231:
	  			CASE slt0[674] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[674] := (random_num + slt0[674]) MOD 3;
	  			random_num := random_num - slt0[674];
	 		1232:
	  			CASE slt0[675] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[675] := (random_num + slt0[675]) MOD 2;
	  			random_num := random_num - slt0[675];
	 		1233:
	  			CASE slt0[676] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[676] := (random_num + slt0[676]) MOD 3;
	  			random_num := random_num - slt0[676];
	 		1234:
	  			GD_OUT_3 := 1;
			1235:
	  			CASE slt0[677] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[677] := (random_num + slt0[677]) MOD 2;
	  			random_num := random_num - slt0[677];
	 		1236:
	  			CASE slt0[678] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[678] := (random_num + slt0[678]) MOD 2;
	  			random_num := random_num - slt0[678];
	 		1237:
	  			GD_OUT_5 := 1;
			1238:
	  			GD_OUT_3 := 1;
			1239:
	  			CASE slt0[679] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[679] := (random_num + slt0[679]) MOD 4;
	  			random_num := random_num - slt0[679];
	 		1240:
	  			CASE slt0[680] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[680] := (random_num + slt0[680]) MOD 3;
	  			random_num := random_num - slt0[680];
	 		1241:
	  			GD_OUT_3 := 1;
			1242:
	  			CASE slt0[681] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[681] := (random_num + slt0[681]) MOD 2;
	  			random_num := random_num - slt0[681];
	 		1243:
	  			GD_OUT_2 := 0;
	  		1244:
	  			CASE slt0[682] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[682] := (random_num + slt0[682]) MOD 2;
	  			random_num := random_num - slt0[682];
	 		1245:
	  			CASE slt0[683] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[683] := (random_num + slt0[683]) MOD 3;
	  			random_num := random_num - slt0[683];
	 		1246:
	  			CASE slt0[684] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  			END_CASE;
	  			slt0[684] := (random_num + slt0[684]) MOD 2;
	  			random_num := random_num - slt0[684];
	 		1247:
	  			CASE slt0[685] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[685] := (random_num + slt0[685]) MOD 2;
	  			random_num := random_num - slt0[685];
	 		1248:
	  			CASE slt0[686] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[686] := (random_num + slt0[686]) MOD 2;
	  			random_num := random_num - slt0[686];
	 		1249:
	  			GD_OUT_3 := 1;
			1250:
	  			CASE slt0[687] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[687] := (random_num + slt0[687]) MOD 4;
	  			random_num := random_num - slt0[687];
	 		1251:
	  			CASE slt0[688] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[688] := (random_num + slt0[688]) MOD 3;
	  			random_num := random_num - slt0[688];
	 		1252:
	  			CASE slt0[689] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[689] := (random_num + slt0[689]) MOD 2;
	  			random_num := random_num - slt0[689];
	 		1254:
	  			GD_OUT_5 := 1;
			1255:
	  			CASE slt0[690] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[690] := (random_num + slt0[690]) MOD 3;
	  			random_num := random_num - slt0[690];
	 		1256:
	  			CASE slt0[691] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[691] := (random_num + slt0[691]) MOD 2;
	  			random_num := random_num - slt0[691];
	 		1257:
	  			GD_OUT_5 := 1;
			1258:
	  			CASE slt0[692] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[692] := (random_num + slt0[692]) MOD 2;
	  			random_num := random_num - slt0[692];
	 		1259:
	  			CASE slt0[693] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[693] := (random_num + slt0[693]) MOD 2;
	  			random_num := random_num - slt0[693];
	 		1260:
	  			CASE slt0[694] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[694] := (random_num + slt0[694]) MOD 4;
	  			random_num := random_num - slt0[694];
	 		1261:
	  			CASE slt0[695] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[695] := (random_num + slt0[695]) MOD 3;
	  			random_num := random_num - slt0[695];
	 		1262:
	  			GD_OUT_4 := 0;
	  		1263:
	  			GD_OUT_5 := 1;
			1264:
	  			GD_OUT_3 := 1;
			1265:
	  			CASE slt0[696] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[696] := (random_num + slt0[696]) MOD 2;
	  			random_num := random_num - slt0[696];
	 		1266:
	  			GD_OUT_3 := 1;
			1267:
	  			GD_OUT_5 := 1;
			1268:
	  			CASE slt0[697] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[697] := (random_num + slt0[697]) MOD 2;
	  			random_num := random_num - slt0[697];
	 		1269:
	  			GD_OUT_5 := 1;
			1270:
	  			CASE slt0[698] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[698] := (random_num + slt0[698]) MOD 2;
	  			random_num := random_num - slt0[698];
	 		1271:
	  			GD_OUT_2 := 0;
	  		1272:
	  			CASE slt0[699] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[699] := (random_num + slt0[699]) MOD 2;
	  			random_num := random_num - slt0[699];
	 		1273:
	  			GD_OUT_4 := 0;
	  		1274:
	  			CASE slt0[700] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[700] := (random_num + slt0[700]) MOD 2;
	  			random_num := random_num - slt0[700];
	 		1275:
	  			CASE slt0[701] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[701] := (random_num + slt0[701]) MOD 2;
	  			random_num := random_num - slt0[701];
	 		1276:
	  			CASE slt0[702] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[702] := (random_num + slt0[702]) MOD 3;
	  			random_num := random_num - slt0[702];
	 		1277:
	  			CASE slt0[703] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[703] := (random_num + slt0[703]) MOD 3;
	  			random_num := random_num - slt0[703];
	 		1278:
	  			CASE slt0[704] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[704] := (random_num + slt0[704]) MOD 2;
	  			random_num := random_num - slt0[704];
	 		1279:
	  			CASE slt0[705] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[705] := (random_num + slt0[705]) MOD 3;
	  			random_num := random_num - slt0[705];
	 		1280:
	  			CASE slt0[706] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[706] := (random_num + slt0[706]) MOD 4;
	  			random_num := random_num - slt0[706];
	 		1281:
	  			CASE slt0[707] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[707] := (random_num + slt0[707]) MOD 4;
	  			random_num := random_num - slt0[707];
	 		1282:
	  			CASE slt0[708] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[708] := (random_num + slt0[708]) MOD 3;
	  			random_num := random_num - slt0[708];
	 		1283:
	  			CASE slt0[709] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[709] := (random_num + slt0[709]) MOD 2;
	  			random_num := random_num - slt0[709];
	 		1284:
	  			CASE slt0[710] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[710] := (random_num + slt0[710]) MOD 2;
	  			random_num := random_num - slt0[710];
	 		1285:
	  			CASE slt0[711] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[711] := (random_num + slt0[711]) MOD 2;
	  			random_num := random_num - slt0[711];
	 		1286:
	  			GD_OUT_3 := 1;
			1287:
	  			CASE slt0[712] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[712] := (random_num + slt0[712]) MOD 2;
	  			random_num := random_num - slt0[712];
	 		1288:
	  			CASE slt0[713] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[713] := (random_num + slt0[713]) MOD 2;
	  			random_num := random_num - slt0[713];
	 		1289:
	  			CASE slt0[714] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[714] := (random_num + slt0[714]) MOD 3;
	  			random_num := random_num - slt0[714];
	 		1290:
	  			CASE slt0[715] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[715] := (random_num + slt0[715]) MOD 2;
	  			random_num := random_num - slt0[715];
	 		1291:
	  			CASE slt0[716] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[716] := (random_num + slt0[716]) MOD 2;
	  			random_num := random_num - slt0[716];
	 		1292:
	  			GD_OUT_2 := 0;
	  		1293:
	  			CASE slt0[717] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[717] := (random_num + slt0[717]) MOD 3;
	  			random_num := random_num - slt0[717];
	 		1294:
	  			CASE slt0[718] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[718] := (random_num + slt0[718]) MOD 4;
	  			random_num := random_num - slt0[718];
	 		1295:
	  			CASE slt0[719] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[719] := (random_num + slt0[719]) MOD 2;
	  			random_num := random_num - slt0[719];
	 		1296:
	  			GD_OUT_3 := 1;
			1297:
	  			CASE slt0[720] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[720] := (random_num + slt0[720]) MOD 2;
	  			random_num := random_num - slt0[720];
	 		1298:
	  			CASE slt0[721] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[721] := (random_num + slt0[721]) MOD 3;
	  			random_num := random_num - slt0[721];
	 		1299:
	  			CASE slt0[722] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[722] := (random_num + slt0[722]) MOD 4;
	  			random_num := random_num - slt0[722];
	 		1300:
	  			CASE slt0[723] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[723] := (random_num + slt0[723]) MOD 2;
	  			random_num := random_num - slt0[723];
	 		1301:
	  			GD_OUT_5 := 1;
			1302:
	  			GD_OUT_4 := 0;
	  		1303:
	  			CASE slt0[724] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[724] := (random_num + slt0[724]) MOD 2;
	  			random_num := random_num - slt0[724];
	 		1304:
	  			CASE slt0[725] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[725] := (random_num + slt0[725]) MOD 3;
	  			random_num := random_num - slt0[725];
	 		1305:
	  			CASE slt0[726] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[726] := (random_num + slt0[726]) MOD 2;
	  			random_num := random_num - slt0[726];
	 		1306:
	  			CASE slt0[727] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[727] := (random_num + slt0[727]) MOD 2;
	  			random_num := random_num - slt0[727];
	 		1307:
	  			GD_OUT_5 := 1;
			1308:
	  			GD_OUT_3 := 1;
			1309:
	  			CASE slt0[728] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[728] := (random_num + slt0[728]) MOD 2;
	  			random_num := random_num - slt0[728];
	 		1310:
	  			GD_OUT_3 := 1;
			1311:
	  			GD_OUT_5 := 1;
			1312:
	  			CASE slt0[729] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[729] := (random_num + slt0[729]) MOD 2;
	  			random_num := random_num - slt0[729];
	 		1313:
	  			GD_OUT_5 := 1;
			1314:
	  			CASE slt0[730] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[730] := (random_num + slt0[730]) MOD 2;
	  			random_num := random_num - slt0[730];
	 		1315:
	  			GD_OUT_2 := 0;
	  		1316:
	  			CASE slt0[731] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[731] := (random_num + slt0[731]) MOD 2;
	  			random_num := random_num - slt0[731];
	 		1317:
	  			GD_OUT_4 := 0;
	  		1318:
	  			CASE slt0[732] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[732] := (random_num + slt0[732]) MOD 2;
	  			random_num := random_num - slt0[732];
	 		1319:
	  			CASE slt0[733] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[733] := (random_num + slt0[733]) MOD 3;
	  			random_num := random_num - slt0[733];
	 		1320:
	  			CASE slt0[734] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[734] := (random_num + slt0[734]) MOD 4;
	  			random_num := random_num - slt0[734];
	 		1321:
	  			CASE slt0[735] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[735] := (random_num + slt0[735]) MOD 4;
	  			random_num := random_num - slt0[735];
	 		1322:
	  			CASE slt0[736] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[736] := (random_num + slt0[736]) MOD 3;
	  			random_num := random_num - slt0[736];
	 		1323:
	  			CASE slt0[737] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[737] := (random_num + slt0[737]) MOD 2;
	  			random_num := random_num - slt0[737];
	 		1324:
	  			CASE slt0[738] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[738] := (random_num + slt0[738]) MOD 3;
	  			random_num := random_num - slt0[738];
	 		1325:
	  			CASE slt0[739] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[739] := (random_num + slt0[739]) MOD 3;
	  			random_num := random_num - slt0[739];
	 		1326:
	  			CASE slt0[740] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[740] := (random_num + slt0[740]) MOD 2;
	  			random_num := random_num - slt0[740];
	 		1327:
	  			CASE slt0[741] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[741] := (random_num + slt0[741]) MOD 2;
	  			random_num := random_num - slt0[741];
	 		1328:
	  			CASE slt0[742] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[742] := (random_num + slt0[742]) MOD 2;
	  			random_num := random_num - slt0[742];
	 		1329:
	  			CASE slt0[743] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[743] := (random_num + slt0[743]) MOD 2;
	  			random_num := random_num - slt0[743];
	 		1330:
	  			GD_OUT_3 := 1;
			1331:
	  			CASE slt0[744] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[744] := (random_num + slt0[744]) MOD 2;
	  			random_num := random_num - slt0[744];
	 		1332:
	  			CASE slt0[745] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[745] := (random_num + slt0[745]) MOD 3;
	  			random_num := random_num - slt0[745];
	 		1333:
	  			CASE slt0[746] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  			END_CASE;
	  			slt0[746] := (random_num + slt0[746]) MOD 2;
	  			random_num := random_num - slt0[746];
	 		1334:
	  			CASE slt0[747] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[747] := (random_num + slt0[747]) MOD 2;
	  			random_num := random_num - slt0[747];
	 		1335:
	  			CASE slt0[748] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[748] := (random_num + slt0[748]) MOD 2;
	  			random_num := random_num - slt0[748];
	 		1336:
	  			GD_OUT_2 := 0;
	  		1337:
	  			CASE slt0[749] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[749] := (random_num + slt0[749]) MOD 4;
	  			random_num := random_num - slt0[749];
	 		1338:
	  			CASE slt0[750] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[750] := (random_num + slt0[750]) MOD 3;
	  			random_num := random_num - slt0[750];
	 		1339:
	  			CASE slt0[751] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[751] := (random_num + slt0[751]) MOD 2;
	  			random_num := random_num - slt0[751];
	 		1340:
	  			GD_OUT_3 := 1;
			1341:
	  			CASE slt0[752] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[752] := (random_num + slt0[752]) MOD 2;
	  			random_num := random_num - slt0[752];
	 		1342:
	  			CASE slt0[753] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[753] := (random_num + slt0[753]) MOD 4;
	  			random_num := random_num - slt0[753];
	 		1343:
	  			CASE slt0[754] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[754] := (random_num + slt0[754]) MOD 3;
	  			random_num := random_num - slt0[754];
	 		1344:
	  			CASE slt0[755] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[755] := (random_num + slt0[755]) MOD 2;
	  			random_num := random_num - slt0[755];
	 		1345:
	  			GD_OUT_5 := 1;
			1346:
	  			GD_OUT_4 := 0;
	  		1347:
	  			CASE slt0[756] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[756] := (random_num + slt0[756]) MOD 3;
	  			random_num := random_num - slt0[756];
	 		1348:
	  			CASE slt0[757] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[757] := (random_num + slt0[757]) MOD 2;
	  			random_num := random_num - slt0[757];
	 		1349:
	  			CASE slt0[758] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[758] := (random_num + slt0[758]) MOD 2;
	  			random_num := random_num - slt0[758];
	 		1350:
	  			CASE slt0[759] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[759] := (random_num + slt0[759]) MOD 2;
	  			random_num := random_num - slt0[759];
	 		1351:
	  			GD_OUT_5 := 1;
			1352:
	  			CASE slt0[760] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[760] := (random_num + slt0[760]) MOD 2;
	  			random_num := random_num - slt0[760];
	 		1353:
	  			GD_OUT_2 := 0;
	  		1354:
	  			CASE slt0[761] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[761] := (random_num + slt0[761]) MOD 2;
	  			random_num := random_num - slt0[761];
	 		1355:
	  			GD_OUT_4 := 0;
	  		1356:
	  			CASE slt0[762] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[762] := (random_num + slt0[762]) MOD 2;
	  			random_num := random_num - slt0[762];
	 		1357:
	  			GD_OUT_3 := 1;
			1358:
	  			CASE slt0[763] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[763] := (random_num + slt0[763]) MOD 2;
	  			random_num := random_num - slt0[763];
	 		1359:
	  			CASE slt0[764] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[764] := (random_num + slt0[764]) MOD 2;
	  			random_num := random_num - slt0[764];
	 		1360:
	  			GD_OUT_5 := 1;
			1361:
	  			CASE slt0[765] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[765] := (random_num + slt0[765]) MOD 3;
	  			random_num := random_num - slt0[765];
	 		1362:
	  			CASE slt0[766] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[766] := (random_num + slt0[766]) MOD 3;
	  			random_num := random_num - slt0[766];
	 		1363:
	  			CASE slt0[767] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[767] := (random_num + slt0[767]) MOD 3;
	  			random_num := random_num - slt0[767];
	 		1364:
	  			CASE slt0[768] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[768] := (random_num + slt0[768]) MOD 4;
	  			random_num := random_num - slt0[768];
	 		1365:
	  			CASE slt0[769] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[769] := (random_num + slt0[769]) MOD 4;
	  			random_num := random_num - slt0[769];
	 		1366:
	  			CASE slt0[770] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[770] := (random_num + slt0[770]) MOD 4;
	  			random_num := random_num - slt0[770];
	 		1367:
	  			CASE slt0[771] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[771] := (random_num + slt0[771]) MOD 2;
	  			random_num := random_num - slt0[771];
	 		1368:
	  			CASE slt0[772] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[772] := (random_num + slt0[772]) MOD 2;
	  			random_num := random_num - slt0[772];
	 		1369:
	  			CASE slt0[773] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[773] := (random_num + slt0[773]) MOD 2;
	  			random_num := random_num - slt0[773];
	 		1370:
	  			GD_OUT_3 := 1;
			1371:
	  			CASE slt0[774] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[774] := (random_num + slt0[774]) MOD 3;
	  			random_num := random_num - slt0[774];
	 		1372:
	  			CASE slt0[775] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[775] := (random_num + slt0[775]) MOD 4;
	  			random_num := random_num - slt0[775];
	 		1373:
	  			CASE slt0[776] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[776] := (random_num + slt0[776]) MOD 2;
	  			random_num := random_num - slt0[776];
	 		1374:
	  			GD_OUT_2 := 0;
	  		1375:
	  			CASE slt0[777] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[777] := (random_num + slt0[777]) MOD 2;
	  			random_num := random_num - slt0[777];
	 		1376:
	  			CASE slt0[778] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[778] := (random_num + slt0[778]) MOD 3;
	  			random_num := random_num - slt0[778];
	 		1377:
	  			CASE slt0[779] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[779] := (random_num + slt0[779]) MOD 4;
	  			random_num := random_num - slt0[779];
	 		1378:
	  			CASE slt0[780] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[780] := (random_num + slt0[780]) MOD 2;
	  			random_num := random_num - slt0[780];
	 		1379:
	  			CASE slt0[781] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[781] := (random_num + slt0[781]) MOD 2;
	  			random_num := random_num - slt0[781];
	 		1380:
	  			CASE slt0[782] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[782] := (random_num + slt0[782]) MOD 2;
	  			random_num := random_num - slt0[782];
	 		1381:
	  			CASE slt0[783] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[783] := (random_num + slt0[783]) MOD 3;
	  			random_num := random_num - slt0[783];
	 		1382:
	  			CASE slt0[784] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[784] := (random_num + slt0[784]) MOD 4;
	  			random_num := random_num - slt0[784];
	 		1383:
	  			GD_OUT_4 := 0;
	  		1384:
	  			GD_OUT_5 := 1;
			1385:
	  			CASE slt0[785] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[785] := (random_num + slt0[785]) MOD 2;
	  			random_num := random_num - slt0[785];
	 		1386:
	  			CASE slt0[786] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[786] := (random_num + slt0[786]) MOD 2;
	  			random_num := random_num - slt0[786];
	 		1387:
	  			GD_OUT_2 := 0;
	  		1388:
	  			CASE slt0[787] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[787] := (random_num + slt0[787]) MOD 2;
	  			random_num := random_num - slt0[787];
	 		1389:
	  			GD_OUT_4 := 0;
	  		1390:
	  			CASE slt0[788] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[788] := (random_num + slt0[788]) MOD 2;
	  			random_num := random_num - slt0[788];
	 		1391:
	  			GD_OUT_3 := 1;
			1392:
	  			CASE slt0[789] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[789] := (random_num + slt0[789]) MOD 2;
	  			random_num := random_num - slt0[789];
	 		1393:
	  			CASE slt0[790] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[790] := (random_num + slt0[790]) MOD 2;
	  			random_num := random_num - slt0[790];
	 		1394:
	  			GD_OUT_5 := 1;
			1395:
	  			CASE slt0[791] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[791] := (random_num + slt0[791]) MOD 4;
	  			random_num := random_num - slt0[791];
	 		1396:
	  			CASE slt0[792] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[792] := (random_num + slt0[792]) MOD 4;
	  			random_num := random_num - slt0[792];
	 		1397:
	  			CASE slt0[793] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[793] := (random_num + slt0[793]) MOD 4;
	  			random_num := random_num - slt0[793];
	 		1398:
	  			CASE slt0[794] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[794] := (random_num + slt0[794]) MOD 3;
	  			random_num := random_num - slt0[794];
	 		1399:
	  			CASE slt0[795] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[795] := (random_num + slt0[795]) MOD 3;
	  			random_num := random_num - slt0[795];
	 		1400:
	  			CASE slt0[796] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[796] := (random_num + slt0[796]) MOD 3;
	  			random_num := random_num - slt0[796];
	 		1401:
	  			CASE slt0[797] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[797] := (random_num + slt0[797]) MOD 2;
	  			random_num := random_num - slt0[797];
	 		1402:
	  			CASE slt0[798] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[798] := (random_num + slt0[798]) MOD 2;
	  			random_num := random_num - slt0[798];
	 		1403:
	  			CASE slt0[799] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[799] := (random_num + slt0[799]) MOD 2;
	  			random_num := random_num - slt0[799];
	 		1404:
	  			GD_OUT_3 := 1;
			1405:
	  			CASE slt0[800] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[800] := (random_num + slt0[800]) MOD 4;
	  			random_num := random_num - slt0[800];
	 		1406:
	  			CASE slt0[801] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[801] := (random_num + slt0[801]) MOD 3;
	  			random_num := random_num - slt0[801];
	 		1407:
	  			CASE slt0[802] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[802] := (random_num + slt0[802]) MOD 2;
	  			random_num := random_num - slt0[802];
	 		1408:
	  			GD_OUT_2 := 0;
	  		1409:
	  			CASE slt0[803] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[803] := (random_num + slt0[803]) MOD 2;
	  			random_num := random_num - slt0[803];
	 		1410:
	  			CASE slt0[804] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[804] := (random_num + slt0[804]) MOD 4;
	  			random_num := random_num - slt0[804];
	 		1411:
	  			CASE slt0[805] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[805] := (random_num + slt0[805]) MOD 3;
	  			random_num := random_num - slt0[805];
	 		1412:
	  			CASE slt0[806] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[806] := (random_num + slt0[806]) MOD 2;
	  			random_num := random_num - slt0[806];
	 		1413:
	  			CASE slt0[807] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[807] := (random_num + slt0[807]) MOD 2;
	  			random_num := random_num - slt0[807];
	 		1414:
	  			CASE slt0[808] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[808] := (random_num + slt0[808]) MOD 2;
	  			random_num := random_num - slt0[808];
	 		1415:
	  			CASE slt0[809] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[809] := (random_num + slt0[809]) MOD 4;
	  			random_num := random_num - slt0[809];
	 		1416:
	  			CASE slt0[810] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[810] := (random_num + slt0[810]) MOD 3;
	  			random_num := random_num - slt0[810];
	 		1417:
	  			GD_OUT_4 := 0;
	  		1418:
	  			GD_OUT_5 := 1;
			1419:
	  			CASE slt0[811] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[811] := (random_num + slt0[811]) MOD 2;
	  			random_num := random_num - slt0[811];
	 		1420:
	  			GD_OUT_3 := 1;
			1421:
	  			CASE slt0[812] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[812] := (random_num + slt0[812]) MOD 2;
	  			random_num := random_num - slt0[812];
	 		1422:
	  			CASE slt0[813] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[813] := (random_num + slt0[813]) MOD 2;
	  			random_num := random_num - slt0[813];
	 		1423:
	  			GD_OUT_5 := 1;
			1424:
	  			CASE slt0[814] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[814] := (random_num + slt0[814]) MOD 2;
	  			random_num := random_num - slt0[814];
	 		1425:
	  			CASE slt0[815] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[815] := (random_num + slt0[815]) MOD 2;
	  			random_num := random_num - slt0[815];
	 		1426:
	  			CASE slt0[816] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[816] := (random_num + slt0[816]) MOD 2;
	  			random_num := random_num - slt0[816];
	 		1427:
	  			CASE slt0[817] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[817] := (random_num + slt0[817]) MOD 3;
	  			random_num := random_num - slt0[817];
	 		1428:
	  			CASE slt0[818] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[818] := (random_num + slt0[818]) MOD 3;
	  			random_num := random_num - slt0[818];
	 		1429:
	  			CASE slt0[819] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[819] := (random_num + slt0[819]) MOD 4;
	  			random_num := random_num - slt0[819];
	 		1430:
	  			CASE slt0[820] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[820] := (random_num + slt0[820]) MOD 4;
	  			random_num := random_num - slt0[820];
	 		1431:
	  			CASE slt0[821] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[821] := (random_num + slt0[821]) MOD 2;
	  			random_num := random_num - slt0[821];
	 		1432:
	  			GD_OUT_3 := 1;
			1433:
	  			CASE slt0[822] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[822] := (random_num + slt0[822]) MOD 2;
	  			random_num := random_num - slt0[822];
	 		1434:
	  			CASE slt0[823] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[823] := (random_num + slt0[823]) MOD 3;
	  			random_num := random_num - slt0[823];
	 		1435:
	  			CASE slt0[824] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[824] := (random_num + slt0[824]) MOD 4;
	  			random_num := random_num - slt0[824];
	 		1436:
	  			CASE slt0[825] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[825] := (random_num + slt0[825]) MOD 2;
	  			random_num := random_num - slt0[825];
	 		1437:
	  			CASE slt0[826] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[826] := (random_num + slt0[826]) MOD 2;
	  			random_num := random_num - slt0[826];
	 		1438:
	  			CASE slt0[827] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[827] := (random_num + slt0[827]) MOD 2;
	  			random_num := random_num - slt0[827];
	 		1439:
	  			CASE slt0[828] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[828] := (random_num + slt0[828]) MOD 3;
	  			random_num := random_num - slt0[828];
	 		1440:
	  			CASE slt0[829] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[829] := (random_num + slt0[829]) MOD 4;
	  			random_num := random_num - slt0[829];
	 		1441:
	  			CASE slt0[830] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[830] := (random_num + slt0[830]) MOD 2;
	  			random_num := random_num - slt0[830];
	 		1442:
	  			CASE slt0[831] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[831] := (random_num + slt0[831]) MOD 2;
	  			random_num := random_num - slt0[831];
	 		1443:
	  			GD_OUT_5 := 1;
			1444:
	  			GD_OUT_3 := 1;
			1445:
	  			CASE slt0[832] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[832] := (random_num + slt0[832]) MOD 2;
	  			random_num := random_num - slt0[832];
	 		1446:
	  			CASE slt0[833] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[833] := (random_num + slt0[833]) MOD 2;
	  			random_num := random_num - slt0[833];
	 		1447:
	  			GD_OUT_5 := 1;
			1448:
	  			CASE slt0[834] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[834] := (random_num + slt0[834]) MOD 2;
	  			random_num := random_num - slt0[834];
	 		1449:
	  			CASE slt0[835] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[835] := (random_num + slt0[835]) MOD 2;
	  			random_num := random_num - slt0[835];
	 		1450:
	  			CASE slt0[836] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[836] := (random_num + slt0[836]) MOD 2;
	  			random_num := random_num - slt0[836];
	 		1451:
	  			CASE slt0[837] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[837] := (random_num + slt0[837]) MOD 4;
	  			random_num := random_num - slt0[837];
	 		1452:
	  			CASE slt0[838] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[838] := (random_num + slt0[838]) MOD 4;
	  			random_num := random_num - slt0[838];
	 		1453:
	  			CASE slt0[839] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[839] := (random_num + slt0[839]) MOD 3;
	  			random_num := random_num - slt0[839];
	 		1454:
	  			CASE slt0[840] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[840] := (random_num + slt0[840]) MOD 3;
	  			random_num := random_num - slt0[840];
	 		1455:
	  			CASE slt0[841] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[841] := (random_num + slt0[841]) MOD 2;
	  			random_num := random_num - slt0[841];
	 		1456:
	  			GD_OUT_3 := 1;
			1457:
	  			CASE slt0[842] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[842] := (random_num + slt0[842]) MOD 2;
	  			random_num := random_num - slt0[842];
	 		1458:
	  			CASE slt0[843] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[843] := (random_num + slt0[843]) MOD 4;
	  			random_num := random_num - slt0[843];
	 		1459:
	  			CASE slt0[844] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[844] := (random_num + slt0[844]) MOD 3;
	  			random_num := random_num - slt0[844];
	 		1460:
	  			CASE slt0[845] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[845] := (random_num + slt0[845]) MOD 2;
	  			random_num := random_num - slt0[845];
	 		1461:
	  			CASE slt0[846] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[846] := (random_num + slt0[846]) MOD 2;
	  			random_num := random_num - slt0[846];
	 		1462:
	  			CASE slt0[847] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[847] := (random_num + slt0[847]) MOD 2;
	  			random_num := random_num - slt0[847];
	 		1463:
	  			CASE slt0[848] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_2 := 0;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[848] := (random_num + slt0[848]) MOD 4;
	  			random_num := random_num - slt0[848];
	 		1464:
	  			CASE slt0[849] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_2 := 0;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[849] := (random_num + slt0[849]) MOD 3;
	  			random_num := random_num - slt0[849];
	 		1465:
	  			CASE slt0[850] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[850] := (random_num + slt0[850]) MOD 2;
	  			random_num := random_num - slt0[850];
	 		1466:
	  			CASE slt0[851] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[851] := (random_num + slt0[851]) MOD 2;
	  			random_num := random_num - slt0[851];
	 		1467:
	  			GD_OUT_5 := 1;
			1468:
	  			CASE slt0[852] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[852] := (random_num + slt0[852]) MOD 2;
	  			random_num := random_num - slt0[852];
	 		1469:
	  			CASE slt0[853] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[853] := (random_num + slt0[853]) MOD 2;
	  			random_num := random_num - slt0[853];
	 		1470:
	  			CASE slt0[854] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[854] := (random_num + slt0[854]) MOD 2;
	  			random_num := random_num - slt0[854];
	 		1471:
	  			CASE slt0[855] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[855] := (random_num + slt0[855]) MOD 2;
	  			random_num := random_num - slt0[855];
	 		1472:
	  			CASE slt0[856] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[856] := (random_num + slt0[856]) MOD 2;
	  			random_num := random_num - slt0[856];
	 		1473:
	  			CASE slt0[857] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[857] := (random_num + slt0[857]) MOD 3;
	  			random_num := random_num - slt0[857];
	 		1474:
	  			CASE slt0[858] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[858] := (random_num + slt0[858]) MOD 4;
	  			random_num := random_num - slt0[858];
	 		1475:
	  			CASE slt0[859] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[859] := (random_num + slt0[859]) MOD 2;
	  			random_num := random_num - slt0[859];
	 		1476:
	  			CASE slt0[860] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[860] := (random_num + slt0[860]) MOD 2;
	  			random_num := random_num - slt0[860];
	 		1477:
	  			CASE slt0[861] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[861] := (random_num + slt0[861]) MOD 3;
	  			random_num := random_num - slt0[861];
	 		1478:
	  			CASE slt0[862] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[862] := (random_num + slt0[862]) MOD 4;
	  			random_num := random_num - slt0[862];
	 		1479:
	  			CASE slt0[863] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[863] := (random_num + slt0[863]) MOD 2;
	  			random_num := random_num - slt0[863];
	 		1480:
	  			CASE slt0[864] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[864] := (random_num + slt0[864]) MOD 2;
	  			random_num := random_num - slt0[864];
	 		1481:
	  			CASE slt0[865] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[865] := (random_num + slt0[865]) MOD 2;
	  			random_num := random_num - slt0[865];
	 		1482:
	  			CASE slt0[866] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[866] := (random_num + slt0[866]) MOD 2;
	  			random_num := random_num - slt0[866];
	 		1483:
	  			CASE slt0[867] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[867] := (random_num + slt0[867]) MOD 2;
	  			random_num := random_num - slt0[867];
	 		1484:
	  			CASE slt0[868] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[868] := (random_num + slt0[868]) MOD 2;
	  			random_num := random_num - slt0[868];
	 		1485:
	  			CASE slt0[869] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[869] := (random_num + slt0[869]) MOD 2;
	  			random_num := random_num - slt0[869];
	 		1486:
	  			CASE slt0[870] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[870] := (random_num + slt0[870]) MOD 2;
	  			random_num := random_num - slt0[870];
	 		1487:
	  			CASE slt0[871] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[871] := (random_num + slt0[871]) MOD 4;
	  			random_num := random_num - slt0[871];
	 		1488:
	  			CASE slt0[872] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[872] := (random_num + slt0[872]) MOD 3;
	  			random_num := random_num - slt0[872];
	 		1489:
	  			CASE slt0[873] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[873] := (random_num + slt0[873]) MOD 2;
	  			random_num := random_num - slt0[873];
	 		1490:
	  			CASE slt0[874] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[874] := (random_num + slt0[874]) MOD 2;
	  			random_num := random_num - slt0[874];
	 		1491:
	  			CASE slt0[875] OF
	  				0:
	  					GD_OUT_0 := 1;
	  				1:
	  					GD_OUT_1 := 1;
	  				2:
	  					GD_OUT_3 := 1;
	  				3:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[875] := (random_num + slt0[875]) MOD 4;
	  			random_num := random_num - slt0[875];
	 		1492:
	  			CASE slt0[876] OF
	  				0:
	  					GD_OUT_1 := 1;
	  				1:
	  					GD_OUT_3 := 1;
	  				2:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[876] := (random_num + slt0[876]) MOD 3;
	  			random_num := random_num - slt0[876];
	 		1493:
	  			CASE slt0[877] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[877] := (random_num + slt0[877]) MOD 2;
	  			random_num := random_num - slt0[877];
	 		1494:
	  			CASE slt0[878] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[878] := (random_num + slt0[878]) MOD 2;
	  			random_num := random_num - slt0[878];
	 		1495:
	  			CASE slt0[879] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[879] := (random_num + slt0[879]) MOD 2;
	  			random_num := random_num - slt0[879];
	 		1496:
	  			CASE slt0[880] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[880] := (random_num + slt0[880]) MOD 2;
	  			random_num := random_num - slt0[880];
	 		1497:
	  			CASE slt0[881] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[881] := (random_num + slt0[881]) MOD 2;
	  			random_num := random_num - slt0[881];
	 		1498:
	  			CASE slt0[882] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[882] := (random_num + slt0[882]) MOD 2;
	  			random_num := random_num - slt0[882];
	 		1499:
	  			CASE slt0[883] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[883] := (random_num + slt0[883]) MOD 2;
	  			random_num := random_num - slt0[883];
	 		1500:
	  			CASE slt0[884] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[884] := (random_num + slt0[884]) MOD 2;
	  			random_num := random_num - slt0[884];
	 		1501:
	  			CASE slt0[885] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[885] := (random_num + slt0[885]) MOD 2;
	  			random_num := random_num - slt0[885];
	 		1502:
	  			CASE slt0[886] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[886] := (random_num + slt0[886]) MOD 2;
	  			random_num := random_num - slt0[886];
	 		1503:
	  			CASE slt0[887] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[887] := (random_num + slt0[887]) MOD 2;
	  			random_num := random_num - slt0[887];
	 		1504:
	  			CASE slt0[888] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[888] := (random_num + slt0[888]) MOD 2;
	  			random_num := random_num - slt0[888];
	 		1505:
	  			CASE slt0[889] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_4 := 0;
	  			END_CASE;
	  			slt0[889] := (random_num + slt0[889]) MOD 2;
	  			random_num := random_num - slt0[889];
	 		1506:
	  			CASE slt0[890] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[890] := (random_num + slt0[890]) MOD 2;
	  			random_num := random_num - slt0[890];
	 		1507:
	  			CASE slt0[891] OF
	  				0:
	  					GD_OUT_2 := 0;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[891] := (random_num + slt0[891]) MOD 2;
	  			random_num := random_num - slt0[891];
	 		1508:
	  			CASE slt0[892] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[892] := (random_num + slt0[892]) MOD 2;
	  			random_num := random_num - slt0[892];
	 		1509:
	  			CASE slt0[893] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[893] := (random_num + slt0[893]) MOD 2;
	  			random_num := random_num - slt0[893];
	 		1510:
	  			CASE slt0[894] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[894] := (random_num + slt0[894]) MOD 2;
	  			random_num := random_num - slt0[894];
	 		1511:
	  			CASE slt0[895] OF
	  				0:
	  					GD_OUT_3 := 1;
	  				1:
	  					GD_OUT_5 := 1;
	  			END_CASE;
	  			slt0[895] := (random_num + slt0[895]) MOD 2;
	  			random_num := random_num - slt0[895];
	 	END_CASE;
	
		CASE state[1] OF
	  		0:
	  			GD_OUT_6 := 1;
			1:
	  			GD_OUT_6 := 0;
	  	END_CASE;
	
		CASE state[2] OF
	  		0:
	  			GD_OUT_7 := 1;
			1:
	  			GD_OUT_7 := 0;
	  	END_CASE;
	
		CASE state[3] OF
	  		0:
	  			GD_OUT_8 := 1;
			1:
	  			GD_OUT_8 := 0;
	  	END_CASE;
	
		CASE state[4] OF
	  		0:
	  			GD_OUT_9 := 1;
			1:
	  			GD_OUT_9 := 0;
	  	END_CASE;
	
		CASE state[5] OF
	  		0:
	  			GD_OUT_10 := 1;
			1:
	  			GD_OUT_10 := 0;
	  	END_CASE;
	
		CASE state[6] OF
	  		0:
	  			GD_OUT_11 := 1;
			1:
	  			GD_OUT_11 := 0;
	  	END_CASE;
		IF state[0] = 27 & GD_OUT_0 THEN
	  		state[0] := 46;
	  	ELSIF state[0] = 27 & GD_OUT_1 THEN
	  		state[0] := 47;
	  	ELSIF state[0] = 28 & GD_OUT_0 THEN
	  		state[0] := 50;
	  	ELSIF state[0] = 28 & GD_OUT_1 THEN
	  		state[0] := 47;
	  	ELSIF state[0] = 36 & GD_OUT_0 THEN
	  		state[0] := 65;
	  	ELSIF state[0] = 36 & GD_OUT_1 THEN
	  		state[0] := 66;
	  	ELSIF state[0] = 37 & GD_OUT_0 THEN
	  		state[0] := 68;
	  	ELSIF state[0] = 37 & GD_OUT_1 THEN
	  		state[0] := 66;
	  	ELSIF state[0] = 48 & GD_OUT_0 THEN
	  		state[0] := 78;
	  	ELSIF state[0] = 48 & GD_OUT_1 THEN
	  		state[0] := 81;
	  	ELSIF state[0] = 49 & GD_OUT_0 THEN
	  		state[0] := 79;
	  	ELSIF state[0] = 49 & GD_OUT_1 THEN
	  		state[0] := 82;
	  	ELSIF state[0] = 51 & GD_OUT_0 THEN
	  		state[0] := 87;
	  	ELSIF state[0] = 51 & GD_OUT_1 THEN
	  		state[0] := 81;
	  	ELSIF state[0] = 52 & GD_OUT_0 THEN
	  		state[0] := 88;
	  	ELSIF state[0] = 52 & GD_OUT_1 THEN
	  		state[0] := 82;
	  	ELSIF state[0] = 61 & GD_OUT_0 THEN
	  		state[0] := 104;
	  	ELSIF state[0] = 61 & GD_OUT_1 THEN
	  		state[0] := 105;
	  	ELSIF state[0] = 62 & GD_OUT_0 THEN
	  		state[0] := 107;
	  	ELSIF state[0] = 62 & GD_OUT_1 THEN
	  		state[0] := 105;
	  	ELSIF state[0] = 67 & GD_OUT_0 THEN
	  		state[0] := 112;
	  	ELSIF state[0] = 67 & GD_OUT_1 THEN
	  		state[0] := 114;
	  	ELSIF state[0] = 69 & GD_OUT_0 THEN
	  		state[0] := 117;
	  	ELSIF state[0] = 69 & GD_OUT_1 THEN
	  		state[0] := 114;
	  	ELSIF state[0] = 83 & GD_OUT_0 THEN
	  		state[0] := 127;
	  	ELSIF state[0] = 83 & GD_OUT_1 THEN
	  		state[0] := 132;
	  	ELSIF state[0] = 84 & GD_OUT_0 THEN
	  		state[0] := 128;
	  	ELSIF state[0] = 84 & GD_OUT_1 THEN
	  		state[0] := 133;
	  	ELSIF state[0] = 85 & GD_OUT_0 THEN
	  		state[0] := 129;
	  	ELSIF state[0] = 85 & GD_OUT_1 THEN
	  		state[0] := 134;
	  	ELSIF state[0] = 89 & GD_OUT_0 THEN
	  		state[0] := 142;
	  	ELSIF state[0] = 89 & GD_OUT_1 THEN
	  		state[0] := 132;
	  	ELSIF state[0] = 90 & GD_OUT_0 THEN
	  		state[0] := 143;
	  	ELSIF state[0] = 90 & GD_OUT_1 THEN
	  		state[0] := 133;
	  	ELSIF state[0] = 91 & GD_OUT_0 THEN
	  		state[0] := 144;
	  	ELSIF state[0] = 91 & GD_OUT_1 THEN
	  		state[0] := 134;
	  	ELSIF state[0] = 100 & GD_OUT_0 THEN
	  		state[0] := 161;
	  	ELSIF state[0] = 100 & GD_OUT_1 THEN
	  		state[0] := 162;
	  	ELSIF state[0] = 101 & GD_OUT_0 THEN
	  		state[0] := 164;
	  	ELSIF state[0] = 101 & GD_OUT_1 THEN
	  		state[0] := 162;
	  	ELSIF state[0] = 106 & GD_OUT_0 THEN
	  		state[0] := 169;
	  	ELSIF state[0] = 106 & GD_OUT_1 THEN
	  		state[0] := 171;
	  	ELSIF state[0] = 108 & GD_OUT_0 THEN
	  		state[0] := 174;
	  	ELSIF state[0] = 108 & GD_OUT_1 THEN
	  		state[0] := 171;
	  	ELSIF state[0] = 115 & GD_OUT_0 THEN
	  		state[0] := 178;
	  	ELSIF state[0] = 115 & GD_OUT_1 THEN
	  		state[0] := 180;
	  	ELSIF state[0] = 118 & GD_OUT_0 THEN
	  		state[0] := 183;
	  	ELSIF state[0] = 118 & GD_OUT_1 THEN
	  		state[0] := 180;
	  	ELSIF state[0] = 135 & GD_OUT_0 THEN
	  		state[0] := 194;
	  	ELSIF state[0] = 135 & GD_OUT_1 THEN
	  		state[0] := 201;
	  	ELSIF state[0] = 136 & GD_OUT_0 THEN
	  		state[0] := 195;
	  	ELSIF state[0] = 136 & GD_OUT_1 THEN
	  		state[0] := 202;
	  	ELSIF state[0] = 137 & GD_OUT_0 THEN
	  		state[0] := 196;
	  	ELSIF state[0] = 137 & GD_OUT_1 THEN
	  		state[0] := 203;
	  	ELSIF state[0] = 138 & GD_OUT_0 THEN
	  		state[0] := 197;
	  	ELSIF state[0] = 138 & GD_OUT_1 THEN
	  		state[0] := 204;
	  	ELSIF state[0] = 145 & GD_OUT_0 THEN
	  		state[0] := 215;
	  	ELSIF state[0] = 145 & GD_OUT_1 THEN
	  		state[0] := 201;
	  	ELSIF state[0] = 146 & GD_OUT_0 THEN
	  		state[0] := 216;
	  	ELSIF state[0] = 146 & GD_OUT_1 THEN
	  		state[0] := 202;
	  	ELSIF state[0] = 147 & GD_OUT_0 THEN
	  		state[0] := 217;
	  	ELSIF state[0] = 147 & GD_OUT_1 THEN
	  		state[0] := 203;
	  	ELSIF state[0] = 148 & GD_OUT_0 THEN
	  		state[0] := 218;
	  	ELSIF state[0] = 148 & GD_OUT_1 THEN
	  		state[0] := 204;
	  	ELSIF state[0] = 157 & GD_OUT_0 THEN
	  		state[0] := 236;
	  	ELSIF state[0] = 157 & GD_OUT_1 THEN
	  		state[0] := 237;
	  	ELSIF state[0] = 158 & GD_OUT_0 THEN
	  		state[0] := 239;
	  	ELSIF state[0] = 158 & GD_OUT_1 THEN
	  		state[0] := 237;
	  	ELSIF state[0] = 163 & GD_OUT_0 THEN
	  		state[0] := 244;
	  	ELSIF state[0] = 163 & GD_OUT_1 THEN
	  		state[0] := 246;
	  	ELSIF state[0] = 165 & GD_OUT_0 THEN
	  		state[0] := 249;
	  	ELSIF state[0] = 165 & GD_OUT_1 THEN
	  		state[0] := 246;
	  	ELSIF state[0] = 172 & GD_OUT_0 THEN
	  		state[0] := 253;
	  	ELSIF state[0] = 172 & GD_OUT_1 THEN
	  		state[0] := 255;
	  	ELSIF state[0] = 175 & GD_OUT_0 THEN
	  		state[0] := 258;
	  	ELSIF state[0] = 175 & GD_OUT_1 THEN
	  		state[0] := 255;
	  	ELSIF state[0] = 181 & GD_OUT_0 THEN
	  		state[0] := 262;
	  	ELSIF state[0] = 181 & GD_OUT_1 THEN
	  		state[0] := 264;
	  	ELSIF state[0] = 184 & GD_OUT_0 THEN
	  		state[0] := 267;
	  	ELSIF state[0] = 184 & GD_OUT_1 THEN
	  		state[0] := 264;
	  	ELSIF state[0] = 205 & GD_OUT_0 THEN
	  		state[0] := 279;
	  	ELSIF state[0] = 205 & GD_OUT_1 THEN
	  		state[0] := 288;
	  	ELSIF state[0] = 206 & GD_OUT_0 THEN
	  		state[0] := 280;
	  	ELSIF state[0] = 206 & GD_OUT_1 THEN
	  		state[0] := 289;
	  	ELSIF state[0] = 207 & GD_OUT_0 THEN
	  		state[0] := 281;
	  	ELSIF state[0] = 207 & GD_OUT_1 THEN
	  		state[0] := 290;
	  	ELSIF state[0] = 208 & GD_OUT_0 THEN
	  		state[0] := 282;
	  	ELSIF state[0] = 208 & GD_OUT_1 THEN
	  		state[0] := 291;
	  	ELSIF state[0] = 209 & GD_OUT_0 THEN
	  		state[0] := 283;
	  	ELSIF state[0] = 209 & GD_OUT_1 THEN
	  		state[0] := 292;
	  	ELSIF state[0] = 219 & GD_OUT_0 THEN
	  		state[0] := 306;
	  	ELSIF state[0] = 219 & GD_OUT_1 THEN
	  		state[0] := 288;
	  	ELSIF state[0] = 220 & GD_OUT_0 THEN
	  		state[0] := 307;
	  	ELSIF state[0] = 220 & GD_OUT_1 THEN
	  		state[0] := 289;
	  	ELSIF state[0] = 221 & GD_OUT_0 THEN
	  		state[0] := 308;
	  	ELSIF state[0] = 221 & GD_OUT_1 THEN
	  		state[0] := 290;
	  	ELSIF state[0] = 222 & GD_OUT_0 THEN
	  		state[0] := 309;
	  	ELSIF state[0] = 222 & GD_OUT_1 THEN
	  		state[0] := 291;
	  	ELSIF state[0] = 223 & GD_OUT_0 THEN
	  		state[0] := 310;
	  	ELSIF state[0] = 223 & GD_OUT_1 THEN
	  		state[0] := 292;
	  	ELSIF state[0] = 232 & GD_OUT_0 THEN
	  		state[0] := 326;
	  	ELSIF state[0] = 232 & GD_OUT_1 THEN
	  		state[0] := 327;
	  	ELSIF state[0] = 233 & GD_OUT_0 THEN
	  		state[0] := 329;
	  	ELSIF state[0] = 233 & GD_OUT_1 THEN
	  		state[0] := 327;
	  	ELSIF state[0] = 238 & GD_OUT_0 THEN
	  		state[0] := 334;
	  	ELSIF state[0] = 238 & GD_OUT_1 THEN
	  		state[0] := 336;
	  	ELSIF state[0] = 240 & GD_OUT_0 THEN
	  		state[0] := 339;
	  	ELSIF state[0] = 240 & GD_OUT_1 THEN
	  		state[0] := 336;
	  	ELSIF state[0] = 247 & GD_OUT_0 THEN
	  		state[0] := 343;
	  	ELSIF state[0] = 247 & GD_OUT_1 THEN
	  		state[0] := 345;
	  	ELSIF state[0] = 250 & GD_OUT_0 THEN
	  		state[0] := 348;
	  	ELSIF state[0] = 250 & GD_OUT_1 THEN
	  		state[0] := 345;
	  	ELSIF state[0] = 256 & GD_OUT_0 THEN
	  		state[0] := 352;
	  	ELSIF state[0] = 256 & GD_OUT_1 THEN
	  		state[0] := 354;
	  	ELSIF state[0] = 259 & GD_OUT_0 THEN
	  		state[0] := 357;
	  	ELSIF state[0] = 259 & GD_OUT_1 THEN
	  		state[0] := 354;
	  	ELSIF state[0] = 265 & GD_OUT_0 THEN
	  		state[0] := 361;
	  	ELSIF state[0] = 265 & GD_OUT_1 THEN
	  		state[0] := 363;
	  	ELSIF state[0] = 268 & GD_OUT_0 THEN
	  		state[0] := 366;
	  	ELSIF state[0] = 268 & GD_OUT_1 THEN
	  		state[0] := 363;
	  	ELSIF state[0] = 293 & GD_OUT_0 THEN
	  		state[0] := 380;
	  	ELSIF state[0] = 293 & GD_OUT_1 THEN
	  		state[0] := 391;
	  	ELSIF state[0] = 294 & GD_OUT_0 THEN
	  		state[0] := 381;
	  	ELSIF state[0] = 294 & GD_OUT_1 THEN
	  		state[0] := 392;
	  	ELSIF state[0] = 295 & GD_OUT_0 THEN
	  		state[0] := 382;
	  	ELSIF state[0] = 295 & GD_OUT_1 THEN
	  		state[0] := 393;
	  	ELSIF state[0] = 296 & GD_OUT_0 THEN
	  		state[0] := 383;
	  	ELSIF state[0] = 296 & GD_OUT_1 THEN
	  		state[0] := 394;
	  	ELSIF state[0] = 297 & GD_OUT_0 THEN
	  		state[0] := 384;
	  	ELSIF state[0] = 297 & GD_OUT_1 THEN
	  		state[0] := 395;
	  	ELSIF state[0] = 298 & GD_OUT_0 THEN
	  		state[0] := 385;
	  	ELSIF state[0] = 298 & GD_OUT_1 THEN
	  		state[0] := 396;
	  	ELSIF state[0] = 311 & GD_OUT_0 THEN
	  		state[0] := 413;
	  	ELSIF state[0] = 311 & GD_OUT_1 THEN
	  		state[0] := 391;
	  	ELSIF state[0] = 312 & GD_OUT_0 THEN
	  		state[0] := 414;
	  	ELSIF state[0] = 312 & GD_OUT_1 THEN
	  		state[0] := 392;
	  	ELSIF state[0] = 313 & GD_OUT_0 THEN
	  		state[0] := 415;
	  	ELSIF state[0] = 313 & GD_OUT_1 THEN
	  		state[0] := 393;
	  	ELSIF state[0] = 314 & GD_OUT_0 THEN
	  		state[0] := 416;
	  	ELSIF state[0] = 314 & GD_OUT_1 THEN
	  		state[0] := 394;
	  	ELSIF state[0] = 315 & GD_OUT_0 THEN
	  		state[0] := 417;
	  	ELSIF state[0] = 315 & GD_OUT_1 THEN
	  		state[0] := 395;
	  	ELSIF state[0] = 316 & GD_OUT_0 THEN
	  		state[0] := 418;
	  	ELSIF state[0] = 316 & GD_OUT_1 THEN
	  		state[0] := 396;
	  	ELSIF state[0] = 322 & GD_OUT_0 THEN
	  		state[0] := 428;
	  	ELSIF state[0] = 322 & GD_OUT_1 THEN
	  		state[0] := 429;
	  	ELSIF state[0] = 323 & GD_OUT_0 THEN
	  		state[0] := 431;
	  	ELSIF state[0] = 323 & GD_OUT_1 THEN
	  		state[0] := 429;
	  	ELSIF state[0] = 328 & GD_OUT_0 THEN
	  		state[0] := 436;
	  	ELSIF state[0] = 328 & GD_OUT_1 THEN
	  		state[0] := 438;
	  	ELSIF state[0] = 330 & GD_OUT_0 THEN
	  		state[0] := 441;
	  	ELSIF state[0] = 330 & GD_OUT_1 THEN
	  		state[0] := 438;
	  	ELSIF state[0] = 337 & GD_OUT_0 THEN
	  		state[0] := 445;
	  	ELSIF state[0] = 337 & GD_OUT_1 THEN
	  		state[0] := 447;
	  	ELSIF state[0] = 340 & GD_OUT_0 THEN
	  		state[0] := 450;
	  	ELSIF state[0] = 340 & GD_OUT_1 THEN
	  		state[0] := 447;
	  	ELSIF state[0] = 346 & GD_OUT_0 THEN
	  		state[0] := 454;
	  	ELSIF state[0] = 346 & GD_OUT_1 THEN
	  		state[0] := 456;
	  	ELSIF state[0] = 349 & GD_OUT_0 THEN
	  		state[0] := 459;
	  	ELSIF state[0] = 349 & GD_OUT_1 THEN
	  		state[0] := 456;
	  	ELSIF state[0] = 355 & GD_OUT_0 THEN
	  		state[0] := 463;
	  	ELSIF state[0] = 355 & GD_OUT_1 THEN
	  		state[0] := 465;
	  	ELSIF state[0] = 358 & GD_OUT_0 THEN
	  		state[0] := 468;
	  	ELSIF state[0] = 358 & GD_OUT_1 THEN
	  		state[0] := 465;
	  	ELSIF state[0] = 364 & GD_OUT_0 THEN
	  		state[0] := 471;
	  	ELSIF state[0] = 364 & GD_OUT_1 THEN
	  		state[0] := 473;
	  	ELSIF state[0] = 367 & GD_OUT_0 THEN
	  		state[0] := 475;
	  	ELSIF state[0] = 367 & GD_OUT_1 THEN
	  		state[0] := 473;
	  	ELSIF state[0] = 397 & GD_OUT_0 THEN
	  		state[0] := 495;
	  	ELSIF state[0] = 397 & GD_OUT_1 THEN
	  		state[0] := 506;
	  	ELSIF state[0] = 398 & GD_OUT_0 THEN
	  		state[0] := 496;
	  	ELSIF state[0] = 398 & GD_OUT_1 THEN
	  		state[0] := 507;
	  	ELSIF state[0] = 399 & GD_OUT_0 THEN
	  		state[0] := 497;
	  	ELSIF state[0] = 399 & GD_OUT_1 THEN
	  		state[0] := 508;
	  	ELSIF state[0] = 400 & GD_OUT_0 THEN
	  		state[0] := 498;
	  	ELSIF state[0] = 400 & GD_OUT_1 THEN
	  		state[0] := 509;
	  	ELSIF state[0] = 401 & GD_OUT_0 THEN
	  		state[0] := 499;
	  	ELSIF state[0] = 401 & GD_OUT_1 THEN
	  		state[0] := 510;
	  	ELSIF state[0] = 419 & GD_OUT_0 THEN
	  		state[0] := 534;
	  	ELSIF state[0] = 419 & GD_OUT_1 THEN
	  		state[0] := 506;
	  	ELSIF state[0] = 420 & GD_OUT_0 THEN
	  		state[0] := 535;
	  	ELSIF state[0] = 420 & GD_OUT_1 THEN
	  		state[0] := 507;
	  	ELSIF state[0] = 421 & GD_OUT_0 THEN
	  		state[0] := 536;
	  	ELSIF state[0] = 421 & GD_OUT_1 THEN
	  		state[0] := 508;
	  	ELSIF state[0] = 422 & GD_OUT_0 THEN
	  		state[0] := 537;
	  	ELSIF state[0] = 422 & GD_OUT_1 THEN
	  		state[0] := 509;
	  	ELSIF state[0] = 423 & GD_OUT_0 THEN
	  		state[0] := 538;
	  	ELSIF state[0] = 423 & GD_OUT_1 THEN
	  		state[0] := 510;
	  	ELSIF state[0] = 430 & GD_OUT_0 THEN
	  		state[0] := 547;
	  	ELSIF state[0] = 430 & GD_OUT_1 THEN
	  		state[0] := 549;
	  	ELSIF state[0] = 432 & GD_OUT_0 THEN
	  		state[0] := 552;
	  	ELSIF state[0] = 432 & GD_OUT_1 THEN
	  		state[0] := 549;
	  	ELSIF state[0] = 439 & GD_OUT_0 THEN
	  		state[0] := 556;
	  	ELSIF state[0] = 439 & GD_OUT_1 THEN
	  		state[0] := 558;
	  	ELSIF state[0] = 442 & GD_OUT_0 THEN
	  		state[0] := 561;
	  	ELSIF state[0] = 442 & GD_OUT_1 THEN
	  		state[0] := 558;
	  	ELSIF state[0] = 448 & GD_OUT_0 THEN
	  		state[0] := 565;
	  	ELSIF state[0] = 448 & GD_OUT_1 THEN
	  		state[0] := 567;
	  	ELSIF state[0] = 451 & GD_OUT_0 THEN
	  		state[0] := 570;
	  	ELSIF state[0] = 451 & GD_OUT_1 THEN
	  		state[0] := 567;
	  	ELSIF state[0] = 457 & GD_OUT_0 THEN
	  		state[0] := 574;
	  	ELSIF state[0] = 457 & GD_OUT_1 THEN
	  		state[0] := 576;
	  	ELSIF state[0] = 460 & GD_OUT_0 THEN
	  		state[0] := 579;
	  	ELSIF state[0] = 460 & GD_OUT_1 THEN
	  		state[0] := 576;
	  	ELSIF state[0] = 466 & GD_OUT_0 THEN
	  		state[0] := 582;
	  	ELSIF state[0] = 466 & GD_OUT_1 THEN
	  		state[0] := 584;
	  	ELSIF state[0] = 469 & GD_OUT_0 THEN
	  		state[0] := 586;
	  	ELSIF state[0] = 469 & GD_OUT_1 THEN
	  		state[0] := 584;
	  	ELSIF state[0] = 476 & GD_OUT_1 THEN
	  		state[0] := 590;
	  	ELSIF state[0] = 477 & GD_OUT_0 THEN
	  		state[0] := 50;
	  	ELSIF state[0] = 477 & GD_OUT_1 THEN
	  		state[0] := 590;
	  	ELSIF state[0] = 485 & GD_OUT_1 THEN
	  		state[0] := 607;
	  	ELSIF state[0] = 486 & GD_OUT_0 THEN
	  		state[0] := 68;
	  	ELSIF state[0] = 486 & GD_OUT_1 THEN
	  		state[0] := 607;
	  	ELSIF state[0] = 511 & GD_OUT_0 THEN
	  		state[0] := 617;
	  	ELSIF state[0] = 511 & GD_OUT_1 THEN
	  		state[0] := 626;
	  	ELSIF state[0] = 512 & GD_OUT_0 THEN
	  		state[0] := 618;
	  	ELSIF state[0] = 512 & GD_OUT_1 THEN
	  		state[0] := 627;
	  	ELSIF state[0] = 513 & GD_OUT_0 THEN
	  		state[0] := 619;
	  	ELSIF state[0] = 513 & GD_OUT_1 THEN
	  		state[0] := 628;
	  	ELSIF state[0] = 514 & GD_OUT_0 THEN
	  		state[0] := 620;
	  	ELSIF state[0] = 514 & GD_OUT_1 THEN
	  		state[0] := 629;
	  	ELSIF state[0] = 515 & GD_OUT_0 THEN
	  		state[0] := 46;
	  	ELSIF state[0] = 515 & GD_OUT_1 THEN
	  		state[0] := 633;
	  	ELSIF state[0] = 516 & GD_OUT_1 THEN
	  		state[0] := 633;
	  	ELSIF state[0] = 524 & GD_OUT_0 THEN
	  		state[0] := 65;
	  	ELSIF state[0] = 524 & GD_OUT_1 THEN
	  		state[0] := 650;
	  	ELSIF state[0] = 525 & GD_OUT_1 THEN
	  		state[0] := 650;
	  	ELSIF state[0] = 539 & GD_OUT_0 THEN
	  		state[0] := 660;
	  	ELSIF state[0] = 539 & GD_OUT_1 THEN
	  		state[0] := 626;
	  	ELSIF state[0] = 540 & GD_OUT_0 THEN
	  		state[0] := 661;
	  	ELSIF state[0] = 540 & GD_OUT_1 THEN
	  		state[0] := 627;
	  	ELSIF state[0] = 541 & GD_OUT_0 THEN
	  		state[0] := 662;
	  	ELSIF state[0] = 541 & GD_OUT_1 THEN
	  		state[0] := 628;
	  	ELSIF state[0] = 542 & GD_OUT_0 THEN
	  		state[0] := 663;
	  	ELSIF state[0] = 542 & GD_OUT_1 THEN
	  		state[0] := 629;
	  	ELSIF state[0] = 550 & GD_OUT_0 THEN
	  		state[0] := 670;
	  	ELSIF state[0] = 550 & GD_OUT_1 THEN
	  		state[0] := 672;
	  	ELSIF state[0] = 553 & GD_OUT_0 THEN
	  		state[0] := 675;
	  	ELSIF state[0] = 553 & GD_OUT_1 THEN
	  		state[0] := 672;
	  	ELSIF state[0] = 559 & GD_OUT_0 THEN
	  		state[0] := 679;
	  	ELSIF state[0] = 559 & GD_OUT_1 THEN
	  		state[0] := 681;
	  	ELSIF state[0] = 562 & GD_OUT_0 THEN
	  		state[0] := 684;
	  	ELSIF state[0] = 562 & GD_OUT_1 THEN
	  		state[0] := 681;
	  	ELSIF state[0] = 568 & GD_OUT_0 THEN
	  		state[0] := 688;
	  	ELSIF state[0] = 568 & GD_OUT_1 THEN
	  		state[0] := 690;
	  	ELSIF state[0] = 571 & GD_OUT_0 THEN
	  		state[0] := 693;
	  	ELSIF state[0] = 571 & GD_OUT_1 THEN
	  		state[0] := 690;
	  	ELSIF state[0] = 577 & GD_OUT_0 THEN
	  		state[0] := 696;
	  	ELSIF state[0] = 577 & GD_OUT_1 THEN
	  		state[0] := 698;
	  	ELSIF state[0] = 580 & GD_OUT_0 THEN
	  		state[0] := 700;
	  	ELSIF state[0] = 580 & GD_OUT_1 THEN
	  		state[0] := 698;
	  	ELSIF state[0] = 591 & GD_OUT_1 THEN
	  		state[0] := 705;
	  	ELSIF state[0] = 592 & GD_OUT_1 THEN
	  		state[0] := 706;
	  	ELSIF state[0] = 593 & GD_OUT_0 THEN
	  		state[0] := 87;
	  	ELSIF state[0] = 593 & GD_OUT_1 THEN
	  		state[0] := 705;
	  	ELSIF state[0] = 594 & GD_OUT_0 THEN
	  		state[0] := 88;
	  	ELSIF state[0] = 594 & GD_OUT_1 THEN
	  		state[0] := 706;
	  	ELSIF state[0] = 603 & GD_OUT_1 THEN
	  		state[0] := 725;
	  	ELSIF state[0] = 604 & GD_OUT_0 THEN
	  		state[0] := 107;
	  	ELSIF state[0] = 604 & GD_OUT_1 THEN
	  		state[0] := 725;
	  	ELSIF state[0] = 608 & GD_OUT_1 THEN
	  		state[0] := 731;
	  	ELSIF state[0] = 609 & GD_OUT_0 THEN
	  		state[0] := 117;
	  	ELSIF state[0] = 609 & GD_OUT_1 THEN
	  		state[0] := 731;
	  	ELSIF state[0] = 630 & GD_OUT_0 THEN
	  		state[0] := 739;
	  	ELSIF state[0] = 630 & GD_OUT_1 THEN
	  		state[0] := 746;
	  	ELSIF state[0] = 631 & GD_OUT_0 THEN
	  		state[0] := 740;
	  	ELSIF state[0] = 631 & GD_OUT_1 THEN
	  		state[0] := 747;
	  	ELSIF state[0] = 632 & GD_OUT_0 THEN
	  		state[0] := 741;
	  	ELSIF state[0] = 632 & GD_OUT_1 THEN
	  		state[0] := 748;
	  	ELSIF state[0] = 634 & GD_OUT_0 THEN
	  		state[0] := 78;
	  	ELSIF state[0] = 634 & GD_OUT_1 THEN
	  		state[0] := 752;
	  	ELSIF state[0] = 635 & GD_OUT_0 THEN
	  		state[0] := 79;
	  	ELSIF state[0] = 635 & GD_OUT_1 THEN
	  		state[0] := 753;
	  	ELSIF state[0] = 636 & GD_OUT_1 THEN
	  		state[0] := 752;
	  	ELSIF state[0] = 637 & GD_OUT_1 THEN
	  		state[0] := 753;
	  	ELSIF state[0] = 646 & GD_OUT_0 THEN
	  		state[0] := 104;
	  	ELSIF state[0] = 646 & GD_OUT_1 THEN
	  		state[0] := 772;
	  	ELSIF state[0] = 647 & GD_OUT_1 THEN
	  		state[0] := 772;
	  	ELSIF state[0] = 651 & GD_OUT_0 THEN
	  		state[0] := 112;
	  	ELSIF state[0] = 651 & GD_OUT_1 THEN
	  		state[0] := 778;
	  	ELSIF state[0] = 652 & GD_OUT_1 THEN
	  		state[0] := 778;
	  	ELSIF state[0] = 664 & GD_OUT_0 THEN
	  		state[0] := 786;
	  	ELSIF state[0] = 664 & GD_OUT_1 THEN
	  		state[0] := 746;
	  	ELSIF state[0] = 665 & GD_OUT_0 THEN
	  		state[0] := 787;
	  	ELSIF state[0] = 665 & GD_OUT_1 THEN
	  		state[0] := 747;
	  	ELSIF state[0] = 666 & GD_OUT_0 THEN
	  		state[0] := 788;
	  	ELSIF state[0] = 666 & GD_OUT_1 THEN
	  		state[0] := 748;
	  	ELSIF state[0] = 673 & GD_OUT_0 THEN
	  		state[0] := 793;
	  	ELSIF state[0] = 673 & GD_OUT_1 THEN
	  		state[0] := 795;
	  	ELSIF state[0] = 676 & GD_OUT_0 THEN
	  		state[0] := 798;
	  	ELSIF state[0] = 676 & GD_OUT_1 THEN
	  		state[0] := 795;
	  	ELSIF state[0] = 682 & GD_OUT_0 THEN
	  		state[0] := 802;
	  	ELSIF state[0] = 682 & GD_OUT_1 THEN
	  		state[0] := 804;
	  	ELSIF state[0] = 685 & GD_OUT_0 THEN
	  		state[0] := 807;
	  	ELSIF state[0] = 685 & GD_OUT_1 THEN
	  		state[0] := 804;
	  	ELSIF state[0] = 691 & GD_OUT_0 THEN
	  		state[0] := 810;
	  	ELSIF state[0] = 691 & GD_OUT_1 THEN
	  		state[0] := 812;
	  	ELSIF state[0] = 694 & GD_OUT_0 THEN
	  		state[0] := 814;
	  	ELSIF state[0] = 694 & GD_OUT_1 THEN
	  		state[0] := 812;
	  	ELSIF state[0] = 707 & GD_OUT_1 THEN
	  		state[0] := 820;
	  	ELSIF state[0] = 708 & GD_OUT_1 THEN
	  		state[0] := 821;
	  	ELSIF state[0] = 709 & GD_OUT_1 THEN
	  		state[0] := 822;
	  	ELSIF state[0] = 710 & GD_OUT_0 THEN
	  		state[0] := 142;
	  	ELSIF state[0] = 710 & GD_OUT_1 THEN
	  		state[0] := 820;
	  	ELSIF state[0] = 711 & GD_OUT_0 THEN
	  		state[0] := 143;
	  	ELSIF state[0] = 711 & GD_OUT_1 THEN
	  		state[0] := 821;
	  	ELSIF state[0] = 712 & GD_OUT_0 THEN
	  		state[0] := 144;
	  	ELSIF state[0] = 712 & GD_OUT_1 THEN
	  		state[0] := 822;
	  	ELSIF state[0] = 721 & GD_OUT_1 THEN
	  		state[0] := 843;
	  	ELSIF state[0] = 722 & GD_OUT_0 THEN
	  		state[0] := 164;
	  	ELSIF state[0] = 722 & GD_OUT_1 THEN
	  		state[0] := 843;
	  	ELSIF state[0] = 726 & GD_OUT_1 THEN
	  		state[0] := 849;
	  	ELSIF state[0] = 727 & GD_OUT_0 THEN
	  		state[0] := 174;
	  	ELSIF state[0] = 727 & GD_OUT_1 THEN
	  		state[0] := 849;
	  	ELSIF state[0] = 732 & GD_OUT_1 THEN
	  		state[0] := 854;
	  	ELSIF state[0] = 733 & GD_OUT_0 THEN
	  		state[0] := 183;
	  	ELSIF state[0] = 733 & GD_OUT_1 THEN
	  		state[0] := 854;
	  	ELSIF state[0] = 749 & GD_OUT_0 THEN
	  		state[0] := 861;
	  	ELSIF state[0] = 749 & GD_OUT_1 THEN
	  		state[0] := 866;
	  	ELSIF state[0] = 750 & GD_OUT_0 THEN
	  		state[0] := 862;
	  	ELSIF state[0] = 750 & GD_OUT_1 THEN
	  		state[0] := 867;
	  	ELSIF state[0] = 754 & GD_OUT_0 THEN
	  		state[0] := 127;
	  	ELSIF state[0] = 754 & GD_OUT_1 THEN
	  		state[0] := 871;
	  	ELSIF state[0] = 755 & GD_OUT_0 THEN
	  		state[0] := 128;
	  	ELSIF state[0] = 755 & GD_OUT_1 THEN
	  		state[0] := 872;
	  	ELSIF state[0] = 756 & GD_OUT_0 THEN
	  		state[0] := 129;
	  	ELSIF state[0] = 756 & GD_OUT_1 THEN
	  		state[0] := 873;
	  	ELSIF state[0] = 757 & GD_OUT_1 THEN
	  		state[0] := 871;
	  	ELSIF state[0] = 758 & GD_OUT_1 THEN
	  		state[0] := 872;
	  	ELSIF state[0] = 759 & GD_OUT_1 THEN
	  		state[0] := 873;
	  	ELSIF state[0] = 768 & GD_OUT_0 THEN
	  		state[0] := 161;
	  	ELSIF state[0] = 768 & GD_OUT_1 THEN
	  		state[0] := 894;
	  	ELSIF state[0] = 769 & GD_OUT_1 THEN
	  		state[0] := 894;
	  	ELSIF state[0] = 773 & GD_OUT_0 THEN
	  		state[0] := 169;
	  	ELSIF state[0] = 773 & GD_OUT_1 THEN
	  		state[0] := 900;
	  	ELSIF state[0] = 774 & GD_OUT_1 THEN
	  		state[0] := 900;
	  	ELSIF state[0] = 779 & GD_OUT_0 THEN
	  		state[0] := 178;
	  	ELSIF state[0] = 779 & GD_OUT_1 THEN
	  		state[0] := 905;
	  	ELSIF state[0] = 780 & GD_OUT_1 THEN
	  		state[0] := 905;
	  	ELSIF state[0] = 789 & GD_OUT_0 THEN
	  		state[0] := 912;
	  	ELSIF state[0] = 789 & GD_OUT_1 THEN
	  		state[0] := 866;
	  	ELSIF state[0] = 790 & GD_OUT_0 THEN
	  		state[0] := 913;
	  	ELSIF state[0] = 790 & GD_OUT_1 THEN
	  		state[0] := 867;
	  	ELSIF state[0] = 796 & GD_OUT_0 THEN
	  		state[0] := 916;
	  	ELSIF state[0] = 796 & GD_OUT_1 THEN
	  		state[0] := 918;
	  	ELSIF state[0] = 799 & GD_OUT_0 THEN
	  		state[0] := 921;
	  	ELSIF state[0] = 799 & GD_OUT_1 THEN
	  		state[0] := 918;
	  	ELSIF state[0] = 805 & GD_OUT_0 THEN
	  		state[0] := 924;
	  	ELSIF state[0] = 805 & GD_OUT_1 THEN
	  		state[0] := 926;
	  	ELSIF state[0] = 808 & GD_OUT_0 THEN
	  		state[0] := 928;
	  	ELSIF state[0] = 808 & GD_OUT_1 THEN
	  		state[0] := 926;
	  	ELSIF state[0] = 823 & GD_OUT_1 THEN
	  		state[0] := 935;
	  	ELSIF state[0] = 824 & GD_OUT_1 THEN
	  		state[0] := 936;
	  	ELSIF state[0] = 825 & GD_OUT_1 THEN
	  		state[0] := 937;
	  	ELSIF state[0] = 826 & GD_OUT_1 THEN
	  		state[0] := 938;
	  	ELSIF state[0] = 827 & GD_OUT_0 THEN
	  		state[0] := 215;
	  	ELSIF state[0] = 827 & GD_OUT_1 THEN
	  		state[0] := 935;
	  	ELSIF state[0] = 828 & GD_OUT_0 THEN
	  		state[0] := 216;
	  	ELSIF state[0] = 828 & GD_OUT_1 THEN
	  		state[0] := 936;
	  	ELSIF state[0] = 829 & GD_OUT_0 THEN
	  		state[0] := 217;
	  	ELSIF state[0] = 829 & GD_OUT_1 THEN
	  		state[0] := 937;
	  	ELSIF state[0] = 830 & GD_OUT_0 THEN
	  		state[0] := 218;
	  	ELSIF state[0] = 830 & GD_OUT_1 THEN
	  		state[0] := 938;
	  	ELSIF state[0] = 839 & GD_OUT_1 THEN
	  		state[0] := 961;
	  	ELSIF state[0] = 840 & GD_OUT_0 THEN
	  		state[0] := 239;
	  	ELSIF state[0] = 840 & GD_OUT_1 THEN
	  		state[0] := 961;
	  	ELSIF state[0] = 844 & GD_OUT_1 THEN
	  		state[0] := 967;
	  	ELSIF state[0] = 845 & GD_OUT_0 THEN
	  		state[0] := 249;
	  	ELSIF state[0] = 845 & GD_OUT_1 THEN
	  		state[0] := 967;
	  	ELSIF state[0] = 850 & GD_OUT_1 THEN
	  		state[0] := 972;
	  	ELSIF state[0] = 851 & GD_OUT_0 THEN
	  		state[0] := 258;
	  	ELSIF state[0] = 851 & GD_OUT_1 THEN
	  		state[0] := 972;
	  	ELSIF state[0] = 855 & GD_OUT_1 THEN
	  		state[0] := 977;
	  	ELSIF state[0] = 856 & GD_OUT_0 THEN
	  		state[0] := 267;
	  	ELSIF state[0] = 856 & GD_OUT_1 THEN
	  		state[0] := 977;
	  	ELSIF state[0] = 868 & GD_OUT_0 THEN
	  		state[0] := 983;
	  	ELSIF state[0] = 868 & GD_OUT_1 THEN
	  		state[0] := 986;
	  	ELSIF state[0] = 874 & GD_OUT_0 THEN
	  		state[0] := 194;
	  	ELSIF state[0] = 874 & GD_OUT_1 THEN
	  		state[0] := 990;
	  	ELSIF state[0] = 875 & GD_OUT_0 THEN
	  		state[0] := 195;
	  	ELSIF state[0] = 875 & GD_OUT_1 THEN
	  		state[0] := 991;
	  	ELSIF state[0] = 876 & GD_OUT_0 THEN
	  		state[0] := 196;
	  	ELSIF state[0] = 876 & GD_OUT_1 THEN
	  		state[0] := 992;
	  	ELSIF state[0] = 877 & GD_OUT_0 THEN
	  		state[0] := 197;
	  	ELSIF state[0] = 877 & GD_OUT_1 THEN
	  		state[0] := 993;
	  	ELSIF state[0] = 878 & GD_OUT_1 THEN
	  		state[0] := 990;
	  	ELSIF state[0] = 879 & GD_OUT_1 THEN
	  		state[0] := 991;
	  	ELSIF state[0] = 880 & GD_OUT_1 THEN
	  		state[0] := 992;
	  	ELSIF state[0] = 881 & GD_OUT_1 THEN
	  		state[0] := 993;
	  	ELSIF state[0] = 890 & GD_OUT_0 THEN
	  		state[0] := 236;
	  	ELSIF state[0] = 890 & GD_OUT_1 THEN
	  		state[0] := 1016;
	  	ELSIF state[0] = 891 & GD_OUT_1 THEN
	  		state[0] := 1016;
	  	ELSIF state[0] = 895 & GD_OUT_0 THEN
	  		state[0] := 244;
	  	ELSIF state[0] = 895 & GD_OUT_1 THEN
	  		state[0] := 1022;
	  	ELSIF state[0] = 896 & GD_OUT_1 THEN
	  		state[0] := 1022;
	  	ELSIF state[0] = 901 & GD_OUT_0 THEN
	  		state[0] := 253;
	  	ELSIF state[0] = 901 & GD_OUT_1 THEN
	  		state[0] := 1027;
	  	ELSIF state[0] = 902 & GD_OUT_1 THEN
	  		state[0] := 1027;
	  	ELSIF state[0] = 906 & GD_OUT_0 THEN
	  		state[0] := 262;
	  	ELSIF state[0] = 906 & GD_OUT_1 THEN
	  		state[0] := 1032;
	  	ELSIF state[0] = 907 & GD_OUT_1 THEN
	  		state[0] := 1032;
	  	ELSIF state[0] = 914 & GD_OUT_0 THEN
	  		state[0] := 1038;
	  	ELSIF state[0] = 914 & GD_OUT_1 THEN
	  		state[0] := 986;
	  	ELSIF state[0] = 919 & GD_OUT_0 THEN
	  		state[0] := 1040;
	  	ELSIF state[0] = 919 & GD_OUT_1 THEN
	  		state[0] := 1042;
	  	ELSIF state[0] = 922 & GD_OUT_0 THEN
	  		state[0] := 1044;
	  	ELSIF state[0] = 922 & GD_OUT_1 THEN
	  		state[0] := 1042;
	  	ELSIF state[0] = 939 & GD_OUT_1 THEN
	  		state[0] := 1052;
	  	ELSIF state[0] = 940 & GD_OUT_1 THEN
	  		state[0] := 1053;
	  	ELSIF state[0] = 941 & GD_OUT_1 THEN
	  		state[0] := 1054;
	  	ELSIF state[0] = 942 & GD_OUT_1 THEN
	  		state[0] := 1055;
	  	ELSIF state[0] = 943 & GD_OUT_1 THEN
	  		state[0] := 1056;
	  	ELSIF state[0] = 944 & GD_OUT_0 THEN
	  		state[0] := 306;
	  	ELSIF state[0] = 944 & GD_OUT_1 THEN
	  		state[0] := 1052;
	  	ELSIF state[0] = 945 & GD_OUT_0 THEN
	  		state[0] := 307;
	  	ELSIF state[0] = 945 & GD_OUT_1 THEN
	  		state[0] := 1053;
	  	ELSIF state[0] = 946 & GD_OUT_0 THEN
	  		state[0] := 308;
	  	ELSIF state[0] = 946 & GD_OUT_1 THEN
	  		state[0] := 1054;
	  	ELSIF state[0] = 947 & GD_OUT_0 THEN
	  		state[0] := 309;
	  	ELSIF state[0] = 947 & GD_OUT_1 THEN
	  		state[0] := 1055;
	  	ELSIF state[0] = 948 & GD_OUT_0 THEN
	  		state[0] := 310;
	  	ELSIF state[0] = 948 & GD_OUT_1 THEN
	  		state[0] := 1056;
	  	ELSIF state[0] = 957 & GD_OUT_1 THEN
	  		state[0] := 1078;
	  	ELSIF state[0] = 958 & GD_OUT_0 THEN
	  		state[0] := 329;
	  	ELSIF state[0] = 958 & GD_OUT_1 THEN
	  		state[0] := 1078;
	  	ELSIF state[0] = 962 & GD_OUT_1 THEN
	  		state[0] := 1084;
	  	ELSIF state[0] = 963 & GD_OUT_0 THEN
	  		state[0] := 339;
	  	ELSIF state[0] = 963 & GD_OUT_1 THEN
	  		state[0] := 1084;
	  	ELSIF state[0] = 968 & GD_OUT_1 THEN
	  		state[0] := 1089;
	  	ELSIF state[0] = 969 & GD_OUT_0 THEN
	  		state[0] := 348;
	  	ELSIF state[0] = 969 & GD_OUT_1 THEN
	  		state[0] := 1089;
	  	ELSIF state[0] = 973 & GD_OUT_1 THEN
	  		state[0] := 1094;
	  	ELSIF state[0] = 974 & GD_OUT_0 THEN
	  		state[0] := 357;
	  	ELSIF state[0] = 974 & GD_OUT_1 THEN
	  		state[0] := 1094;
	  	ELSIF state[0] = 978 & GD_OUT_1 THEN
	  		state[0] := 1099;
	  	ELSIF state[0] = 979 & GD_OUT_0 THEN
	  		state[0] := 366;
	  	ELSIF state[0] = 979 & GD_OUT_1 THEN
	  		state[0] := 1099;
	  	ELSIF state[0] = 994 & GD_OUT_0 THEN
	  		state[0] := 279;
	  	ELSIF state[0] = 994 & GD_OUT_1 THEN
	  		state[0] := 1108;
	  	ELSIF state[0] = 995 & GD_OUT_0 THEN
	  		state[0] := 280;
	  	ELSIF state[0] = 995 & GD_OUT_1 THEN
	  		state[0] := 1109;
	  	ELSIF state[0] = 996 & GD_OUT_0 THEN
	  		state[0] := 281;
	  	ELSIF state[0] = 996 & GD_OUT_1 THEN
	  		state[0] := 1110;
	  	ELSIF state[0] = 997 & GD_OUT_0 THEN
	  		state[0] := 282;
	  	ELSIF state[0] = 997 & GD_OUT_1 THEN
	  		state[0] := 1111;
	  	ELSIF state[0] = 998 & GD_OUT_0 THEN
	  		state[0] := 283;
	  	ELSIF state[0] = 998 & GD_OUT_1 THEN
	  		state[0] := 1112;
	  	ELSIF state[0] = 999 & GD_OUT_1 THEN
	  		state[0] := 1108;
	  	ELSIF state[0] = 1000 & GD_OUT_1 THEN
	  		state[0] := 1109;
	  	ELSIF state[0] = 1001 & GD_OUT_1 THEN
	  		state[0] := 1110;
	  	ELSIF state[0] = 1002 & GD_OUT_1 THEN
	  		state[0] := 1111;
	  	ELSIF state[0] = 1003 & GD_OUT_1 THEN
	  		state[0] := 1112;
	  	ELSIF state[0] = 1012 & GD_OUT_0 THEN
	  		state[0] := 326;
	  	ELSIF state[0] = 1012 & GD_OUT_1 THEN
	  		state[0] := 1134;
	  	ELSIF state[0] = 1013 & GD_OUT_1 THEN
	  		state[0] := 1134;
	  	ELSIF state[0] = 1017 & GD_OUT_0 THEN
	  		state[0] := 334;
	  	ELSIF state[0] = 1017 & GD_OUT_1 THEN
	  		state[0] := 1140;
	  	ELSIF state[0] = 1018 & GD_OUT_1 THEN
	  		state[0] := 1140;
	  	ELSIF state[0] = 1023 & GD_OUT_0 THEN
	  		state[0] := 343;
	  	ELSIF state[0] = 1023 & GD_OUT_1 THEN
	  		state[0] := 1145;
	  	ELSIF state[0] = 1024 & GD_OUT_1 THEN
	  		state[0] := 1145;
	  	ELSIF state[0] = 1028 & GD_OUT_0 THEN
	  		state[0] := 352;
	  	ELSIF state[0] = 1028 & GD_OUT_1 THEN
	  		state[0] := 1150;
	  	ELSIF state[0] = 1029 & GD_OUT_1 THEN
	  		state[0] := 1150;
	  	ELSIF state[0] = 1033 & GD_OUT_0 THEN
	  		state[0] := 361;
	  	ELSIF state[0] = 1033 & GD_OUT_1 THEN
	  		state[0] := 1155;
	  	ELSIF state[0] = 1034 & GD_OUT_1 THEN
	  		state[0] := 1155;
	  	ELSIF state[0] = 1057 & GD_OUT_1 THEN
	  		state[0] := 1167;
	  	ELSIF state[0] = 1058 & GD_OUT_1 THEN
	  		state[0] := 1168;
	  	ELSIF state[0] = 1059 & GD_OUT_1 THEN
	  		state[0] := 1169;
	  	ELSIF state[0] = 1060 & GD_OUT_1 THEN
	  		state[0] := 1170;
	  	ELSIF state[0] = 1061 & GD_OUT_1 THEN
	  		state[0] := 1171;
	  	ELSIF state[0] = 1062 & GD_OUT_1 THEN
	  		state[0] := 1172;
	  	ELSIF state[0] = 1063 & GD_OUT_0 THEN
	  		state[0] := 413;
	  	ELSIF state[0] = 1063 & GD_OUT_1 THEN
	  		state[0] := 1167;
	  	ELSIF state[0] = 1064 & GD_OUT_0 THEN
	  		state[0] := 414;
	  	ELSIF state[0] = 1064 & GD_OUT_1 THEN
	  		state[0] := 1168;
	  	ELSIF state[0] = 1065 & GD_OUT_0 THEN
	  		state[0] := 415;
	  	ELSIF state[0] = 1065 & GD_OUT_1 THEN
	  		state[0] := 1169;
	  	ELSIF state[0] = 1066 & GD_OUT_0 THEN
	  		state[0] := 416;
	  	ELSIF state[0] = 1066 & GD_OUT_1 THEN
	  		state[0] := 1170;
	  	ELSIF state[0] = 1067 & GD_OUT_0 THEN
	  		state[0] := 417;
	  	ELSIF state[0] = 1067 & GD_OUT_1 THEN
	  		state[0] := 1171;
	  	ELSIF state[0] = 1068 & GD_OUT_0 THEN
	  		state[0] := 418;
	  	ELSIF state[0] = 1068 & GD_OUT_1 THEN
	  		state[0] := 1172;
	  	ELSIF state[0] = 1074 & GD_OUT_1 THEN
	  		state[0] := 1187;
	  	ELSIF state[0] = 1075 & GD_OUT_0 THEN
	  		state[0] := 431;
	  	ELSIF state[0] = 1075 & GD_OUT_1 THEN
	  		state[0] := 1187;
	  	ELSIF state[0] = 1079 & GD_OUT_1 THEN
	  		state[0] := 1193;
	  	ELSIF state[0] = 1080 & GD_OUT_0 THEN
	  		state[0] := 441;
	  	ELSIF state[0] = 1080 & GD_OUT_1 THEN
	  		state[0] := 1193;
	  	ELSIF state[0] = 1085 & GD_OUT_1 THEN
	  		state[0] := 1198;
	  	ELSIF state[0] = 1086 & GD_OUT_0 THEN
	  		state[0] := 450;
	  	ELSIF state[0] = 1086 & GD_OUT_1 THEN
	  		state[0] := 1198;
	  	ELSIF state[0] = 1090 & GD_OUT_1 THEN
	  		state[0] := 1203;
	  	ELSIF state[0] = 1091 & GD_OUT_0 THEN
	  		state[0] := 459;
	  	ELSIF state[0] = 1091 & GD_OUT_1 THEN
	  		state[0] := 1203;
	  	ELSIF state[0] = 1095 & GD_OUT_1 THEN
	  		state[0] := 1208;
	  	ELSIF state[0] = 1096 & GD_OUT_0 THEN
	  		state[0] := 468;
	  	ELSIF state[0] = 1096 & GD_OUT_1 THEN
	  		state[0] := 1208;
	  	ELSIF state[0] = 1100 & GD_OUT_1 THEN
	  		state[0] := 1212;
	  	ELSIF state[0] = 1101 & GD_OUT_0 THEN
	  		state[0] := 475;
	  	ELSIF state[0] = 1101 & GD_OUT_1 THEN
	  		state[0] := 1212;
	  	ELSIF state[0] = 1113 & GD_OUT_0 THEN
	  		state[0] := 380;
	  	ELSIF state[0] = 1113 & GD_OUT_1 THEN
	  		state[0] := 1218;
	  	ELSIF state[0] = 1114 & GD_OUT_0 THEN
	  		state[0] := 381;
	  	ELSIF state[0] = 1114 & GD_OUT_1 THEN
	  		state[0] := 1219;
	  	ELSIF state[0] = 1115 & GD_OUT_0 THEN
	  		state[0] := 382;
	  	ELSIF state[0] = 1115 & GD_OUT_1 THEN
	  		state[0] := 1220;
	  	ELSIF state[0] = 1116 & GD_OUT_0 THEN
	  		state[0] := 383;
	  	ELSIF state[0] = 1116 & GD_OUT_1 THEN
	  		state[0] := 1221;
	  	ELSIF state[0] = 1117 & GD_OUT_0 THEN
	  		state[0] := 384;
	  	ELSIF state[0] = 1117 & GD_OUT_1 THEN
	  		state[0] := 1222;
	  	ELSIF state[0] = 1118 & GD_OUT_0 THEN
	  		state[0] := 385;
	  	ELSIF state[0] = 1118 & GD_OUT_1 THEN
	  		state[0] := 1223;
	  	ELSIF state[0] = 1119 & GD_OUT_1 THEN
	  		state[0] := 1218;
	  	ELSIF state[0] = 1120 & GD_OUT_1 THEN
	  		state[0] := 1219;
	  	ELSIF state[0] = 1121 & GD_OUT_1 THEN
	  		state[0] := 1220;
	  	ELSIF state[0] = 1122 & GD_OUT_1 THEN
	  		state[0] := 1221;
	  	ELSIF state[0] = 1123 & GD_OUT_1 THEN
	  		state[0] := 1222;
	  	ELSIF state[0] = 1124 & GD_OUT_1 THEN
	  		state[0] := 1223;
	  	ELSIF state[0] = 1130 & GD_OUT_0 THEN
	  		state[0] := 428;
	  	ELSIF state[0] = 1130 & GD_OUT_1 THEN
	  		state[0] := 1238;
	  	ELSIF state[0] = 1131 & GD_OUT_1 THEN
	  		state[0] := 1238;
	  	ELSIF state[0] = 1135 & GD_OUT_0 THEN
	  		state[0] := 436;
	  	ELSIF state[0] = 1135 & GD_OUT_1 THEN
	  		state[0] := 1244;
	  	ELSIF state[0] = 1136 & GD_OUT_1 THEN
	  		state[0] := 1244;
	  	ELSIF state[0] = 1141 & GD_OUT_0 THEN
	  		state[0] := 445;
	  	ELSIF state[0] = 1141 & GD_OUT_1 THEN
	  		state[0] := 1249;
	  	ELSIF state[0] = 1142 & GD_OUT_1 THEN
	  		state[0] := 1249;
	  	ELSIF state[0] = 1146 & GD_OUT_0 THEN
	  		state[0] := 454;
	  	ELSIF state[0] = 1146 & GD_OUT_1 THEN
	  		state[0] := 1254;
	  	ELSIF state[0] = 1147 & GD_OUT_1 THEN
	  		state[0] := 1254;
	  	ELSIF state[0] = 1151 & GD_OUT_0 THEN
	  		state[0] := 463;
	  	ELSIF state[0] = 1151 & GD_OUT_1 THEN
	  		state[0] := 1259;
	  	ELSIF state[0] = 1152 & GD_OUT_1 THEN
	  		state[0] := 1259;
	  	ELSIF state[0] = 1156 & GD_OUT_0 THEN
	  		state[0] := 471;
	  	ELSIF state[0] = 1156 & GD_OUT_1 THEN
	  		state[0] := 1263;
	  	ELSIF state[0] = 1157 & GD_OUT_1 THEN
	  		state[0] := 1263;
	  	ELSIF state[0] = 1173 & GD_OUT_1 THEN
	  		state[0] := 1270;
	  	ELSIF state[0] = 1174 & GD_OUT_1 THEN
	  		state[0] := 1271;
	  	ELSIF state[0] = 1175 & GD_OUT_1 THEN
	  		state[0] := 1272;
	  	ELSIF state[0] = 1176 & GD_OUT_1 THEN
	  		state[0] := 1273;
	  	ELSIF state[0] = 1177 & GD_OUT_1 THEN
	  		state[0] := 1274;
	  	ELSIF state[0] = 1178 & GD_OUT_0 THEN
	  		state[0] := 534;
	  	ELSIF state[0] = 1178 & GD_OUT_1 THEN
	  		state[0] := 1270;
	  	ELSIF state[0] = 1179 & GD_OUT_0 THEN
	  		state[0] := 535;
	  	ELSIF state[0] = 1179 & GD_OUT_1 THEN
	  		state[0] := 1271;
	  	ELSIF state[0] = 1180 & GD_OUT_0 THEN
	  		state[0] := 536;
	  	ELSIF state[0] = 1180 & GD_OUT_1 THEN
	  		state[0] := 1272;
	  	ELSIF state[0] = 1181 & GD_OUT_0 THEN
	  		state[0] := 537;
	  	ELSIF state[0] = 1181 & GD_OUT_1 THEN
	  		state[0] := 1273;
	  	ELSIF state[0] = 1182 & GD_OUT_0 THEN
	  		state[0] := 538;
	  	ELSIF state[0] = 1182 & GD_OUT_1 THEN
	  		state[0] := 1274;
	  	ELSIF state[0] = 1188 & GD_OUT_1 THEN
	  		state[0] := 1287;
	  	ELSIF state[0] = 1189 & GD_OUT_0 THEN
	  		state[0] := 552;
	  	ELSIF state[0] = 1189 & GD_OUT_1 THEN
	  		state[0] := 1287;
	  	ELSIF state[0] = 1194 & GD_OUT_1 THEN
	  		state[0] := 1292;
	  	ELSIF state[0] = 1195 & GD_OUT_0 THEN
	  		state[0] := 561;
	  	ELSIF state[0] = 1195 & GD_OUT_1 THEN
	  		state[0] := 1292;
	  	ELSIF state[0] = 1199 & GD_OUT_1 THEN
	  		state[0] := 1297;
	  	ELSIF state[0] = 1200 & GD_OUT_0 THEN
	  		state[0] := 570;
	  	ELSIF state[0] = 1200 & GD_OUT_1 THEN
	  		state[0] := 1297;
	  	ELSIF state[0] = 1204 & GD_OUT_1 THEN
	  		state[0] := 1302;
	  	ELSIF state[0] = 1205 & GD_OUT_0 THEN
	  		state[0] := 579;
	  	ELSIF state[0] = 1205 & GD_OUT_1 THEN
	  		state[0] := 1302;
	  	ELSIF state[0] = 1209 & GD_OUT_1 THEN
	  		state[0] := 1306;
	  	ELSIF state[0] = 1210 & GD_OUT_0 THEN
	  		state[0] := 586;
	  	ELSIF state[0] = 1210 & GD_OUT_1 THEN
	  		state[0] := 1306;
	  	ELSIF state[0] = 1224 & GD_OUT_0 THEN
	  		state[0] := 495;
	  	ELSIF state[0] = 1224 & GD_OUT_1 THEN
	  		state[0] := 1314;
	  	ELSIF state[0] = 1225 & GD_OUT_0 THEN
	  		state[0] := 496;
	  	ELSIF state[0] = 1225 & GD_OUT_1 THEN
	  		state[0] := 1315;
	  	ELSIF state[0] = 1226 & GD_OUT_0 THEN
	  		state[0] := 497;
	  	ELSIF state[0] = 1226 & GD_OUT_1 THEN
	  		state[0] := 1316;
	  	ELSIF state[0] = 1227 & GD_OUT_0 THEN
	  		state[0] := 498;
	  	ELSIF state[0] = 1227 & GD_OUT_1 THEN
	  		state[0] := 1317;
	  	ELSIF state[0] = 1228 & GD_OUT_0 THEN
	  		state[0] := 499;
	  	ELSIF state[0] = 1228 & GD_OUT_1 THEN
	  		state[0] := 1318;
	  	ELSIF state[0] = 1229 & GD_OUT_1 THEN
	  		state[0] := 1314;
	  	ELSIF state[0] = 1230 & GD_OUT_1 THEN
	  		state[0] := 1315;
	  	ELSIF state[0] = 1231 & GD_OUT_1 THEN
	  		state[0] := 1316;
	  	ELSIF state[0] = 1232 & GD_OUT_1 THEN
	  		state[0] := 1317;
	  	ELSIF state[0] = 1233 & GD_OUT_1 THEN
	  		state[0] := 1318;
	  	ELSIF state[0] = 1239 & GD_OUT_0 THEN
	  		state[0] := 547;
	  	ELSIF state[0] = 1239 & GD_OUT_1 THEN
	  		state[0] := 1331;
	  	ELSIF state[0] = 1240 & GD_OUT_1 THEN
	  		state[0] := 1331;
	  	ELSIF state[0] = 1245 & GD_OUT_0 THEN
	  		state[0] := 556;
	  	ELSIF state[0] = 1245 & GD_OUT_1 THEN
	  		state[0] := 1336;
	  	ELSIF state[0] = 1246 & GD_OUT_1 THEN
	  		state[0] := 1336;
	  	ELSIF state[0] = 1250 & GD_OUT_0 THEN
	  		state[0] := 565;
	  	ELSIF state[0] = 1250 & GD_OUT_1 THEN
	  		state[0] := 1341;
	  	ELSIF state[0] = 1251 & GD_OUT_1 THEN
	  		state[0] := 1341;
	  	ELSIF state[0] = 1255 & GD_OUT_0 THEN
	  		state[0] := 574;
	  	ELSIF state[0] = 1255 & GD_OUT_1 THEN
	  		state[0] := 1346;
	  	ELSIF state[0] = 1256 & GD_OUT_1 THEN
	  		state[0] := 1346;
	  	ELSIF state[0] = 1260 & GD_OUT_0 THEN
	  		state[0] := 582;
	  	ELSIF state[0] = 1260 & GD_OUT_1 THEN
	  		state[0] := 1350;
	  	ELSIF state[0] = 1261 & GD_OUT_1 THEN
	  		state[0] := 1350;
	  	ELSIF state[0] = 1275 & GD_OUT_1 THEN
	  		state[0] := 1357;
	  	ELSIF state[0] = 1276 & GD_OUT_1 THEN
	  		state[0] := 1358;
	  	ELSIF state[0] = 1277 & GD_OUT_1 THEN
	  		state[0] := 1359;
	  	ELSIF state[0] = 1278 & GD_OUT_1 THEN
	  		state[0] := 1360;
	  	ELSIF state[0] = 1279 & GD_OUT_0 THEN
	  		state[0] := 660;
	  	ELSIF state[0] = 1279 & GD_OUT_1 THEN
	  		state[0] := 1357;
	  	ELSIF state[0] = 1280 & GD_OUT_0 THEN
	  		state[0] := 661;
	  	ELSIF state[0] = 1280 & GD_OUT_1 THEN
	  		state[0] := 1358;
	  	ELSIF state[0] = 1281 & GD_OUT_0 THEN
	  		state[0] := 662;
	  	ELSIF state[0] = 1281 & GD_OUT_1 THEN
	  		state[0] := 1359;
	  	ELSIF state[0] = 1282 & GD_OUT_0 THEN
	  		state[0] := 663;
	  	ELSIF state[0] = 1282 & GD_OUT_1 THEN
	  		state[0] := 1360;
	  	ELSIF state[0] = 1288 & GD_OUT_1 THEN
	  		state[0] := 1370;
	  	ELSIF state[0] = 1289 & GD_OUT_0 THEN
	  		state[0] := 675;
	  	ELSIF state[0] = 1289 & GD_OUT_1 THEN
	  		state[0] := 1370;
	  	ELSIF state[0] = 1293 & GD_OUT_1 THEN
	  		state[0] := 1375;
	  	ELSIF state[0] = 1294 & GD_OUT_0 THEN
	  		state[0] := 684;
	  	ELSIF state[0] = 1294 & GD_OUT_1 THEN
	  		state[0] := 1375;
	  	ELSIF state[0] = 1298 & GD_OUT_1 THEN
	  		state[0] := 1380;
	  	ELSIF state[0] = 1299 & GD_OUT_0 THEN
	  		state[0] := 693;
	  	ELSIF state[0] = 1299 & GD_OUT_1 THEN
	  		state[0] := 1380;
	  	ELSIF state[0] = 1303 & GD_OUT_1 THEN
	  		state[0] := 1384;
	  	ELSIF state[0] = 1304 & GD_OUT_0 THEN
	  		state[0] := 700;
	  	ELSIF state[0] = 1304 & GD_OUT_1 THEN
	  		state[0] := 1384;
	  	ELSIF state[0] = 1319 & GD_OUT_0 THEN
	  		state[0] := 617;
	  	ELSIF state[0] = 1319 & GD_OUT_1 THEN
	  		state[0] := 1391;
	  	ELSIF state[0] = 1320 & GD_OUT_0 THEN
	  		state[0] := 618;
	  	ELSIF state[0] = 1320 & GD_OUT_1 THEN
	  		state[0] := 1392;
	  	ELSIF state[0] = 1321 & GD_OUT_0 THEN
	  		state[0] := 619;
	  	ELSIF state[0] = 1321 & GD_OUT_1 THEN
	  		state[0] := 1393;
	  	ELSIF state[0] = 1322 & GD_OUT_0 THEN
	  		state[0] := 620;
	  	ELSIF state[0] = 1322 & GD_OUT_1 THEN
	  		state[0] := 1394;
	  	ELSIF state[0] = 1323 & GD_OUT_1 THEN
	  		state[0] := 1391;
	  	ELSIF state[0] = 1324 & GD_OUT_1 THEN
	  		state[0] := 1392;
	  	ELSIF state[0] = 1325 & GD_OUT_1 THEN
	  		state[0] := 1393;
	  	ELSIF state[0] = 1326 & GD_OUT_1 THEN
	  		state[0] := 1394;
	  	ELSIF state[0] = 1332 & GD_OUT_0 THEN
	  		state[0] := 670;
	  	ELSIF state[0] = 1332 & GD_OUT_1 THEN
	  		state[0] := 1404;
	  	ELSIF state[0] = 1333 & GD_OUT_1 THEN
	  		state[0] := 1404;
	  	ELSIF state[0] = 1337 & GD_OUT_0 THEN
	  		state[0] := 679;
	  	ELSIF state[0] = 1337 & GD_OUT_1 THEN
	  		state[0] := 1409;
	  	ELSIF state[0] = 1338 & GD_OUT_1 THEN
	  		state[0] := 1409;
	  	ELSIF state[0] = 1342 & GD_OUT_0 THEN
	  		state[0] := 688;
	  	ELSIF state[0] = 1342 & GD_OUT_1 THEN
	  		state[0] := 1414;
	  	ELSIF state[0] = 1343 & GD_OUT_1 THEN
	  		state[0] := 1414;
	  	ELSIF state[0] = 1347 & GD_OUT_0 THEN
	  		state[0] := 696;
	  	ELSIF state[0] = 1347 & GD_OUT_1 THEN
	  		state[0] := 1418;
	  	ELSIF state[0] = 1348 & GD_OUT_1 THEN
	  		state[0] := 1418;
	  	ELSIF state[0] = 1361 & GD_OUT_1 THEN
	  		state[0] := 1424;
	  	ELSIF state[0] = 1362 & GD_OUT_1 THEN
	  		state[0] := 1425;
	  	ELSIF state[0] = 1363 & GD_OUT_1 THEN
	  		state[0] := 1426;
	  	ELSIF state[0] = 1364 & GD_OUT_0 THEN
	  		state[0] := 786;
	  	ELSIF state[0] = 1364 & GD_OUT_1 THEN
	  		state[0] := 1424;
	  	ELSIF state[0] = 1365 & GD_OUT_0 THEN
	  		state[0] := 787;
	  	ELSIF state[0] = 1365 & GD_OUT_1 THEN
	  		state[0] := 1425;
	  	ELSIF state[0] = 1366 & GD_OUT_0 THEN
	  		state[0] := 788;
	  	ELSIF state[0] = 1366 & GD_OUT_1 THEN
	  		state[0] := 1426;
	  	ELSIF state[0] = 1371 & GD_OUT_1 THEN
	  		state[0] := 1433;
	  	ELSIF state[0] = 1372 & GD_OUT_0 THEN
	  		state[0] := 798;
	  	ELSIF state[0] = 1372 & GD_OUT_1 THEN
	  		state[0] := 1433;
	  	ELSIF state[0] = 1376 & GD_OUT_1 THEN
	  		state[0] := 1438;
	  	ELSIF state[0] = 1377 & GD_OUT_0 THEN
	  		state[0] := 807;
	  	ELSIF state[0] = 1377 & GD_OUT_1 THEN
	  		state[0] := 1438;
	  	ELSIF state[0] = 1381 & GD_OUT_1 THEN
	  		state[0] := 1442;
	  	ELSIF state[0] = 1382 & GD_OUT_0 THEN
	  		state[0] := 814;
	  	ELSIF state[0] = 1382 & GD_OUT_1 THEN
	  		state[0] := 1442;
	  	ELSIF state[0] = 1395 & GD_OUT_0 THEN
	  		state[0] := 739;
	  	ELSIF state[0] = 1395 & GD_OUT_1 THEN
	  		state[0] := 1448;
	  	ELSIF state[0] = 1396 & GD_OUT_0 THEN
	  		state[0] := 740;
	  	ELSIF state[0] = 1396 & GD_OUT_1 THEN
	  		state[0] := 1449;
	  	ELSIF state[0] = 1397 & GD_OUT_0 THEN
	  		state[0] := 741;
	  	ELSIF state[0] = 1397 & GD_OUT_1 THEN
	  		state[0] := 1450;
	  	ELSIF state[0] = 1398 & GD_OUT_1 THEN
	  		state[0] := 1448;
	  	ELSIF state[0] = 1399 & GD_OUT_1 THEN
	  		state[0] := 1449;
	  	ELSIF state[0] = 1400 & GD_OUT_1 THEN
	  		state[0] := 1450;
	  	ELSIF state[0] = 1405 & GD_OUT_0 THEN
	  		state[0] := 793;
	  	ELSIF state[0] = 1405 & GD_OUT_1 THEN
	  		state[0] := 1457;
	  	ELSIF state[0] = 1406 & GD_OUT_1 THEN
	  		state[0] := 1457;
	  	ELSIF state[0] = 1410 & GD_OUT_0 THEN
	  		state[0] := 802;
	  	ELSIF state[0] = 1410 & GD_OUT_1 THEN
	  		state[0] := 1462;
	  	ELSIF state[0] = 1411 & GD_OUT_1 THEN
	  		state[0] := 1462;
	  	ELSIF state[0] = 1415 & GD_OUT_0 THEN
	  		state[0] := 810;
	  	ELSIF state[0] = 1415 & GD_OUT_1 THEN
	  		state[0] := 1466;
	  	ELSIF state[0] = 1416 & GD_OUT_1 THEN
	  		state[0] := 1466;
	  	ELSIF state[0] = 1427 & GD_OUT_1 THEN
	  		state[0] := 1471;
	  	ELSIF state[0] = 1428 & GD_OUT_1 THEN
	  		state[0] := 1472;
	  	ELSIF state[0] = 1429 & GD_OUT_0 THEN
	  		state[0] := 912;
	  	ELSIF state[0] = 1429 & GD_OUT_1 THEN
	  		state[0] := 1471;
	  	ELSIF state[0] = 1430 & GD_OUT_0 THEN
	  		state[0] := 913;
	  	ELSIF state[0] = 1430 & GD_OUT_1 THEN
	  		state[0] := 1472;
	  	ELSIF state[0] = 1434 & GD_OUT_1 THEN
	  		state[0] := 1476;
	  	ELSIF state[0] = 1435 & GD_OUT_0 THEN
	  		state[0] := 921;
	  	ELSIF state[0] = 1435 & GD_OUT_1 THEN
	  		state[0] := 1476;
	  	ELSIF state[0] = 1439 & GD_OUT_1 THEN
	  		state[0] := 1480;
	  	ELSIF state[0] = 1440 & GD_OUT_0 THEN
	  		state[0] := 928;
	  	ELSIF state[0] = 1440 & GD_OUT_1 THEN
	  		state[0] := 1480;
	  	ELSIF state[0] = 1451 & GD_OUT_0 THEN
	  		state[0] := 861;
	  	ELSIF state[0] = 1451 & GD_OUT_1 THEN
	  		state[0] := 1485;
	  	ELSIF state[0] = 1452 & GD_OUT_0 THEN
	  		state[0] := 862;
	  	ELSIF state[0] = 1452 & GD_OUT_1 THEN
	  		state[0] := 1486;
	  	ELSIF state[0] = 1453 & GD_OUT_1 THEN
	  		state[0] := 1485;
	  	ELSIF state[0] = 1454 & GD_OUT_1 THEN
	  		state[0] := 1486;
	  	ELSIF state[0] = 1458 & GD_OUT_0 THEN
	  		state[0] := 916;
	  	ELSIF state[0] = 1458 & GD_OUT_1 THEN
	  		state[0] := 1490;
	  	ELSIF state[0] = 1459 & GD_OUT_1 THEN
	  		state[0] := 1490;
	  	ELSIF state[0] = 1463 & GD_OUT_0 THEN
	  		state[0] := 924;
	  	ELSIF state[0] = 1463 & GD_OUT_1 THEN
	  		state[0] := 1494;
	  	ELSIF state[0] = 1464 & GD_OUT_1 THEN
	  		state[0] := 1494;
	  	ELSIF state[0] = 1473 & GD_OUT_1 THEN
	  		state[0] := 1498;
	  	ELSIF state[0] = 1474 & GD_OUT_0 THEN
	  		state[0] := 1038;
	  	ELSIF state[0] = 1474 & GD_OUT_1 THEN
	  		state[0] := 1498;
	  	ELSIF state[0] = 1477 & GD_OUT_1 THEN
	  		state[0] := 1500;
	  	ELSIF state[0] = 1478 & GD_OUT_0 THEN
	  		state[0] := 1044;
	  	ELSIF state[0] = 1478 & GD_OUT_1 THEN
	  		state[0] := 1500;
	  	ELSIF state[0] = 1487 & GD_OUT_0 THEN
	  		state[0] := 983;
	  	ELSIF state[0] = 1487 & GD_OUT_1 THEN
	  		state[0] := 1504;
	  	ELSIF state[0] = 1488 & GD_OUT_1 THEN
	  		state[0] := 1504;
	  	ELSIF state[0] = 1491 & GD_OUT_0 THEN
	  		state[0] := 1040;
	  	ELSIF state[0] = 1491 & GD_OUT_1 THEN
	  		state[0] := 1506;
	  	ELSIF state[0] = 1492 & GD_OUT_1 THEN
	  		state[0] := 1506;
	  	END_IF;
	
		IF state[1] = 0 & GD_OUT_6 THEN
	  		state[1] := 1;
	  	ELSIF state[1] = 1 & NOT GD_OUT_6 THEN
	  		state[1] := 0;
	  	END_IF;
	
		IF state[2] = 0 & GD_OUT_7 THEN
	  		state[2] := 1;
	  	ELSIF state[2] = 1 & NOT GD_OUT_7 THEN
	  		state[2] := 0;
	  	END_IF;
	
		IF state[3] = 0 & GD_OUT_8 THEN
	  		state[3] := 1;
	  	ELSIF state[3] = 1 & NOT GD_OUT_8 THEN
	  		state[3] := 0;
	  	END_IF;
	
		IF state[4] = 0 & GD_OUT_9 THEN
	  		state[4] := 1;
	  	ELSIF state[4] = 1 & NOT GD_OUT_9 THEN
	  		state[4] := 0;
	  	END_IF;
	
		IF state[5] = 0 & GD_OUT_10 THEN
	  		state[5] := 1;
	  	ELSIF state[5] = 1 & NOT GD_OUT_10 THEN
	  		state[5] := 0;
	  	END_IF;
	
		IF state[6] = 0 & GD_OUT_11 THEN
	  		state[6] := 1;
	  	ELSIF state[6] = 1 & NOT GD_OUT_11 THEN
	  		state[6] := 0;
	  	END_IF;
	
	END_IF;
END_PROGRAM

CONFIGURATION Config0

	RESOURCE Res0 ON PLC
		TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
		PROGRAM instance0 WITH task0 : tesis0;
	END_RESOURCE
END_CONFIGURATION