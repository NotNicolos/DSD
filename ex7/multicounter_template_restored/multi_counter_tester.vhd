LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY watch_tester IS
	PORT (
		-- Input ports
		SW : IN STD_LOGIC_VECTOR(17 DOWNTO 16);
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
		LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		tm : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)

	);
END watch_tester;

ARCHITECTURE watch_tester_impl OF watch_tester IS
	
BEGIN
	LEDG(0) <= KEY(0);
	LEDG(1) <= KEY(1);
	LEDG(2) <= KEY(2);
	LEDG(3) <= KEY(3);
	--	LEDG(4) <= clkSignal;

	watch : ENTITY work.watch
		PORT MAP
		(
			clk => CLOCK_50,
			speed => key(0),
			reset => key(3),
			sec_1 => HEX2,
			sec_10 => HEX3,
			min_1 => HEX4,
			min_10 => HEX5,
			hrs_1 => HEX6,
			hrs_10 => HEX7
		);
	
END watch_tester_impl;



