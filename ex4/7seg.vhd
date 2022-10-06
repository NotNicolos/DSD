LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity bin2sevenseg is
port (
	bin : in std_logic_vector(3 downto 0);
	Sseg: out std_logic_vector(6 downto 0)
);
end;


architecture bin2sevenseg_impl OF bin2sevenseg is
BEGIN

with bin select Sseg <=  
			"1000000" when "0000",
			"1111001" when "0001",
			"1010000" when "0010",
			"0110000" when "0011",
			"0011100" when "0100",
			"0011000" when "0101",
			"0000011" when "0110",
			"1111000" when "0111",
			"1111111" when "1000",
			"0011111" when "1001",
			"0111110" when others;
			
		
END bin2sevenseg_impl;
