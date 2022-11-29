LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY compare IS
	PORT (
		-- Input ports
		tm_watch : IN STD_LOGIC_VECTOR(15 downto 0);
		tm_alarm : IN STD_LOGIC_VECTOR(15 downto 0);
		-- Output ports
		alarm : OUT STD_LOGIC
	);
END compare;

ARCHITECTURE compare_impl OF compare IS
BEGIN

	PROCESS (tm_alarm,tm_watch) IS
		-- Declaration(s) 
	BEGIN
		IF tm_alarm = tm_watch THEN
			alarm <= '1';
		else
			alarm <= '0';

		END IF;
	END PROCESS;
END compare_impl;