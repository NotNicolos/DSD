LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY bin2hex_tester IS
	PORT
	(
		-- Input ports
		SW     : IN STD_LOGIC_VECTOR(3	 DOWNTO 0);

		-- Output ports
		HEX0   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)

	);
END bin2hex_tester;

ARCHITECTURE bin2hex_tester_impl OF bin2hex_tester IS
BEGIN

	uut : ENTITY work.bin2hex 
	PORT MAP
		(
			bin => SW(3 downto 0),
			seg => HEX0(6 downto 0)
			
		);


END bin2hex_tester_impl;