LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux1 is
port (
			show : in std_logic;
			secret_value : in std_logic_vector(7 downto 0);
			input : in std_logic_vector(7 downto 0);
			bin: out std_logic_vector(7 downto 0)

);
end;


architecture mux1_impl OF mux1 is
BEGIN
	muxer : PROCESS(show, secret_value, input)
	BEGIN
		
		-- show = 1 fwd input -- show = 0 fwd secret_value
		if show = '0' then
			bin <= secret_value;
		else
			bin <= input;
		END if;
	END PROCESS muxer;
END mux1_impl;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux2 is
port (
			compare : in std_logic_vector(1 downto 0);
			input : in std_logic_vector(13 downto 0);
			hex: out std_logic_vector(13 downto 0)

);
end;


architecture mux2_impl OF mux2 is
BEGIN
	muxer : PROCESS(compare, input)
	BEGIN

--"01" when ((inputs > mylatch) 
--"10" when ((inputs < mylatch)  
--"00" when ((inputs = mylatch)
-- Bit mønstre
-- H = "0001001"
-- i = "1101111"
-- L = "1000111"
-- o = "0100011"
-- "-" = "0111111"


if	compare = "11" then 
	hex <= input;
else
	if compare = "10" then
		hex <= "00010011101111";
	elsif compare = "01" then
		hex <= "10001110100011";
	elsif compare = "00" then
		hex <= "01111110111111";		
	end if;
end if;	

		
	END PROCESS muxer;
END mux2_impl;


