LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

entity mylatch is
port(
inputs : in std_logic_vector(7 downto 0);
set : in std_logic; -- Set predefined value

preDef : out std_logic_vector(7 downto 0)
);
end;

architecture mylatch_impl OF mylatch is
--	signal preDef : std_logic_vector(7 downto 0);
BEGIN


preDef <= 
	inputs when set = '0';

	
	
END mylatch_impl;