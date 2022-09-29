LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shift_div is
port (
a : in std_logic_vector(7 downto 0);
a_shl, a_shr, a_ror: out std_logic_vector(7 downto 0)
);
end;


architecture shift_div_impl OF shift_div is
BEGIN
a_shl <= a(6 DOWNTO 0) & '0';
a_shr <= "00" & a(7 DOWNTO 2);
a_ror <= a(2 downto 0) & a(7 downto 3);

END shift_div_impl;
