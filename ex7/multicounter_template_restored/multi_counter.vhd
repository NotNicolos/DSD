LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY multi_counter IS
	GENERIC (
		MIN_COUNT : NATURAL := 0; -- min og max count for tÃ¦ller
		MAX_COUNT : NATURAL := 10
	);
	PORT (
		-- Input ports
		clk : IN STD_LOGIC;
		mode : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		reset : IN STD_LOGIC;
		clken : IN STD_LOGIC;
		-- Output ports
		count : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		cout : OUT STD_LOGIC;
		tm : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END multi_counter;

ARCHITECTURE multi_counter_impl OF multi_counter IS
BEGIN

	counter_proc :
	PROCESS (clk, reset) --process reagerer bÃ¥de clk og reset
		VARIABLE cnt : INTEGER RANGE MIN_COUNT TO MAX_COUNT; -- bruger "variable" for Ã¸jeblikkelig opdatering af counter variable
		VARIABLE cntMax : INTEGER;
		-- MAX_COUNT betyder IKKE at counteren af sig selv ikke tÃ¦ller hÃ¸jere end til MAX_COUNT
	BEGIN
		IF reset = '0' THEN-- asynkron reset, ikke afhÃ¦ngig af clk
			-- Reset the counter to 0
			cnt := 0;
		ELSIF (rising_edge(clk)) THEN
			cout <= '0';
			IF clken = '1' THEN
				CASE mode IS
					WHEN "00" =>
						cntMax := 9;
					WHEN "01" =>
						cntMax := 5;
					WHEN OTHERS =>
						cntMax := 2;
				END CASE;

				IF cnt < cntMax THEN
					cnt := cnt + 1;
					cout <= '0';
				ELSE
					cnt := 0;
					cout <= '1';
				END IF;
			END IF;
		END IF;

		-- Output the current count
		count <= STD_LOGIC_VECTOR(to_unsigned(cnt, count'length));
	END PROCESS;

END multi_counter_impl;