library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.gates_pack.all;

entity my_gates_tester is
	port(
		-- Input ports
		SW : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		LEDR : out	STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
end my_gates_tester;


architecture my_gates_tester_impli of my_gates_tester is 
begin
	my_and_out(SW(0),SW(1),LEDR(0));
	my_or(SW(0),SW(1),LEDR(1));
	LEDR(2) <= my_xor(SW(0),SW(1));
end my_gates_tester_impli;