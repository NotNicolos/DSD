LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY code_lock_simple_fsm IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		code : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		enter : IN STD_LOGIC;
		failed : in std_logic;
		lock : OUT STD_LOGIC;
		err_event : out std_logic
	);
END;
ARCHITECTURE code_lock_simple_impl OF code_lock_simple_fsm IS
	TYPE state IS (idle, Ev_code1, get_code2, Ev_code2, Unlocked, err_state);
	SIGNAL present_state, next_state : state;

	------ Hardwirede koder til kodelÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¥sen

	CONSTANT code1 : STD_LOGIC_VECTOR := "1100";
	CONSTANT code2 : STD_LOGIC_VECTOR := "1110";

BEGIN
	state_register : PROCESS (clk) IS
	BEGIN
		IF rising_edge(clk) THEN
			IF reset = '0' THEN
				present_state <= idle;
			ELSE
				present_state <= next_state;
			END IF;
		END IF;
	END PROCESS;

	outputs : PROCESS (present_state, clk, code, enter) IS
	BEGIN
		CASE(present_state) IS

			WHEN Unlocked =>
			lock <= '0';

			WHEN OTHERS =>
			lock <= '1';

		END CASE;
	END PROCESS;

	nxt_state : PROCESS (present_state, clk, code, enter)
		VARIABLE lockAttempt : INTEGER RANGE 0 TO 3; -- bruger "variable" for ÃƒÆ’Ã‚Â¸jeblikkelig opdatering af counter variable
		--	VARIABLE lockAttempt : STD_LOGIC; -- bruger "variable" for ÃƒÆ’Ã‚Â¸jeblikkelig opdatering af counter variable

	BEGIN
		CASE(present_state) IS

			WHEN idle =>
			IF enter = '1' THEN
				next_state <= Ev_code1;
			ELSE
				next_state <= idle;
			END IF;
			WHEN Ev_code1 =>
			IF code = code1 THEN
				next_state <= get_code2;
			ELSE
				if failed = '1' then
					next_state <= err_state;
				else 
					next_state <= idle;
				end if ;
			END IF;
			WHEN get_code2 =>
			IF enter = '1' THEN
				next_state <= Ev_code2;
			ELSE
				next_state <= get_code2;
			END IF;
			WHEN Ev_code2 =>
			IF code = code2 THEN
				next_state <= Unlocked;
			ELSE
				if failed = '1' then
					next_state <= err_state;
				else 
					next_state <= idle;
				end if ;
			END IF;
			WHEN unlocked =>
			IF enter = '1' THEN
				next_state <= idle;
			ELSE
				next_state <= unlocked;
			END IF;
			WHEN err_state =>
			next_state <= err_state;
		--END IF;

	END CASE;
END PROCESS;


END code_lock_simple_impl;

