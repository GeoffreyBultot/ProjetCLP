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
-- CREATED		"Thu Sep 17 08:46:34 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

LIBRARY work;

ENTITY ADC IS 
	PORT
	(
		ADC_CS : out std_logic;
		ADC_SCLK : in std_logic;--ADC clock
		ADC_DIN : in std_logic;
		ADC_DOUT : out std_logic_vector (11 downto 0)
		--ADC_SADDR : out std_logic;--channel address (For this project we use channel 1)
		--ADC_CS_N : out std_logic--this signal activate the ADC chip (ADC_CS_N)
	);
END ADC;

ARCHITECTURE Behavioral OF ADC IS 

signal dato_temp : std_logic_vector (15 downto 0);
signal enable : std_logic;
signal RST : std_logic;
BEGIN 
ADC_CS <= enable;
	process(ADC_SCLK)
	begin
		if rising_edge(ADC_SCLK) then

			--This is the actual shift register
			if (RST = '1') then
				dato_temp <= (others => '0');
			else
				dato_temp(0) <= ADC_DIN;
				for i in 1 to 15 loop
					dato_temp(i) <= dato_temp(i-1);
				end loop;
			end if;
		end if;
	end process;
--fDiv1: freq_div port map (clock_in=>CLOCK_50MHZ,clock_out=>ADC_SCLK);


	process(ADC_SCLK)

		variable temp : integer range 0 to 16;
		--variable cont_temp : integer range 0 to 3;

		begin

		--This process activate the "enable" signal every 16 clock periods
		if rising_edge(ADC_SCLK) then
			
			if (RST = '1') then
			temp := 0;
			enable <= '0';
			else
				temp := temp + 1;
				if (temp = 16) then
					enable <= '1';
				else
					enable <= '0';
				end if;
			end if;
		end if;

		end process;


	--When the signal "enable" is high the 12 bit reading is stored in the output signal "dato_out"
	process(ADC_SCLK)
		begin
			if rising_edge(ADC_SCLK) then

				if (RST = '1') then
					ADC_DOUT <= (others => '0');
				else
					if (enable = '1') then
						ADC_DOUT <= dato_temp(11 downto 0);
					end if;
				end if;
			end if;

		end process;

END Behavioral;

