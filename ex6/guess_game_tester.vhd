LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY guess_game_tester IS
	PORT
	(
		-- Input ports
		SW		: IN STD_LOGIC_VECTOR(7	 DOWNTO 0); -- input
		KEY	: IN STD_LOGIC_VECTOR(4 DOWNTO 0); -- set 
		
		-- Output ports
		HEX0	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);-- 1'ere
		HEX1	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- 10'ere
		LEDG  : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END guess_game_tester;

ARCHITECTURE guess_game_tester_impl OF guess_game_tester IS
BEGIN
LEDG(0) <= KEY(0);
LEDG(1) <= KEY(1);
LEDG(2) <= KEY(2);
	uut : ENTITY work.guess_game 
	PORT MAP
		(
			input => SW(7 downto 0),
			set   => KEY(0),
			show  => KEY(1),
			try   => KEY(2),
			
			hex1  => HEX0(6 downto 0),
			hex10 => HEX1(6 downto 0)
			
		);


END guess_game_tester_impl;