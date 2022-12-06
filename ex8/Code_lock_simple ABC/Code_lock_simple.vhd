LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY code_lock_simple IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		code : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		enter : IN STD_LOGIC;
		lock : OUT STD_LOGIC)
	;
END;

ARCHITECTURE rtl OF code_lock_simple IS

	
	--------Interne signaler---------------------
	SIGNAL enter_sync : STD_LOGIC;

BEGIN
	synchronizer : ENTITY synch PORT MAP (clk => clk, async_sig => enter, fall => enter_sync, rise => OPEN); --Brug enten rise eller fall output

	fsm : ENTITY code_lock_simple_fsm PORT MAP (clk => clk, reset => reset, enter => enter_sync, code => code, lock => lock);

END;