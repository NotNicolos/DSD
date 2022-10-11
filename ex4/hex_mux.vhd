LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity hex_mux is
port (
			bin : in std_logic_vector(11 downto 0);
			sel : in std_logic_vector(1 downto 0);
			tsseg: out std_logic_vector(20 downto 0)

);
end;


architecture hex_mux_impl OF hex_mux is
signal Number: std_logic_vector (20 downto 0);
BEGIN

	

	h1: ENTITY work.bin2sevenseg
	PORT MAP
	(
		bin => bin(3 downto 0),
		Sseg => Number(6 downto 0)
	);
	h2: ENTITY work.bin2sevenseg
	PORT MAP
	(
		bin => bin(7 downto 4),
		Sseg => Number(13 downto 7)
	);
	h3: ENTITY work.bin2sevenseg
	PORT MAP
	(
		bin => bin(11 downto 8),
		Sseg => Number(20 downto 14)
	);
	
	with sel select tsseg <=
			"000011001011110101111" when "01",-- E = 0000110  -- r = 0101111
			--"1111001" when "0001",
			"100000010010001111111" when "11",--ON
			number when "10", -- switch output
			"010100101001010010101" when others; -- test data for kompilere
		
		
END hex_mux_impl;
