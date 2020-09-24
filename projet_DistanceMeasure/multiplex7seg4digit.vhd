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

ENTITY multiplex7seg4digit IS 
	PORT
	(
		Clock2500kHZ : in std_logic;
		DigitDecade : in std_logic_vector (3 downto 0);
		DigitUnit : in std_logic_vector (3 downto 0);
		DigitTenth : in std_logic_vector (3 downto 0);
		DigitHundredth : in std_logic_vector (3 downto 0);
		DigitSelection : out std_logic_vector (3 downto 0);
		DigitOUT : out std_logic_vector (7 downto 0)
	);
END multiplex7seg4digit;

ARCHITECTURE behav OF multiplex7seg4digit IS 

signal clock_RefreshMux : std_logic := '0';
signal currentDigit : std_logic_vector (3 downto 0);
signal sig_DigitSelection :std_logic_vector (3 downto 0);
BEGIN 

DigitSelection <= sig_DigitSelection;
--		refreshOutput : process(currentDigit)
--			begin
--				
--				
--			end process; 
		--process(DigitDecade,DigitUnit,DigitTenth,DigitHundredth)
		refreshCurrentDigit: process(clock_RefreshMux)
			variable currentDigitSelection : integer range 0 to 3;
			begin
				if rising_edge(clock_RefreshMux) then
					case (currentDigitSelection) is
						when 0 => 
							currentDigit <= DigitDecade;
							sig_DigitSelection <= "0001";
							currentDigitSelection := 1;
						when 1 => 
							currentDigit <= DigitUnit;
							sig_DigitSelection <= "0010";
							currentDigitSelection := 2;
						when 2 => 
							currentDigit <= DigitTenth;
							sig_DigitSelection <= "0100";
							currentDigitSelection := 3;
						when 3 => 
							currentDigit <= DigitHundredth;
							sig_DigitSelection <= "1000";
							currentDigitSelection := 0;
						when others =>
							currentDigit <= "0000";
							sig_DigitSelection <= "0000";
							currentDigitSelection := 0;
					end case;
					
					case currentDigit is --A B C D E F G DP
						when "0000" => DigitOUT <= "00000010"; -- "0"     
						when "0001" => DigitOUT <= "10011110"; -- "1" 
						when "0010" => DigitOUT <= "00100100"; -- "2" 
						when "0011" => DigitOUT <= "00001100"; -- "3" 
						when "0100" => DigitOUT <= "10011000"; -- "4" 
						when "0101" => DigitOUT <= "01001000"; -- "5" 
						when "0110" => DigitOUT <= "01000000"; -- "6" 
						when "0111" => DigitOUT <= "00011110"; -- "7" 
						when "1000" => DigitOUT <= "00000000"; -- "8"     
						when "1001" => DigitOUT <= "00001000"; -- "9" 
						when "1010" => DigitOUT <= "00000100"; -- a
						when "1011" => DigitOUT <= "11000000"; -- b
						when "1100" => DigitOUT <= "01100010"; -- C
						when "1101" => DigitOUT <= "10000100"; -- d
						when "1110" => DigitOUT <= "01100000"; -- E
						when "1111" => DigitOUT <= "01110000"; -- F
						when others => DigitOUT <= "11111111"; -- nothing
					end case;
					
					
					end if;
			end process;
	
		process(Clock2500kHZ)
			variable temp : integer range 0 to 5;
			begin
				--The input frequency is divided by 20
				if rising_edge(Clock2500kHZ) then
					temp := temp + 1;
					if (temp=5) then
						clock_RefreshMux <= not(clock_RefreshMux);
						temp := 0;
					end if;
				end if;
			end process;

END behav;

