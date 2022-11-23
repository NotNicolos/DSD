LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY clock_gen IS
	PORT (
		-- Input ports
		clk : IN STD_LOGIC;
		speed : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		-- Output ports
		clk_out : OUT STD_LOGIC
	);
END clock_gen;

ARCHITECTURE clock_gen_impl OF clock_gen IS
BEGIN

	PROCESS (clk, reset)
		VARIABLE tmeCnt : INTEGER;
	BEGIN
		IF reset = '0' THEN -- reset er active low
			tmeCnt := 0;
		ELSIF rising_edge(clk) THEN
			tmeCnt := tmeCnt + 1; -- Vi inkrementere tmeCnt
			IF (speed = '1' AND tmeCnt >= 50000000) THEN
				clk_out <= '1';
				tmeCnt := 0; -- Nulstilling af tmeCnt, når vi sender signal på Clk_out  
			ELSIF (speed = '0' AND tmeCnt >= 250000) THEN
				clk_out <= '1';
				tmeCnt := 0;
			ELSE
				clk_out <= '0';
			END IF;

		END IF;
		-- reset variable på reset og i if
		-- incrementer
	END PROCESS;

END clock_gen_impl;