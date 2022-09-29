LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity multiplier is
port (
	a : in std_logic_vector(0 downto 0);
   b : in std_logic_vector(0 downto 0);
	Prod: out std_logic_vector(1 downto 0)
);
end;


architecture multiplier_impl OF multiplier is
BEGIN
	Prod <= a * b;
	--Prod <= std_logic_vector(unsigned(a) * 10);
	
END multiplier_impl;
