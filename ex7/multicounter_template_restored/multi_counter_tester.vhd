LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY multi_counter_tester IS
	PORT
	(

	
		-- Input ports
		SW     : IN STD_LOGIC_VECTOR(17 DOWNTO 16);
		KEY	 : in STD_LOGIC_VECTOR(3 downto 0);
		
		-- Output ports
		HEX0   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		LEDR	 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		LEDG	 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

	);
END multi_counter_tester;

ARCHITECTURE multi_counter_tester_impl OF multi_counter_tester IS
	signal counter2bin : std_logic_vector(3 downto 0);
BEGIN
LEDG(0) <= KEY(0);
LEDG(1) <= KEY(1);
LEDG(2) <= KEY(2);
	uut : ENTITY work.bin2sevenseg
	PORT MAP
		(
			bin => counter2bin,
			seg => HEX0(6 downto 0)
			
		);
		
	mc : ENTITY work.multi_counter 
	PORT MAP
		(
			clk => KEY(0),
			mode => SW,
			reset => KEY(3),
			clken => '1',
			
			count=> counter2bin, 
			cout =>LEDR(0) 
		);



END multi_counter_tester_impl;