library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity my_gates is
	port(
		a : in std_logic;
		b : in std_logic;
		xor_out : out std_logic;
		or_out : out std_logic;
		and_out : out std_logic
	);
end my_gates;


architecture my_gates_impli of my_gates is 
-- Her begynder funktionen my_xor.
	function my_xor (a, b : std_logic) return std_logic is 
		begin	
			-- returner værdien af beregningen.
			return  (a xor b);
	end function  my_xor;
	-- Procedure body for and gate procedure
	procedure my_and_out (a, b : in std_logic; signal and_out : out std_logic)is
		begin
			-- returner værdien af beregningen.
		and_out <= (a and b);
	end my_and_out;
	-- Procedure body for or gate procedure
	procedure my_or (a, b : in std_logic; signal or_out : out std_logic)is
		begin
			-- returner værdien af beregningen.
		or_out <= (a or b);
	end my_or;
begin
	-- test af de to funktioner og proceduren
	my_and_out(a,b,and_out);
	my_or(a,b,or_out);
	xor_out <= my_xor(a,b);
end my_gates_impli;

