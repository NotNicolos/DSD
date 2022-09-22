library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_tester is
	port
	(
		-- Input ports
		SW	: in  STD_LOGIC_VECTOR(15 downto 0);
		
		-- Output ports
		LEDR	: out STD_LOGIC_VECTOR(15 downto 0)
		
	);
end multiplier_tester;


architecture multiplier_tester_impl of multiplier_tester is

	-- Declarations (optional)

begin

uut: entity work.mult(unsigned_mult) 
	port map (
	a => SW(7 downto 0),
	b => SW(15 downto 8),
	result => LEDR(15 downto 0)
);

	
end multiplier_tester_impl;