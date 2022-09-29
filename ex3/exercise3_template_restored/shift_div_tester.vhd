LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY shift_div_tester IS
	PORT
	(
		-- Input ports
		SW     : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

		-- Output ports
		LEDR   : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		LEDG   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

	);
END shift_div_tester;
ARCHITECTURE shift_div_tester_impl OF shift_div_tester IS
BEGIN

	uut : ENTITY work.shift_div PORT MAP
		(
			A => SW(7 downto 0),
			a_shl => LEDG(7 downto 0),
			a_shr => LEDR(7 downto 0),
			a_ror => LEDR(17 downto 10)
			
		);


END shift_div_tester_impl;