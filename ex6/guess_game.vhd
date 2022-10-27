library ieee;
use ieee.std_logic_1164.all;






entity guess_game is
port(
inputs : in std_logic_vector(7 downto 0);
set : in std_logic; -- Set predefined value
show : in std_logic; -- Show predefined value
try : in std_logic; -- Evaluate guess
hex1 : out std_logic_vector(6 downto 0); -- 7-seg ones
hex10: out std_logic_vector(6 downto 0) -- 7-seg tens
);
end;

architecture guess_game_impl OF guess_game is

	signal preDef : std_logic_vector(7 downto 0);
	
BEGIN

--process(inputs, set, show, try) is
--BEGIN
--
--case bin is
--	when "0000" => 
--		seg <= "1000000";--0
--	when "0001"	 => 
--		seg <= "1111001";--1
--	when "0010" => 
--		seg <= "0100100";--2
--	when "0011" =>
--		seg <="0110000" ;--3
--	when "0100" =>
--		seg <= "0011001" ;--4
--	when "0101" =>
--		seg <= "0010010" ;--5
--	when "0110" =>
--		seg <= "0000010" ;--6
--	when "0111" =>
--		seg <= "1111000" ;--7
--	when "1000" =>
--		seg <= "0000000" ;--8
--	when "1001" =>
--		seg <= "0011000" ;--9
--	when "1010" =>
--		seg <= "0001000" ;--A
--	when "1011" =>
--		seg <= "0000011" ;--b
--	when "1100" =>
--		seg <= "1000110" ;--C
--	when "1101" =>
--		seg <= "0100001" ;--d
--	when "1110" =>
--		seg <= "0000110" ;--E
--	when "1111" =>
--		seg <= "0001110" ;--F
--	when others =>
--		seg <= "0111110" ;--U
--	
--	
--end case;
--end process;
	
END guess_game_impl;
