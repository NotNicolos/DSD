LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY Code_lock IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		enter : IN STD_LOGIC;
		code : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		lock : OUT STD_LOGIC)
	;
END;

ARCHITECTURE Code_lock_impl OF Code_lock IS
	SIGNAL Enter_rising : STD_LOGIC;
	signal failed_sig : STD_LOGIC;
	signal err_event_sig : STD_LOGIC;
BEGIN
	wc0 : ENTITY work.wrong_code
		PORT MAP
		(
			-- Input ports
			clk => clk,
			reset => reset,
			err_event => err_event_sig,
			-- Output ports,
			failed => failed_sig
		);

	clf0 : ENTITY work.code_lock_simple_fsm
		PORT MAP
		(
			clk => clk,
			reset => reset,
			code => code,
			enter => Enter_rising,
			failed => failed_sig,
			lock => lock,
			err_event => err_event_sig
		);

	snc0 : ENTITY work.synch
		PORT MAP
		(
			clk => clk,
			async_sig => enter,
			fall => Enter_rising,
			rise => OPEN
		);
		
end Code_lock_impl;