LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY guess_game_tester IS
	PORT
	(
		-- Input ports
		SW     : IN STD_LOGIC_VECTOR(3	 DOWNTO 0);

		-- Output ports
		HEX0   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)

	);
END guess_game_tester;

ARCHITECTURE guess_game_tester_impl OF guess_game_tester IS
BEGIN

--	uut : ENTITY work.guess_game 
--	PORT MAP
--		(
--			bin => SW(3 downto 0),
--			seg => HEX0(6 downto 0)
--			
--		);


END guess_game_tester_impl;