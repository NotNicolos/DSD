LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

entity compare_logic is
port(
input : in std_logic_vector(7 downto 0);
mylatch : in std_logic_vector(7 downto 0);
try : in std_logic; -- Set predefined value
result : out std_logic_vector(1 downto 0)


);
end;

architecture compare_logic_impl OF compare_logic is
--	signal preDef : std_logic_vector(7 downto 0);
BEGIN
	
	
	result <= 	"11" when try = '1' else
					"01" when ((input > mylatch) AND (try = '0')) else
					"10" when ((input < mylatch) AND (try = '0')) else 
					"00" when ((input = mylatch) AND (try = '0'));
	
	
END compare_logic_impl;