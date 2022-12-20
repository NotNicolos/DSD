LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY wrong_code IS
	GENERIC (
		MIN_COUNT : NATURAL := 0; -- min og max count for tÃƒÂ¦ller
		MAX_COUNT : NATURAL := 10
	);
	PORT
	(
		-- Input ports
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		err_event : IN STD_LOGIC;
		-- Output ports
		failed : OUT STD_LOGIC
	);
END wrong_code;

ARCHITECTURE wrong_code_impl OF wrong_code IS
BEGIN

	counter_proc :
	PROCESS (clk, reset) --process reagerer bÃ¥de clk og reset
		VARIABLE cnt : INTEGER RANGE MIN_COUNT TO MAX_COUNT; -- bruger "variable" for Ã¸jeblikkelig opdatering af counter variable
		--VARIABLE cntMax : INTEGER;
		--cntMax := 3;
		-- MAX_COUNT betyder IKKE at counteren af sig selv ikke tÃ¦ller hÃ¸jere end til MAX_COUNT
	BEGIN
		IF reset = '0' THEN-- asynkron reset, ikke afhÃ¦ngig af clk
			-- Reset the counter to 0
			cnt := 0;
			failed<='0';
		ELSIF (rising_edge(err_event)) THEN
			failed <= '0';
			--IF err_event = '1' THEN
				cnt := cnt + 1;
				IF cnt >= 3 THEN
					failed <= '1';
					cnt := 0;
				END IF;
		--	END IF;
		END IF;

		-- Output the current count
		--failed <= STD_LOGIC_VECTOR(to_unsigned(cnt, count'length));
	END PROCESS;

END wrong_code_impl;