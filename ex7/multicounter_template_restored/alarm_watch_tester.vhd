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
	
	SIGNAL MuxtoA1 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL MuxtoA2 : STD_LOGIC_VECTOR(6 downto 0); 
	SIGNAL MuxtoA3 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL MuxtoA4 : STD_LOGIC_VECTOR(6 downto 0);
	
	SIGNAL MuxtoB1 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL MuxtoB2 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL MuxtoB3 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL MuxtoB4 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL MuxtoB5 : STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL MuxtoB6 : STD_LOGIC_VECTOR(6 downto 0);
		
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
		sec_1 => MuxtoB1,
		sec_10 => MuxtoB2
		
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
		A1 => MuxtoA1,
		A2 => MuxtoA2,
		A3 => MuxtoA3,
		A4 => MuxtoA4,
		B1 => MuxtoB1,
		B2 => MuxtoB2,
		B3 => MuxtoB3,
		B4 => MuxtoB4,
		B5 => MuxtoB5,
		B6 => MuxtoB6,
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
			seg => MuxtoA1

		);

	min10 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => time_alarm_signal(7 downto 4),
			seg => MuxtoA2

		);

	hrs1 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => time_alarm_signal(11 downto 8),
			seg => MuxtoA3

		);

	hrs10 : ENTITY work.bin2sevenseg
		PORT MAP
		(
			bin => time_alarm_signal(15 downto 12),
			seg => MuxtoA4

		);


	

END alarm_watch_tester_impl;