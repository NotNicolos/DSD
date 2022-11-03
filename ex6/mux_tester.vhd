LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY hex_mux_tester IS
	PORT
	(
		-- Input ports
		SW     : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		KEY    : in STD_LOGIC_VECTOR(1 DOWNTO 0);

		-- Output ports
		HEX0   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX1   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX2   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)

	);
END hex_mux_tester;

ARCHITECTURE hex_mux_tester_impl OF hex_mux_tester IS
BEGIN

	uut : ENTITY work.hex_mux 
	PORT MAP
		(
			bin => SW(11 downto 0),
			sel => KEY(1 downto 0),

			tsseg(6 downto 0) => HEX0,
			tsseg(13 downto 7) => HEX1,
			tsseg(20 downto 14) => HEX2
		);


END hex_mux_tester_impl;