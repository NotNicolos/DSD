LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY watch IS
	PORT (
		-- Input ports
		speed : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		clk : IN STD_LOGIC;

		-- Output ports
		sec_1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		sec_10 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		min_1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		min_10 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		hrs_1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		hrs_10 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		tm : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)

	);
END watch;

ARCHITECTURE watch_impl OF watch IS
	SIGNAL counter2bin : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL counter2bin1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL counter2bin2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL counter2bin3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL counter2bin4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL counter2bin5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL clkSignal : STD_LOGIC;
	SIGNAL cout2clken0 : STD_LOGIC;
	SIGNAL cout2clken1 : STD_LOGIC;
	SIGNAL cout2clken2 : STD_LOGIC;
	SIGNAL cout2clken3 : STD_LOGIC;
	SIGNAL cout2clken4 : STD_LOGIC;
	SIGNAL reset_out : STD_LOGIC;
	
BEGIN
	
	rst : ENTITY work.reset_logic
		PORT MAP
		(
			clk => clkSignal,
			hrs_bin1 => counter2bin4,
			hrs_bin10 => counter2bin5,
			reset_in => reset,
			reset_out => reset_out
		);

	clk1 : ENTITY work.clock_gen
		PORT MAP
		(
			clk => clk,
			speed => speed,
			reset => reset_out,

			clk_out => clkSignal
		);

	uut5 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin5,
			seg => hrs_10

		);
		
		tm(15 downto 12) <= counter2bin5;

	uut4 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin4,
			seg => hrs_1

		);
		
		tm(11 downto 8) <= counter2bin4;

	uut3 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin3,
			seg => min_10

		);
		
		tm(7 downto 4) <= counter2bin3;
		

	uut2 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin2,
			seg => min_1
		);

		tm(3 downto 0) <= counter2bin2;
		
	uut1 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin1,
			seg => sec_10

		);

	uut0 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin,
			seg => sec_1

		);

	mc5 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => clk,
			mode => "01",
			reset => reset_out,
			clken => cout2clken4,

			count => counter2bin5
			);

	mc4 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => clk,
			mode => "00",
			reset => reset_out,
			clken => cout2clken3,

			count => counter2bin4,
			cout => cout2clken4
		);

	mc3 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => clk,
			mode => "01",
			reset => reset_out,
			clken => cout2clken2,

			count => counter2bin3,
			cout => cout2clken3
		);

	mc2 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => clk,
			mode => "00",
			reset => reset_out,
			clken => cout2clken1,

			count => counter2bin2,
			cout => cout2clken2
		);

	mc1 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => clk,
			mode => "01",
			reset => reset_out,
			clken => cout2clken0,

			count => counter2bin1,
			cout => cout2clken1
		);

	mc0 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => clk,
			mode => "00",
			reset => reset_out,
			clken => clkSignal,

			count => counter2bin,
			cout => cout2clken0
		);

END watch_impl;