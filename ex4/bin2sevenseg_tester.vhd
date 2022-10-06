LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY bin2sevenseg_tester IS
	PORT
	(
		-- Input ports
		SW     : IN STD_LOGIC_VECTOR(3	 DOWNTO 0);

		-- Output ports
		HEX0   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)

	);
END bin2sevenseg_tester;

ARCHITECTURE bin2sevenseg_tester_impl OF bin2sevenseg_tester IS
BEGIN

	uut : ENTITY work.bin2sevenseg 
	PORT MAP
		(
			bin => SW(3 downto 0),
			Sseg => HEX0(6 downto 0)
			
		);


END bin2sevenseg_tester_impl;