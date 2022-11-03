LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;


entity guess_game is
port(
input : in std_logic_vector(7 downto 0);
set : in std_logic; -- Set predefined value
show : in std_logic; -- Show predefined value
try : in std_logic; -- Evaluate guess
hex1 : out std_logic_vector(6 downto 0); -- 7-seg ones
hex10: out std_logic_vector(6 downto 0) -- 7-seg tens
);
end;

architecture guess_game_impl OF guess_game is

	signal secret_value  : std_logic_vector(7 downto 0);
	signal mux2display	: std_logic_vector(13 downto 0);
	signal compareSignal	: std_logic_vector(13 downto 0);
	signal mux1display	: std_logic_vector(13 downto 0);
	signal mux12bin		: std_logic_vector(13 downto 0);
	signal bin2mux			: std_logic_vector(13 downto 0);
	
BEGIN

mylatch: ENTITY work.mylatch
PORT MAP
(
	set => set,
	input => input,
	preDef => secret_value
);

compare_logic: ENTITY work.compare_logic
PORT MAP
(
	input => input,
	mylatch => secret_value,
	try => try,
	result => compareSignal	
);


mux1: ENTITY work.mux1
PORT MAP
(


	bin(3 downto 0) => mux1display(3 downto 0),
	bin(7 downto 4) => mux1display(7 downto 4),
	show => show,
	input => input,
	secret_value => secret_value
);


bin2hex1: ENTITY work.bin2hex
PORT MAP
(
	bin => mux1display(3 downto 0),
	seg(6 downto 0) => bin2mux(6 downto 0)
);

bin2hex2: ENTITY work.bin2hex
PORT MAP
(
	bin => mux1display(3 downto 0),
	seg(6 downto 0) => bin2mux(13 downto 7)
);


mux2: ENTITY work.mux2
PORT MAP
(
	input => bin2mux, 
	hex => mux2display,
	compare => compareSignal
);

hex10<= mux2display(13 downto 7);
hex1<= mux2display(6 downto 0);




	
END guess_game_impl;
