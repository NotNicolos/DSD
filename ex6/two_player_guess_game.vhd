LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;


entity two_player_guess_game is
port(
	input : in std_logic_vector(7 downto 0);
	set : in std_logic; -- Set predefined value
	show : in std_logic; -- Show predefined value
	try : in std_logic; -- Evaluate guess
	player : in std_logic;
	
	hex1 : out std_logic_vector(6 downto 0); -- 7-seg ones
	hex10: out std_logic_vector(6 downto 0); -- 7-seg tens
	hex_p: out std_logic_vector(6 downto 0) -- player hex
);
end;