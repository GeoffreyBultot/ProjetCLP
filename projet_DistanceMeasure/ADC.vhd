-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"
-- CREATED		"Thu Sep 17"
-- AUTHOR 		Bultot Geoffrey
-- LICENSE 		All right reserved


-- ADC DE0NANO GESTURE

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

LIBRARY work;

ENTITY ADC IS 
	PORT
	(
		-- CHIP SELECT ADC
		ADC_CS_N : out std_logic;
		-- input 50MHZ CLOCK
		CLOCK_50MHZ: in std_logic;
		-- ADC CLOCK generate by this component
		ADC_SCLK : out std_logic;
		ADC_DIN : in std_logic;
		ADC_DOUT : out std_logic_vector (11 downto 0) --:= "000000000000"
	);
END ADC;

ARCHITECTURE Behavioral OF ADC IS 

-- signal to use shift register and store value before apply in output
signal temp_ADC_Out : std_logic_vector (15 downto 0);
-- Signals to read output
signal enable : std_logic;
signal sig_ADC_SCLK : std_logic;

BEGIN 
	-- internals signals connect to output
	ADC_CS_N <= enable;
	ADC_SCLK <= sig_ADC_SCLK;
	
	--*************************************************************************************
	--*************************************************************************************
	
	process(CLOCK_50MHZ)
		variable temp : integer range 0 to 20;
		begin
			--The input frequency is divided by 20
			if rising_edge(CLOCK_50MHZ) then
				temp := temp + 1;
				if (temp=20) then
					sig_ADC_SCLK <= not(sig_ADC_SCLK);
					temp:=0;
				end if;
			end if;
		end process;
		
	--*************************************************************************************
	--*************************************************************************************
	
	process(sig_ADC_SCLK)
		variable temp : integer range 0 to 20000;
		begin
			if rising_edge(sig_ADC_SCLK) then
				-- use shift register while not the end of communication
				if (temp < 17) then
					temp_ADC_Out(0) <= ADC_DIN;
					for i in 1 to 15 loop
						temp_ADC_Out(i) <= temp_ADC_Out(i-1);
					end loop;
				-- end of communication. DO NOT SHIFT THE LAST BIT
				else if(temp = 17) then
						temp_ADC_Out(0) <= ADC_DIN;
				end if;
				end if;
				
				-- chip select gesture
				if (temp = 15) then
					enable <= '1';
				else if (temp < 15) then
					enable <= '0';
				end if;
				end if;
				-- increment bit counter. THis counter go to 0 automatically after 20000
				temp := temp + 1;
			end if;
		end process;

	--*************************************************************************************
	--*************************************************************************************
	
	--When the signal "enable" is high => store 12 last bits to the output
	process(sig_ADC_SCLK)
		begin
			if rising_edge(sig_ADC_SCLK) then
				if (enable = '1') then
					ADC_DOUT <= temp_ADC_Out(11 downto 0);
				end if;
			end if;

		end process;

END Behavioral;

