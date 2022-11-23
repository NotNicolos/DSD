LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY reset_logic IS
	PORT (
		-- Input ports
		CLK : IN STD_LOGIC;
		reset_in : IN STD_LOGIC;
		hrs_bin1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		hrs_bin10 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

		-- Output ports
		reset_out : OUT STD_LOGIC
	);
END reset_logic;

ARCHITECTURE reset_logic_impl OF reset_logic IS
BEGIN

	PROCESS (reset_in, clk, hrs_bin1, hrs_bin10) IS
		-- Declaration(s) 
	BEGIN
		IF reset_in = '1' THEN-- asynkron reset, ikke afhÃƒÂ¦ngig af clk
		reset_out <= '1';
		-- Reset the counter to 0
		ELSIF (rising_edge(clk)) THEN
		
		--IF (rising_edge(clk)) THEN
			IF hrs_bin1 = "0100" AND hrs_bin10 = "0010" THEN
				reset_out <= '1';
			ELSE
				reset_out <= '0';
			END IF;

		END IF;
	END PROCESS;
END reset_logic_impl;