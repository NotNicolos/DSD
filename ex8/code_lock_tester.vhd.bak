LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY code_lock_simple_tester IS
	PORT (
		-- Input ports
		clock_50 : IN STD_LOGIC;
		SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 2);

		-- Output ports
		--LEDR : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		LEDG : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)

	);
END code_lock_simple_tester;

ARCHITECTURE code_lock_simple_tester_impl OF code_lock_simple_tester IS

BEGIN
	-- LEDG(0) <= KEY(0);
	-- LEDG(1) <= KEY(1);

	code_lock_simple
	: ENTITY work.code_lock_simple

	PORT MAP
	(
		clk => clock_50,
		reset => KEY(2),
		code => SW,
		enter => KEY(3),

		lock => LEDG(0)
	);

END code_lock_simple_tester_impl;