-- NOTE: cef 2017-1805: PROJECT IS READY FOR TEST AS-IS: CLK in and VGA output pins already assigned. See
--         clk Location PIN_N2
--         hsync Location PIN_A7
--         vsync Location PIN_D8
---        blank Location	PIN_D6
--         red[9] Location PIN_E10...
--       etc in "Assignments | Assignments Editor"
-- NOTE: cef 2017-1805: project cleaned up, removed temporary compilations files and added 
--        "set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files" 
--       to vga.qsf project file. Pretty-formated VHDL code.
--
-- Template for VGA output by: Rene Kristensen
-- This design template uses gated clocks which generally are bad design practice.
-- This implies that the template design is not optimized for speed and will only serve for educational purpose. 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY vga IS
	PORT (
		clk, reset : IN STD_LOGIC;
		red, green, blue : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		hsync, vsync, clockOut, blank, compSync : OUT STD_LOGIC
	);
END vga;

ARCHITECTURE testGenerator OF vga IS

	-- horizontal Timing constants for 640 x 480 @ 60Hz
	CONSTANT hFrontPorch : NATURAL := 16; -- units are number of 25 MHz clocks
	CONSTANT hBackPorch : NATURAL := 48;
	CONSTANT hDataLen : NATURAL := 640;
	CONSTANT hSynWidth : NATURAL := 96;

	-- vertical Timing constants for 640 x 480 @ 60Hz 
	CONSTANT vFrontPorch : NATURAL := 10; -- units are number of lines
	CONSTANT vBackPorch : NATURAL := 33;
	CONSTANT vDataLen : NATURAL := 480;
	CONSTANT vSynWidth : NATURAL := 2;

	-- signal declaration
	SIGNAL hSyncCounter, vSyncCounter : INTEGER RANGE 0 TO 1023; -- contrain integer to 10 bit.
	SIGNAL hSyncOut, vSyncOut, clk25, vBlank, hBlank : STD_LOGIC;

	-- attributes ensuring the signals defined below are not reduced away before simulation.
	ATTRIBUTE keep : BOOLEAN; -- don't reduce vSyncCounter and hSyncCounter signals away, so we can watch these signals i simulator
	ATTRIBUTE keep OF vSyncCounter : SIGNAL IS true; --   ||   --
	ATTRIBUTE keep OF hSyncCounter : SIGNAL IS true; --   ||   --

	-- INSERT YOUR PROCEDURE HERE.
	-- Your procedure should circular increment syncCounter, produce blanking and sync output.  
	PROCEDURE syncGenerator	(
							-- Signaler
							SIGNAL syncCounter : INOUT INTEGER;
							SIGNAL syncOut : OUT STD_LOGIC;
							SIGNAL blankOut : OUT STD_LOGIC;
							-- Konstanter
							CONSTANT frontPorch : IN NATURAL;
							CONSTANT backPorch : IN NATURAL;
							CONSTANT dataLen : IN NATURAL;
							CONSTANT synWidth : IN NATURAL)IS 
	BEGIN
		-- Referer til Fig. 3: VGA timing fra Exercise 8 - Procedures and Functions in VHDL (VGA).pdf
		syncCounter <= syncCounter + 1;
		IF (syncCounter <= backPorch) THEN
			-- Denne del relatere til back porch data området på Fig. 3
			blankOut <= '1';
			syncOut <= '1';
		ELSIF (syncCounter <= (backPorch + dataLen)) THEN
			-- Denne del relatere til data længde området på Fig. 3
			blankOut <= '0';
			syncOut <= '1';
		ELSIF (syncCounter <= (backPorch + dataLen + frontPorch)) THEN
			-- Denne del relatere til front porch data området på Fig. 3
			blankOut <= '1';
			syncOut <= '1';
		ELSIF (syncCounter <= (backPorch + dataLen + frontPorch + synWidth)) THEN
			-- Denne del relatere til sync width data området på Fig. 3
			blankOut <= '1';
			syncOut <= '0';
		ELSIF (syncCounter >= (backPorch + dataLen + frontPorch + synWidth)) THEN
			-- Når vi passere max nulstiller vi syncCounter
			syncCounter <= 0;
		END IF;
	END syncGenerator;

BEGIN

clkdiv : PROCESS (reset, clk) -- creates a 25 MHz pixel clock (clk25) from a 50 MHz input (clk).
BEGIN
	IF (reset = '0') THEN
		clk25 <= '0';
	ELSIF rising_edge(clk) THEN
		clk25 <= NOT clk25;
	END IF;
END PROCESS;

-- horizontal process using the generic syncGenerator function to generate a proper hsync pulse.
hsyn : PROCESS (reset, clk25) -- reacts on reset and 25 MHz clock.
BEGIN
	IF reset = '0' THEN
		hSyncCounter <= 0;
	ELSIF rising_edge(clk25) THEN
		-- generates active low pulse after every line
		syncGenerator(hSyncCounter, hSyncOut, hBlank, hFrontPorch, hBackPorch, hDataLen, hSynWidth);
	END IF;
END PROCESS;

-- vertical process using the generic syncGenerator function to generate a proper vsync pulse.
vsyn : PROCESS (reset, hSyncOut) -- reacts on reset and hsync (meaning every line).
BEGIN
	IF reset = '0' THEN
		vSyncCounter <= 0;
	ELSIF rising_edge(hSyncOut) THEN
		-- generates active low pulse after every picture
		syncGenerator(vSyncCounter, vSyncOut, vBlank, vFrontPorch, vBackPorch, vDataLen, vSynWidth);
	END IF;
END PROCESS;

color : PROCESS (reset, hSyncCounter, vSyncCounter) -- draws italian flag color scheme
BEGIN
	IF ((hSyncCounter > hBackPorch) AND (hSyncCounter <= hBackPorch + 213)) THEN
		red <= (OTHERS => '0'); -- Green
		green <= (OTHERS => '1');
		blue <= (OTHERS => '0');
	ELSIF ((hSyncCounter > hBackPorch + 213) AND (hSyncCounter <= hBackPorch + 426)) THEN
		red <= (OTHERS => '1'); -- White
		green <= (OTHERS => '1');
		blue <= (OTHERS => '1');
	ELSE
		red <= (OTHERS => '1'); -- Red
		green <= (OTHERS => '0');
		blue <= (OTHERS => '0');
	END IF;
END PROCESS;

vsync <= vSyncOut; -- connect vsync to entity
hsync <= hSyncOut; -- connect hsync to entity
clockOut <= clk25; -- 25 MHz clock for DAC 
blank <= NOT (vBlank OR hBlank); -- active low blanking.
compSync <= '1'; -- Never perform any composite sync. 

END testGenerator;