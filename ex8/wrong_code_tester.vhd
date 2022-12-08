LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY wrong_code_tester IS
	PORT (
	
		clock_50 : IN STD_LOGIC;
		--SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 2); -- til err_event
		--LEDG : out std_logic_vector(3 downto 2);
		LEDR : OUT STD_LOGIC_VECTOR(2 downto 0)
--		clk : IN STD_LOGIC;
--		reset : IN STD_LOGIC;
--		enter : IN STD_LOGIC;
--		code : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--		lock : OUT STD_LOGIC
	);
END wrong_code_tester;

ARCHITECTURE wrong_code_tester_impl OF wrong_code_tester IS
	SIGNAL Enter_rising : STD_LOGIC;
	signal failed_sig : STD_LOGIC;
	signal err_event_sig : STD_LOGIC;
BEGIN
--LEDG(3) <= KEY(3);
--LEDG(2) <= KEY(2);
	wc0 : ENTITY work.wrong_code
		PORT MAP
		(
			-- Input ports
			clk => clock_50,
			reset => '1',
			err_event => KEY(3),
			-- Output ports,
			failed => LEDR(2)
		);

		
end wrong_code_tester_impl;