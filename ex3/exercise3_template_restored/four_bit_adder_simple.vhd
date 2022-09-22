LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY four_bit_adder_simple IS

	GENERIC -- mulig anvendelse af "generic"
	(
		DATA_WIDTH : NATURAL := 4
	);

	PORT
	(
		a   : IN STD_LOGIC_VECTOR ((DATA_WIDTH - 1) DOWNTO 0);
		b   : IN STD_LOGIC_VECTOR ((DATA_WIDTH - 1) DOWNTO 0);
		Cin : IN STD_LOGIC;
		sum : OUT STD_LOGIC_VECTOR ((DATA_WIDTH - 1) DOWNTO 0);
		Cout: OUT STD_LOGIC
	);

END ENTITY;

ARCHITECTURE unsigned_impl OF four_bit_adder_simple IS
	signal sum_temp : std_LOGIC_VECTOR(4 downto 0); 
	constant zeroVevtor : std_LOGIC_VECTOR (3 downto 0) := "0000";
BEGIN
	sum_temp <= STD_LOGIC_VECTOR(resize(unsigned(a),5) + resize(unsigned(b),5) + unsigned(zeroVevtor & cin));
	sum <= sum_temp(3 downto 0);
	Cout <= sum_temp(4);
END unsigned_impl;
--ARCHITECTURE signed_impl OF four_bit_adder_simple IS
--	signal sum_temp : std_LOGIC_VECTOR(4 downto 0); 
--	constant zeroVevtor : std_LOGIC_VECTOR (3 downto 0) := "0000";
--BEGIN
--	sum_temp <= STD_LOGIC_VECTOR(resize(signed(a),5) + resize(signed(b),5) + signed(zeroVevtor & cin));
--	sum <= sum_temp(3 downto 0);
--	Cout <= sum_temp(4);
--END signed_impl;