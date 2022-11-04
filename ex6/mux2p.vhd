LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity demux is
port (
			show : in std_logic;
			set: in std_logic;
			try: in std_logic;
			input : in std_logic_vector(7 downto 0);
			player : in std_logic;
			
			show1 : out std_logic;
			set1: out std_logic;
			try1: out std_logic;
			input1 : out std_logic_vector(7 downto 0);
			
			show2 : out std_logic;
			set2: out std_logic;
			try2: out std_logic;
			input2 : out std_logic_vector(7 downto 0)

);
end;


architecture demux_impl OF demux is
BEGIN
	demuxer : PROCESS(show, set, input,try)
	BEGIN
		
		-- show = 1 fwd input -- show = 0 fwd secret_value
		if player = '0' then
			show1 <= show;
			set1 <= set;
			try1 <= try;
			input1 <= input;
		else
			show2 <= show;
			set2 <= set;
			try2 <= try;
			input2 <= input;
		END if;
	END PROCESS demuxer;
END demux_impl;




LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux is
port (
			player : in std_logic;
			seg1 : in std_logic_vector(13 downto 0);
			seg2 : in std_logic_vector(13 downto 0);
			hex: out std_logic_vector(13 downto 0)

);
end;


architecture mux_impl OF mux is
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
elsif compare = "10" then
		hex <= "00010011101111";
	elsif compare = "01" then
		hex <= "10001110100011";
	elsif compare = "00" then
		hex <= "01111110111111";
	else
		hex <= input;
end if;	

		
	END PROCESS muxer;
END mux_impl;



