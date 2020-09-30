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
use ieee.math_real.all;

LIBRARY work;

ENTITY rawTo4Digit IS 
	PORT
	(
		CLOCK_50MHZ : in std_logic;
		RAW_VALUE_IN : in std_logic_vector (11 downto 0);--:= "000000000000";
		DigitDecade : out std_logic_vector (3 downto 0);
		DigitUnit : out std_logic_vector (3 downto 0);
		DigitTenth : out std_logic_vector (3 downto 0);
		DigitHundredth : out std_logic_vector (3 downto 0)
	);
END rawTo4Digit;

ARCHITECTURE Behavioral OF rawTo4Digit IS 

--variable floatValue : real;

signal averaged_RAW_VALUE_IN : std_logic_vector (11 downto 0);
signal sig_refreshDigits : std_logic := '0';
--shared variable tempValueAverage : integer;
--shared variable count : integer;

BEGIN 

	process(CLOCK_50MHZ)
			variable temp : integer;
		begin
			--The input frequency is divided by 20
			if rising_edge(CLOCK_50MHZ) then
				temp := temp + 1;
				if (temp=7000000) then
					sig_refreshDigits <= not(sig_refreshDigits);
					temp:=0;
				end if;
			end if;
		end process;

--	average: process (sig_refreshDigits)--(RAW_VALUE_IN)
--		begin
--			if(count >= 10) then
--				tempValueAverage := tempValueAverage/10;
--				averaged_RAW_VALUE_IN <= std_logic_vector(to_unsigned(tempValueAverage,12));
--				count := 0;
--				--tempValueAverage := 0;
--			else
--				tempValueAverage := (tempValueAverage + to_integer(unsigned(RAW_VALUE_IN)));
--				count := count + 1;
--			end if;
			
		
			
--		end process;



	
	refreshOutput : process(sig_refreshDigits)
		variable realValue : integer := 0;
		--variable floatValue : real := 0.0;
		begin
			if falling_edge(sig_refreshDigits) then
				--floatValue := 10649.6 /real(to_integer(unsigned(RAW_VALUE_IN)));
				--floatValue := real(to_integer(unsigned(RAW_VALUE_IN))); -- 13 * 4096 / (RAW*VOLTAGE(5))
				if( RAW_VALUE_IN = "000000000000") then
					DigitDecade <= (others => '0');
					DigitUnit <= (others => '0');
					DigitTenth <= (others => '0');
					DigitHundredth <= (others => '0');
				else --if (NOT(( RAW_VALUE_IN = "UUUUUUUUUUUU"))) then
					
					--realValue := to_integer(unsigned(RAW_VALUE_IN));
					--realValue := (realValue*330)/2048;
					--realValue := to_integer(floatValue,realValue);
					
					
					realValue := 806787 / to_integer(unsigned(RAW_VALUE_IN));-- 13 * 4096 * 100 / (RAW*VOLTAGE(5)) --4096/5V : 1064960 2048/5V : 532480  4096/3V3 : 1613575 2048/3V3 : 806787 
					
					DigitHundredth  <= std_logic_vector(to_unsigned(realValue mod 10, DigitHundredth'length));
					realValue := realValue/10;
					DigitTenth<= std_logic_vector(to_unsigned((realValue) mod 10, DigitTenth'length));
					realValue := realValue/10;
					DigitUnit  <= std_logic_vector(to_unsigned((realValue) mod 10, DigitUnit'length));
					realValue := realValue/10;
					DigitDecade<= std_logic_vector(to_unsigned((realValue) mod 10, DigitDecade'length));
				end if;
			end if;
				
				--floatValue := 13*(4096/((integer)(RAW_VALUE_IN))*5));
			--end if;
		end process;

END Behavioral;

