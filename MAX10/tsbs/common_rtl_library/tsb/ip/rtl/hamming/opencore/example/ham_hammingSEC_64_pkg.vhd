LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE hamm_package_64bit IS
	SUBTYPE parity_ham_64bit IS std_logic_vector(6 DOWNTO 0);
	SUBTYPE data_ham_64bit IS std_logic_vector(63 DOWNTO 0);
	SUBTYPE coded_ham_64bit IS std_logic_vector(70 DOWNTO 0);

	FUNCTION hamming_encoder_64bit(data_in:data_ham_64bit) RETURN parity_ham_64bit;
	FUNCTION hamming_decoder_64bit(data_parity_in:coded_ham_64bit) RETURN data_ham_64bit;
END hamm_package_64bit;

PACKAGE BODY hamm_package_64bit IS

---------------------
-- HAMMING ENCODER --
---------------------
FUNCTION hamming_encoder_64bit(data_in:data_ham_64bit) RETURN parity_ham_64bit  IS
	VARIABLE parity: parity_ham_64bit;
BEGIN

	parity(0)	:=	data_in(0) XOR data_in(1) XOR data_in(3) XOR data_in(4) XOR data_in(6) XOR 
					data_in(8) XOR data_in(10) XOR data_in(11) XOR data_in(13) XOR data_in(15) XOR 
					data_in(17) XOR data_in(19) XOR data_in(21) XOR data_in(23) XOR data_in(25) XOR 
					data_in(26) XOR data_in(28) XOR data_in(30) XOR data_in(32) XOR data_in(34) XOR 
					data_in(36) XOR data_in(38) XOR data_in(40) XOR data_in(42) XOR data_in(44) XOR 
					data_in(46) XOR data_in(48) XOR data_in(50) XOR data_in(52) XOR data_in(54) XOR 
					data_in(56) XOR data_in(57) XOR data_in(59) XOR data_in(61) XOR data_in(63);
	parity(1)	:=	data_in(0) XOR data_in(2) XOR data_in(3) XOR data_in(5) XOR data_in(6) XOR 
					data_in(9) XOR data_in(10) XOR data_in(12) XOR data_in(13) XOR data_in(16) XOR 
					data_in(17) XOR data_in(20) XOR data_in(21) XOR data_in(24) XOR data_in(25) XOR 
					data_in(27) XOR data_in(28) XOR data_in(31) XOR data_in(32) XOR data_in(35) XOR 
					data_in(36) XOR data_in(39) XOR data_in(40) XOR data_in(43) XOR data_in(44) XOR 
					data_in(47) XOR data_in(48) XOR data_in(51) XOR data_in(52) XOR data_in(55) XOR 
					data_in(56) XOR data_in(58) XOR data_in(59) XOR data_in(62) XOR data_in(63);
	parity(2)	:=	data_in(1) XOR data_in(2) XOR data_in(3) XOR data_in(7) XOR data_in(8) XOR 
					data_in(9) XOR data_in(10) XOR data_in(14) XOR data_in(15) XOR data_in(16) XOR 
					data_in(17) XOR data_in(22) XOR data_in(23) XOR data_in(24) XOR data_in(25) XOR 
					data_in(29) XOR data_in(30) XOR data_in(31) XOR data_in(32) XOR data_in(37) XOR 
					data_in(38) XOR data_in(39) XOR data_in(40) XOR data_in(45) XOR data_in(46) XOR 
					data_in(47) XOR data_in(48) XOR data_in(53) XOR data_in(54) XOR data_in(55) XOR 
					data_in(56) XOR data_in(60) XOR data_in(61) XOR data_in(62) XOR data_in(63);
	parity(3)	:=	data_in(4) XOR data_in(5) XOR data_in(6) XOR data_in(7) XOR data_in(8) XOR 
					data_in(9) XOR data_in(10) XOR data_in(18) XOR data_in(19) XOR data_in(20) XOR 
					data_in(21) XOR data_in(22) XOR data_in(23) XOR data_in(24) XOR data_in(25) XOR 
					data_in(33) XOR data_in(34) XOR data_in(35) XOR data_in(36) XOR data_in(37) XOR 
					data_in(38) XOR data_in(39) XOR data_in(40) XOR data_in(49) XOR data_in(50) XOR 
					data_in(51) XOR data_in(52) XOR data_in(53) XOR data_in(54) XOR data_in(55) XOR 
					data_in(56);
	parity(4)	:=	data_in(11) XOR data_in(12) XOR data_in(13) XOR data_in(14) XOR data_in(15) XOR 
					data_in(16) XOR data_in(17) XOR data_in(18) XOR data_in(19) XOR data_in(20) XOR 
					data_in(21) XOR data_in(22) XOR data_in(23) XOR data_in(24) XOR data_in(25) XOR 
					data_in(41) XOR data_in(42) XOR data_in(43) XOR data_in(44) XOR data_in(45) XOR 
					data_in(46) XOR data_in(47) XOR data_in(48) XOR data_in(49) XOR data_in(50) XOR 
					data_in(51) XOR data_in(52) XOR data_in(53) XOR data_in(54) XOR data_in(55) XOR 
					data_in(56);
	parity(5)	:=	data_in(26) XOR data_in(27) XOR data_in(28) XOR data_in(29) XOR data_in(30) XOR 
					data_in(31) XOR data_in(32) XOR data_in(33) XOR data_in(34) XOR data_in(35) XOR 
					data_in(36) XOR data_in(37) XOR data_in(38) XOR data_in(39) XOR data_in(40) XOR 
					data_in(41) XOR data_in(42) XOR data_in(43) XOR data_in(44) XOR data_in(45) XOR 
					data_in(46) XOR data_in(47) XOR data_in(48) XOR data_in(49) XOR data_in(50) XOR 
					data_in(51) XOR data_in(52) XOR data_in(53) XOR data_in(54) XOR data_in(55) XOR 
					data_in(56);
	parity(6)	:=	data_in(57) XOR data_in(58) XOR data_in(59) XOR data_in(60) XOR data_in(61) XOR 
					data_in(62) XOR data_in(63);

	RETURN parity;
