LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY mee_moo_tester IS
	PORT (
		-- Input ports
		SW : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

		-- Output ports
		LEDR : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

	);
END mee_moo_tester;

ARCHITECTURE mee_moo_tester_impl OF mee_moo_tester IS

BEGIN
	LEDG(0) <= KEY(0);
	LEDG(1) <= KEY(1);
	
	mee_moo : ENTITY work.mee_moo
		PORT MAP
		(
			clk => KEY(0),
			reset => KEY(1),
			a => SW(0),
			b => SW(1),

			mee_out => LEDR(0),
			moo_out => LEDR(1)
		);

END mee_moo_tester_impl;