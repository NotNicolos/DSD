library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
package gates_pack is

	function my_xor (a, b : std_logic) return std_logic ;
	procedure my_and_out (a, b : in std_logic; signal and_out : out std_logic);
	procedure my_or (a, b : in std_logic; signal or_out : out std_logic);
	
end gates_pack;

package body gates_pack is
	-- Her begynder funktionen my_xor.
	function my_xor (a, b : std_logic) return std_logic is 
		begin	
			-- returner værdien af beregningen.
			return  (a xor b);
	end function  my_xor;
	-- Procedure body for NAND gate procedure
	procedure my_and_out (a, b : in std_logic; signal and_out : out std_logic)is
		begin
		-- returner værdien af beregningen.
		and_out <= (a and b);
	end my_and_out;
	procedure my_or (a, b : in std_logic; signal or_out : out std_logic)is
		begin
		-- returner værdien af beregningen.
		or_out <= (a or b);
	end my_or;
end gates_pack;