END;

---------------------
-- HAMMING DECODER --
---------------------
FUNCTION hamming_decoder_64bit(data_parity_in:coded_ham_64bit) RETURN data_ham_64bit IS
	VARIABLE coded       : coded_ham_64bit;
	VARIABLE mask        : coded_ham_64bit;
	VARIABLE parity      : parity_ham_64bit;
	VARIABLE parity_in   : parity_ham_64bit;
	VARIABLE syn         : parity_ham_64bit;
	VARIABLE data_in     : data_ham_64bit;
	VARIABLE decoded     : data_ham_64bit;
BEGIN

	data_in   := data_parity_in(70 DOWNTO 7);
	parity_in := data_parity_in(6 DOWNTO 0);

	parity(0)	:=	data_in(0) XOR data_in(1) XOR data_in(3) XOR data_in(4) XOR data_in(6) XOR 
					data_in(8) XOR data_in(10) XOR data_in(11) XOR data_in(13) XOR data_in(15) XOR 
					data_in(17) XOR data_in(19) XOR data_in(21) XOR data_in(23) XOR data_in(25) XOR 
					data_in(26) XOR data_in(28) XOR data_in(30) XOR data_in(32) XOR data_in(34) XOR 
					data_in(36) XOR data_in(38) XOR data_in(40) XOR data_in(42) XOR data_in(44) XOR 
					data_in(46) XOR data_in(48) XOR data_in(50) XOR data_in(52) XOR data_in(54) XOR 
					data_in(56) XOR data_in(57) XOR data_in(59) XOR data_in(61) XOR data_in(63);
	parity(1)	:=	data_in(0) XOR data_in(2) XOR data_in(3) XOR data_in(5) XOR data_in(6) XOR 
					data_in(9) XOR data_in(10) XOR data_in(12) XOR data_in(13) XOR data_in(16) XOR 
					data_in(17) XOR data_in(20) XOR data_in(21) XOR data_in(24) XOR data_in(25) XOR 
					data_in(27) XOR data_in(28) XOR data_in(31) XOR data_in(32) XOR data_in(35) XOR 
					data_in(36) XOR data_in(39) XOR data_in(40) XOR data_in(43) XOR data_in(44) XOR 
					data_in(47) XOR data_in(48) XOR data_in(51) XOR data_in(52) XOR data_in(55) XOR 
					data_in(56) XOR data_in(58) XOR data_in(59) XOR data_in(62) XOR data_in(63);
	parity(2)	:=	data_in(1) XOR data_in(2) XOR data_in(3) XOR data_in(7) XOR data_in(8) XOR 
					data_in(9) XOR data_in(10) XOR data_in(14) XOR data_in(15) XOR data_in(16) XOR 
					data_in(17) XOR data_in(22) XOR data_in(23) XOR data_in(24) XOR data_in(25) XOR 
					data_in(29) XOR data_in(30) XOR data_in(31) XOR data_in(32) XOR data_in(37) XOR 
					data_in(38) XOR data_in(39) XOR data_in(40) XOR data_in(45) XOR data_in(46) XOR 
					data_in(47) XOR data_in(48) XOR data_in(53) XOR data_in(54) XOR data_in(55) XOR 
					data_in(56) XOR data_in(60) XOR data_in(61) XOR data_in(62) XOR data_in(63);
	parity(3)	:=	data_in(4) XOR data_in(5) XOR data_in(6) XOR data_in(7) XOR data_in(8) XOR 
					data_in(9) XOR data_in(10) XOR data_in(18) XOR data_in(19) XOR data_in(20) XOR 
					data_in(21) XOR data_in(22) XOR data_in(23) XOR data_in(24) XOR data_in(25) XOR 
					data_in(33) XOR data_in(34) XOR data_in(35) XOR data_in(36) XOR data_in(37) XOR 
					data_in(38) XOR data_in(39) XOR data_in(40) XOR data_in(49) XOR data_in(50) XOR 
					data_in(51) XOR data_in(52) XOR data_in(53) XOR data_in(54) XOR data_in(55) XOR 
					data_in(56);
	parity(4)	:=	data_in(11) XOR data_in(12) XOR data_in(13) XOR data_in(14) XOR data_in(15) XOR 
					data_in(16) XOR data_in(17) XOR data_in(18) XOR data_in(19) XOR data_in(20) XOR 
					data_in(21) XOR data_in(22) XOR data_in(23) XOR data_in(24) XOR data_in(25) XOR 
					data_in(41) XOR data_in(42) XOR data_in(43) XOR data_in(44) XOR data_in(45) XOR 
					data_in(46) XOR data_in(47) XOR data_in(48) XOR data_in(49) XOR data_in(50) XOR 
					data_in(51) XOR data_in(52) XOR data_in(53) XOR data_in(54) XOR data_in(55) XOR 
					data_in(56);
	parity(5)	:=	data_in(26) XOR data_in(27) XOR data_in(28) XOR data_in(29) XOR data_in(30) XOR 
					data_in(31) XOR data_in(32) XOR data_in(33) XOR data_in(34) XOR data_in(35) XOR 
					data_in(36) XOR data_in(37) XOR data_in(38) XOR data_in(39) XOR data_in(40) XOR 
					data_in(41) XOR data_in(42) XOR data_in(43) XOR data_in(44) XOR data_in(45) XOR 
					data_in(46) XOR data_in(47) XOR data_in(48) XOR data_in(49) XOR data_in(50) XOR 
					data_in(51) XOR data_in(52) XOR data_in(53) XOR data_in(54) XOR data_in(55) XOR 
					data_in(56);
	parity(6)	:=	data_in(57) XOR data_in(58) XOR data_in(59) XOR data_in(60) XOR data_in(61) XOR 
					data_in(62) XOR data_in(63);
	coded(0)	:=	data_parity_in(0);
	coded(1)	:=	data_parity_in(1);
	coded(3)	:=	data_parity_in(2);
	coded(7)	:=	data_parity_in(3);
	coded(15)	:=	data_parity_in(4);
	coded(31)	:=	data_parity_in(5);
	coded(63)	:=	data_parity_in(6);
	coded(2)	:=	data_parity_in(7);
	coded(4)	:=	data_parity_in(8);
	coded(5)	:=	data_parity_in(9);
	coded(6)	:=	data_parity_in(10);
	coded(8)	:=	data_parity_in(11);
	coded(9)	:=	data_parity_in(12);
	coded(10)	:=	data_parity_in(13);
	coded(11)	:=	data_parity_in(14);
	coded(12)	:=	data_parity_in(15);
	coded(13)	:=	data_parity_in(16);
	coded(14)	:=	data_parity_in(17);
	coded(16)	:=	data_parity_in(18);
	coded(17)	:=	data_parity_in(19);
	coded(18)	:=	data_parity_in(20);
	coded(19)	:=	data_parity_in(21);
	coded(20)	:=	data_parity_in(22);
	coded(21)	:=	data_parity_in(23);
	coded(22)	:=	data_parity_in(24);
	coded(23)	:=	data_parity_in(25);
	coded(24)	:=	data_parity_in(26);
	coded(25)	:=	data_parity_in(27);
	coded(26)	:=	data_parity_in(28);
	coded(27)	:=	data_parity_in(29);
	coded(28)	:=	data_parity_in(30);
	coded(29)	:=	data_parity_in(31);
	coded(30)	:=	data_parity_in(32);
	coded(32)	:=	data_parity_in(33);
	coded(33)	:=	data_parity_in(34);
	coded(34)	:=	data_parity_in(35);
	coded(35)	:=	data_parity_in(36);
	coded(36)	:=	data_parity_in(37);
	coded(37)	:=	data_parity_in(38);
	coded(38)	:=	data_parity_in(39);
	coded(39)	:=	data_parity_in(40);
	coded(40)	:=	data_parity_in(41);
	coded(41)	:=	data_parity_in(42);
	coded(42)	:=	data_parity_in(43);
	coded(43)	:=	data_parity_in(44);
	coded(44)	:=	data_parity_in(45);
	coded(45)	:=	data_parity_in(46);
	coded(46)	:=	data_parity_in(47);
	coded(47)	:=	data_parity_in(48);
	coded(48)	:=	data_parity_in(49);
	coded(49)	:=	data_parity_in(50);
	coded(50)	:=	data_parity_in(51);
	coded(51)	:=	data_parity_in(52);
	coded(52)	:=	data_parity_in(53);
	coded(53)	:=	data_parity_in(54);
	coded(54)	:=	data_parity_in(55);
	coded(55)	:=	data_parity_in(56);
	coded(56)	:=	data_parity_in(57);
	coded(57)	:=	data_parity_in(58);
	coded(58)	:=	data_parity_in(59);
	coded(59)	:=	data_parity_in(60);
	coded(60)	:=	data_parity_in(61);
	coded(61)	:=	data_parity_in(62);
	coded(62)	:=	data_parity_in(63);
	coded(64)	:=	data_parity_in(64);
	coded(65)	:=	data_parity_in(65);
	coded(66)	:=	data_parity_in(66);
	coded(67)	:=	data_parity_in(67);
	coded(68)	:=	data_parity_in(68);
	coded(69)	:=	data_parity_in(69);
	coded(70)	:=	data_parity_in(70);

	-- syndorme generation
	syn := parity XOR parity_in;
	CASE syn IS
		WHEN "0000011" => mask := (2 => '1',others => '0');
		WHEN "0000101" => mask := (4 => '1',others => '0');
		WHEN "0000110" => mask := (5 => '1',others => '0');
		WHEN "0000111" => mask := (6 => '1',others => '0');
		WHEN "0001001" => mask := (8 => '1',others => '0');
		WHEN "0001010" => mask := (9 => '1',others => '0');
		WHEN "0001011" => mask := (10 => '1',others => '0');
		WHEN "0001100" => mask := (11 => '1',others => '0');
		WHEN "0001101" => mask := (12 => '1',others => '0');
		WHEN "0001110" => mask := (13 => '1',others => '0');
		WHEN "0001111" => mask := (14 => '1',others => '0');
		WHEN "0010001" => mask := (16 => '1',others => '0');
		WHEN "0010010" => mask := (17 => '1',others => '0');
		WHEN "0010011" => mask := (18 => '1',others => '0');
		WHEN "0010100" => mask := (19 => '1',others => '0');
		WHEN "0010101" => mask := (20 => '1',others => '0');
		WHEN "0010110" => mask := (21 => '1',others => '0');
		WHEN "0010111" => mask := (22 => '1',others => '0');
		WHEN "0011000" => mask := (23 => '1',others => '0');
		WHEN "0011001" => mask := (24 => '1',others => '0');
		WHEN "0011010" => mask := (25 => '1',others => '0');
		WHEN "0011011" => mask := (26 => '1',others => '0');
		WHEN "0011100" => mask := (27 => '1',others => '0');
		WHEN "0011101" => mask := (28 => '1',others => '0');
		WHEN "0011110" => mask := (29 => '1',others => '0');
		WHEN "0011111" => mask := (30 => '1',others => '0');
		WHEN "0100001" => mask := (32 => '1',others => '0');
		WHEN "0100010" => mask := (33 => '1',others => '0');
		WHEN "0100011" => mask := (34 => '1',others => '0');
		WHEN "0100100" => mask := (35 => '1',others => '0');
		WHEN "0100101" => mask := (36 => '1',others => '0');
		WHEN "0100110" => mask := (37 => '1',others => '0');
		WHEN "0100111" => mask := (38 => '1',others => '0');
		WHEN "0101000" => mask := (39 => '1',others => '0');
		WHEN "0101001" => mask := (40 => '1',others => '0');
		WHEN "0101010" => mask := (41 => '1',others => '0');
		WHEN "0101011" => mask := (42 => '1',others => '0');
		WHEN "0101100" => mask := (43 => '1',others => '0');
		WHEN "0101101" => mask := (44 => '1',others => '0');
		WHEN "0101110" => mask := (45 => '1',others => '0');
		WHEN "0101111" => mask := (46 => '1',others => '0');
		WHEN "0110000" => mask := (47 => '1',others => '0');
		WHEN "0110001" => mask := (48 => '1',others => '0');
		WHEN "0110010" => mask := (49 => '1',others => '0');
		WHEN "0110011" => mask := (50 => '1',others => '0');
		WHEN "0110100" => mask := (51 => '1',others => '0');
		WHEN "0110101" => mask := (52 => '1',others => '0');
		WHEN "0110110" => mask := (53 => '1',others => '0');
		WHEN "0110111" => mask := (54 => '1',others => '0');
		WHEN "0111000" => mask := (55 => '1',others => '0');
		WHEN "0111001" => mask := (56 => '1',others => '0');
		WHEN "0111010" => mask := (57 => '1',others => '0');
		WHEN "0111011" => mask := (58 => '1',others => '0');
		WHEN "0111100" => mask := (59 => '1',others => '0');
		WHEN "0111101" => mask := (60 => '1',others => '0');
		WHEN "0111110" => mask := (61 => '1',others => '0');
		WHEN "0111111" => mask := (62 => '1',others => '0');
		WHEN "1000001" => mask := (64 => '1',others => '0');
		WHEN "1000010" => mask := (65 => '1',others => '0');
		WHEN "1000011" => mask := (66 => '1',others => '0');
		WHEN "1000100" => mask := (67 => '1',others => '0');
		WHEN "1000101" => mask := (68 => '1',others => '0');
		WHEN "1000110" => mask := (69 => '1',others => '0');
		WHEN "1000111" => mask := (70 => '1',others => '0');
		WHEN OTHERS =>  mask := (others => '0');
	END CASE;

	coded := coded XOR mask;

	decoded(0)	:=	coded(2);
	decoded(1)	:=	coded(4);
	decoded(2)	:=	coded(5);
	decoded(3)	:=	coded(6);
	decoded(4)	:=	coded(8);
	decoded(5)	:=	coded(9);
	decoded(6)	:=	coded(10);
	decoded(7)	:=	coded(11);
	decoded(8)	:=	coded(12);
	decoded(9)	:=	coded(13);
	decoded(10)	:=	coded(14);
	decoded(11)	:=	coded(16);
	decoded(12)	:=	coded(17);
	decoded(13)	:=	coded(18);
	decoded(14)	:=	coded(19);
	decoded(15)	:=	coded(20);
	decoded(16)	:=	coded(21);
	decoded(17)	:=	coded(22);
	decoded(18)	:=	coded(23);
	decoded(19)	:=	coded(24);
	decoded(20)	:=	coded(25);
	decoded(21)	:=	coded(26);
	decoded(22)	:=	coded(27);
	decoded(23)	:=	coded(28);
	decoded(24)	:=	coded(29);
	decoded(25)	:=	coded(30);
	decoded(26)	:=	coded(32);
	decoded(27)	:=	coded(33);
	decoded(28)	:=	coded(34);
	decoded(29)	:=	coded(35);
	decoded(30)	:=	coded(36);
	decoded(31)	:=	coded(37);
	decoded(32)	:=	coded(38);
	decoded(33)	:=	coded(39);
	decoded(34)	:=	coded(40);
	decoded(35)	:=	coded(41);
	decoded(36)	:=	coded(42);
	decoded(37)	:=	coded(43);
	decoded(38)	:=	coded(44);
	decoded(39)	:=	coded(45);
	decoded(40)	:=	coded(46);
	decoded(41)	:=	coded(47);
	decoded(42)	:=	coded(48);
	decoded(43)	:=	coded(49);
	decoded(44)	:=	coded(50);
	decoded(45)	:=	coded(51);
	decoded(46)	:=	coded(52);
	decoded(47)	:=	coded(53);
	decoded(48)	:=	coded(54);
	decoded(49)	:=	coded(55);
	decoded(50)	:=	coded(56);
	decoded(51)	:=	coded(57);
	decoded(52)	:=	coded(58);
	decoded(53)	:=	coded(59);
	decoded(54)	:=	coded(60);
	decoded(55)	:=	coded(61);
	decoded(56)	:=	coded(62);
	decoded(57)	:=	coded(64);
	decoded(58)	:=	coded(65);
	decoded(59)	:=	coded(66);
	decoded(60)	:=	coded(67);
	decoded(61)	:=	coded(68);
	decoded(62)	:=	coded(69);
	decoded(63)	:=	coded(70);
	RETURN decoded;
END;
END PACKAGE BODY;
