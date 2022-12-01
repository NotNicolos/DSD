library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity code_lock_simple is
	port(
			clk : in std_logic;
			reset : in std_logic;
			code : in std_logic_vector(3 downto 0);
			enter : in std_logic;
			lock : out std_logic)
			;
end;

architecture rtl of code_lock_simple is

	------ Hardwirede koder til kodelåsen

	constant code1 : std_logic_vector := "1100"; 
	constant code2 : std_logic_vector := "1110";
	
	--------Interne signaler---------------------
	signal enter_sync :std_logic;
	
	

begin

	
	synchronizer: entity synch port map ( clk=>clk, async_sig=> not enter, rise=>enter_sync, fall=>open); --Brug enten rise eller fall output
	
	--fsm: entity code_lock_simple_fsm port map (clk=>clk, reset=>reset, enter=>enter_sync, code=>code, lock=>lock);	
	
end;
