LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Input_Limiter IS
	PORT (
		-- Input ports
		bin_min1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		bin_min10 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		bin_hrs1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		bin_hrs10 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

		-- Output ports
		time_alarm : OUT STD_LOGIC_vECTOR(15 downto 0)
	);
END Input_Limiter;

ARCHITECTURE Input_Limiter_impl OF Input_Limiter IS
BEGIN

	PROCESS (bin_min1, bin_min10, bin_hrs1, bin_hrs10) IS
		-- Declaration(s) 
	BEGIN
		if ((bin_min1 >= "0000") and (bin_min1 <= "1001")) then
			time_alarm(3 downto 0) <= bin_min1;
		else
			time_alarm(3 downto 0)  <= "1111";
		end if;	
	   if ((bin_min10 >= "0000") and (bin_min10 <= "0101")) then
			time_alarm(7 downto 4) <= bin_min10;
		else
			time_alarm(7 downto 4) <= "1111";
		end if;	
		if (((bin_hrs1 >= "0000") and (bin_hrs1 <= "0011")) AND (bin_hrs10 >= "0010")) then -- Tjek om enkelt time højst skal kunne sættes til 3 eller 9
			time_alarm(11 downto 8) <= bin_hrs1;
		elsif (((bin_hrs1 >= "0000") and (bin_hrs1 <= "1001")) AND (bin_hrs10 >= "0000" AND bin_hrs10 < "0010")) then -- Tjek om enkelt time højst skal kunne sættes til 3 eller 9
			time_alarm(11 downto 8) <= bin_hrs1;
		else
			time_alarm(11 downto 8) <= "1111";
		end if;	
		if ((bin_hrs10 >= "0000") and (bin_hrs10 <= "0010")) then
			time_alarm(15 downto 12) <= bin_hrs10;
		else
			time_alarm(15 downto 12) <= "1111";
		end if;	
	END PROCESS;
END Input_Limiter_impl;