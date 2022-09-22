library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity four_bit_adder is

	generic
	(
		DATA_WIDTH : natural := 4
	);

	port 
	(
		a	   : in STD_LOGIC_VECTOR ((DATA_WIDTH-1) downto 0);
		b	   : in STD_LOGIC_VECTOR ((DATA_WIDTH-1) downto 0);
		cin	: in STD_LOGIC;
		result: out STD_LOGIC_VECTOR ((DATA_WIDTH-1) downto 0);
		cout	: out STD_LOGIC
	);
end entity;

architecture unsigned_impl_w_carry of four_bit_adder is

begin

	
end unsigned_impl_w_carry;