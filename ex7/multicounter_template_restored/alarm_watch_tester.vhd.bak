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
		HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

	);
END multi_counter_tester;

ARCHITECTURE multi_counter_tester_impl OF multi_counter_tester IS
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
	LEDG(0) <= KEY(0);
	LEDG(1) <= KEY(1);
	LEDG(2) <= KEY(2);
	LEDG(3) <= KEY(3);
	--	LEDG(4) <= clkSignal;
	
	rst : ENTITY work.reset_logic
		PORT MAP
		(
			clk => clkSignal,
			hrs_bin1 => counter2bin4,
			hrs_bin10 => counter2bin5,
			reset_in => key(3),
			reset_out => reset_out
		);

	clk : ENTITY work.clock_gen
		PORT MAP
		(
			clk => CLOCK_50,
			speed => KEY(0),
			reset => reset_out,

			clk_out => clkSignal
		);

	uut5 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin5,
			seg => HEX5(6 DOWNTO 0)

		);

	uut4 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin4,
			seg => HEX4(6 DOWNTO 0)

		);

	uut3 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin3,
			seg => HEX3(6 DOWNTO 0)

		);

	uut2 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin2,
			seg => HEX2(6 DOWNTO 0)

		);

	uut1 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin1,
			seg => HEX1(6 DOWNTO 0)

		);

	uut0 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => counter2bin,
			seg => HEX0(6 DOWNTO 0)

		);

	mc5 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => CLOCK_50,
			mode => "01",
			reset => reset_out,
			clken => cout2clken4,

			count => counter2bin5,
			cout => LEDR(0)
		);

	mc4 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => CLOCK_50,
			mode => "00",
			reset => reset_out,
			clken => cout2clken3,

			count => counter2bin4,
			cout => cout2clken4
		);

	mc3 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => CLOCK_50,
			mode => "01",
			reset => reset_out,
			clken => cout2clken2,

			count => counter2bin3,
			cout => cout2clken3
		);

	mc2 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => CLOCK_50,
			mode => "00",
			reset => reset_out,
			clken => cout2clken1,

			count => counter2bin2,
			cout => cout2clken2
		);

	mc1 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => CLOCK_50,
			mode => "01",
			reset => reset_out,
			clken => cout2clken0,

			count => counter2bin1,
			cout => cout2clken1
		);

	mc0 : ENTITY work.multi_counter
		PORT MAP
		(
			clk => CLOCK_50,
			mode => "00",
			reset => reset_out,
			clken => clkSignal,

			count => counter2bin,
			cout => cout2clken0
		);

END multi_counter_tester_impl;