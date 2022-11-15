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

architecture two_player_guess_game_impl of two_player_guess_game is
	signal mux2display	: std_logic_vector(13 downto 0);
	signal bin2player		: std_logic_vector(6 downto 0);
	
	signal p1show	: std_logic;
	signal p1input	: std_logic_vector(7 downto 0);
	signal p1set	: std_logic;
	signal p1try	: std_logic;
	signal p2show	: std_logic;
	signal p2input	: std_logic_vector(7 downto 0);
	signal p2set	: std_logic;
	signal p2try	: std_logic;
	
	signal p1seg2mux	: std_logic_vector(13 downto 0);
	signal p2seg2mux	: std_logic_vector(13 downto 0);
	
	
	signal player2bin: std_logic_vector(2 downto 0):="000";

	
 BEGIN
 
 demux: ENTITY work.demux
PORT MAP
(
	player => player,
	show => show,
	input => input,
	set => set,
	try => try,
	
	show1 => p1show,
	set1 => p1set,
	try1 => p1try,
	input1 => p1input,
	
	show2 => p2show,
	set2 => p2set,
	try2 => p2try,
	input2 => p2input
);

game1: ENTITY work.guess_game
PORT MAP
(
	show => p1show,
	set => p1set,
	try => p1try,
	input => p1input,
	hex1 => p1seg2mux(6 downto 0),
	hex10 => p1seg2mux(13 downto 7)
);

game2: ENTITY work.guess_game
PORT MAP
(
	show => p2show,
	set => p2set,
	try => p2try,
	input => p2input,
	hex1 => p2seg2mux(6 downto 0),
	hex10 => p2seg2mux(13 downto 7)
);

bin2hex1: ENTITY work.bin2hex
PORT MAP
(
	bin => player2bin&player,
	seg(6 downto 0) => hex_p
);

mux: ENTITY work.mux
PORT MAP
(
	seg1 => p1seg2mux, 
	seg2 => p2seg2mux,
	hex => mux2display,
	player => player

);

hex10<= mux2display(13 downto 7);
hex1<= mux2display(6 downto 0);



end two_player_guess_game_impl;
