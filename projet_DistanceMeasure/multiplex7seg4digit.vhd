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


-- CE COMPOSANT PREND EN ENTREE 4 DIGITS SUR 4 BITS ET CREE LE MULTIPLEXAGE POUR AFFICHER LES DIGITS SUR UN AFFICHEUR 7SEG A 4 DIGITS
-- fréquence de rafraichissement de l'afficheur (clignotement) : 50 HZ

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

LIBRARY work;

ENTITY multiplex7seg4digit IS 
	PORT
	(	
		-- INPUT cloCK_50MHZ
		CLOCK_50MHZ : in std_logic;
		-- 4 input digits to apply on 4 digits 7 segment
		DigitDecade : in std_logic_vector (3 downto 0);
		DigitUnit : in std_logic_vector (3 downto 0);
		DigitTenth : in std_logic_vector (3 downto 0);
		DigitHundredth : in std_logic_vector (3 downto 0);
		-- Digit selection for 4 digit 7 segment
		DigitSelection : out std_logic_vector (3 downto 0);
		-- 7 digits + point
		DigitOUT : out std_logic_vector (7 downto 0)
	);
END multiplex7seg4digit;

ARCHITECTURE behav OF multiplex7seg4digit IS 

signal clock_RefreshMux : std_logic := '0';
signal currentDigit : std_logic_vector (3 downto 0);

BEGIN 

	--*************************************************************************************
	--*************************************************************************************
	
	-- refresh digitis when rising edge on clock_RefreshMux
	refreshCurrentDigit: process(clock_RefreshMux)
		variable currentDigitSelection : integer range 0 to 3;
		begin
			if rising_edge(clock_RefreshMux) then
				case (currentDigitSelection) is
					when 0 => 
						currentDigit <= DigitDecade;
						DigitSelection <= "1110";
						currentDigitSelection := 1;
					when 1 => 
						currentDigit <= DigitUnit;
						DigitSelection <= "1101";
						currentDigitSelection := 2;
					when 2 => 
						currentDigit <= DigitTenth;
						DigitSelection <= "1011";
						currentDigitSelection := 3;
					when 3 => 
						currentDigit <= DigitHundredth;
						DigitSelection <= "0111";
						currentDigitSelection := 0;
					when others =>
						currentDigit <= "0000";
						DigitSelection <= "0000";
						currentDigitSelection := 0;
				end case;
				
				case currentDigit is --DP G F E D C B A ---------- A B C D E F G DP
					when "0000" => DigitOUT <= "10111111"; -- "0"     
					when "0001" => DigitOUT <= "10000110"; -- "1" 
					when "0010" => DigitOUT <= "11011011"; -- "2" 
					when "0011" => DigitOUT <= "11001111"; -- "3" 
					when "0100" => DigitOUT <= "11100110"; -- "4" 
					when "0101" => DigitOUT <= "11101101"; -- "5" 
					when "0110" => DigitOUT <= "11111101"; -- "6" 
					when "0111" => DigitOUT <= "10000111"; -- "7" 
					when "1000" => DigitOUT <= "11111111"; -- "8"     
					when "1001" => DigitOUT <= "11101111"; -- "9" 
					when others => DigitOUT <= "00000000"; -- nothing
				end case;
				end if;
		end process;
				
		--*************************************************************************************
		--*************************************************************************************
		
		-- CLOCK DIVIDER
		process(CLOCK_50MHZ)
			variable temp : integer range 0 to 250000;
			begin
				if rising_edge(CLOCK_50MHZ) then
					temp := temp + 1;
					if (temp=125000) then -- 50MHZ/2/50Hz/4digits
						clock_RefreshMux <= not(clock_RefreshMux);
						temp := 0;
					end if;
				end if;
			end process;
		--*************************************************************************************
		--*************************************************************************************
		
END behav;

