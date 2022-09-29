LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY multiplier_tester IS
	PORT
	(
		-- Input ports
		SW     : IN STD_LOGIC_VECTOR(15 DOWNTO 0);

		-- Output ports
		LEDR   : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)

	);
END multiplier_tester;

ARCHITECTURE multiplier_tester_impl OF multiplier_tester IS
BEGIN

	uut : ENTITY work.multiplier 
	PORT MAP
		(
			A => SW(7 downto 0),
			B => SW(15 downto 8),
			Prod => LEDR(15 downto 0)
			
		);


END multiplier_tester_impl;