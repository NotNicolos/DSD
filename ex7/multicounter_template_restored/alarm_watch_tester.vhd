LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY alarm_watch_tester IS
	PORT (
		-- Input ports
		SW : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		CLOCK_50 : IN STD_LOGIC;

		-- Output ports
		HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX6 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

	);
END alarm_watch_tester;

ARCHITECTURE alarm_watch_tester_impl OF alarm_watch_tester IS
	
	SIGNAL BinToA1 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL BinToA2 : STD_LOGIC_VECTOR(6 downto 0); 
	SIGNAL BinToA3 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL BinToA4 : STD_LOGIC_VECTOR(6 downto 0);
	
	SIGNAL BinToB1 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL BinToB2 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL BinToB3 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL BinToB4 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL BinToB5 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL BinToB6 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL tmWatchSignal : STD_LOGIC_VECTOR(15 downto 0);
	SIGNAL time_alarm_signal : STD_LOGIC_VECTOR(15 downto 0);
	
BEGIN
	LEDG(0) <= KEY(0);
	LEDG(1) <= KEY(1);
	LEDG(2) <= KEY(2);
	LEDG(3) <= KEY(3);
	--	LEDG(4) <= clkSignal;
	rst : ENTITY work.watch
	PORT MAP
	(
		clk => CloCK_50,
		speed => KEY(0),
		reset => KEY(3),
		sec_1 => BinToB1,
		sec_10 => BinToB2,
		min_1 => BinToB3,
		min_10 => BinToB4,
		hrs_1 => BinToB5,
		hrs_10 => BinToB6,
		tm => tmWatchSignal
		
	);
	rst2 : ENTITY work.Input_Limiter
	PORT MAP
	(
		-- Input ports
		bin_min1 => SW(3 downto 0),
		bin_min10 => SW(7 downto 4),
		bin_hrs1 => SW(11 downto 8),
		bin_hrs10 => SW(15 downto 12),

		-- Output ports
		time_alarm  => time_alarm_signal
	);
	mux1 : ENTITY work.Mux
		PORT MAP
		(
		A1 => BinToA1,
		A2 => BinToA2,
		A3 => BinToA3,
		A4 => BinToA4,
		B1 => BinToB1,
		B2 => BinToB2,
		B3 => BinToB3,
		B4 => BinToB4,
		B5 => BinToB5,
		B6 => BinToB6,
		VIEW => key(2),	
		-- Output ports
		C1 => HEX2,
		C2 => HEX3, 
		C3 => HEX4, 
		C4 => HEX5, 
		C5 => HEX6, 
		C6 => HEX7  
		);
	
	min1 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => time_alarm_signal(3 downto 0),
			seg => BinToA1

		);

	min10 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => time_alarm_signal(7 downto 4),
			seg => BinToA2

		);

	hrs1 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => time_alarm_signal(11 downto 8),
			seg => BinToA3

		);

	hrs10 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => time_alarm_signal(15 downto 12),
			seg => BinToA4

		);

	compare: ENTITY work.compare
		PORT MAP
		(
			tm_watch => tmWatchSignal,
			tm_alarm => time_alarm_signal,
			alarm => LEDR(0)
		);
	

END alarm_watch_tester_impl;