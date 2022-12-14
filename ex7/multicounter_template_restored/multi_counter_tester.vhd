LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY multi_counter_tester IS
	PORT (
		-- Input ports
		SW : IN STD_LOGIC_VECTOR(17 DOWNTO 16);
		KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		CLOCK_50 : IN STD_LOGIC;

		-- Output ports
		HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

	);
END multi_counter_tester;

ARCHITECTURE multi_counter_tester_impl OF multi_counter_tester IS
	SIGNAL counter2bin : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL clkSignal : STD_LOGIC;
	
BEGIN
	LEDG(0) <= KEY(0);
	LEDG(1) <= KEY(1);
	LEDG(2) <= KEY(2);
	LEDG(3) <= KEY(3);
	
		clk : ENTITY work.clock_gen
		PORT MAP
		(
			clk => CLOCK_50,
			speed => KEY(0),
			reset => KEY(3),

			clk_out => clkSignal
		);

		uut0 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin,
			seg => HEX0(6 DOWNTO 0)

		);

	mc0 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => CLOCK_50,
			mode => SW(17 downto 16),
			reset => KEY(3),
			clken => clkSignal,

			count => counter2bin,
			cout =>  LEDR(0)
		);

END multi_counter_tester_impl;