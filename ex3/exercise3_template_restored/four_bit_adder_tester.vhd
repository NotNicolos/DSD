LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY four_bit_adder_tester IS
	PORT
	(
		-- Input ports
		SW   : IN STD_LOGIC_VECTOR(8 DOWNTO 1);

		-- Output ports
		LEDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

	);
END four_bit_adder_tester;
ARCHITECTURE four_bit_adder_tester_impl OF four_bit_adder_tester IS
BEGIN

	uut : ENTITY work.four_bit_adder_simple(unsigned_impl) PORT MAP
		(
			A => SW(4 downto 1),
			B => SW(8 downto 5), 
			Sum => LEDR(3 downto 0)
		);
--	uut2 : ENTITY work.four_bit_adder_simple(signed_impl) PORT MAP
--		(
--			A => SW(4 downto 1),
--			B => SW(8 downto 5), 
--			Sum => LEDR(3 downto 0)
--		);

END four_bit_adder_tester_impl;