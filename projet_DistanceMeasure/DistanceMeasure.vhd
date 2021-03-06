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

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

LIBRARY work;

ENTITY DistanceMeasure IS 
	PORT
	(
		-- clock IN 50MHZ
		CLOCK_50M : IN STD_LOGIC;
		-- ADC CHIP SELECT
		ext_ADC_CS : out STD_LOGIC;
		-- ADC CLOCK
		ext_ADC_SCLK: out STD_LOGIC;
		-- DATA ADC
		ext_ADC_IN : in STD_LOGIC;
		-- Digit selection for 4 digit 7 segment
		SelectionDigit : out std_logic_vector (3 downto 0);
		-- 7 digits + point
		digitOUT : out std_logic_vector (7 downto 0);
		
		--TO DEBUG
		temp_ADC_OUT: out STD_LOGIC_vector (11 downto 0);
		temp_DigitDecade : out std_logic_vector (3 downto 0);
		temp_DigitUnit : out std_logic_vector (3 downto 0);
		temp_DigitTenth : out std_logic_vector (3 downto 0);
		temp_DigitHundredth : out std_logic_vector (3 downto 0)
		
	);
END DistanceMeasure;

ARCHITECTURE Behavioral OF DistanceMeasure IS 

	-- signals to realize connections between components
	signal sig_ADC_CS : std_logic:='1';
	signal sig_ADC_IN : std_logic:='1';
	signal sig_ADC_OUT : std_logic_vector (11 downto 0);

	signal sig_temp_DigitDecade : std_logic_vector (3 downto 0);
	signal sig_temp_DigitUnit : std_logic_vector (3 downto 0);
	signal sig_temp_DigitTenth : std_logic_vector (3 downto 0);
	signal sig_temp_DigitHundredth : std_logic_vector (3 downto 0);
	signal sig_DigitOUT : std_LOGIC_vector(7 downto 0);

	--*************************************************************************************
	--****************************COMPONENTS DECLATIONS ***********************************
	--*************************************************************************************

	--declation of ADC
	component ADC is
	port(
			
			ADC_CS_N : out std_logic;
			CLOCK_50MHZ : in std_logic;
			ADC_SCLK : out std_logic;--ADC clock
			ADC_DIN : in std_logic;
			ADC_DOUT : out std_logic_vector (11 downto 0)
			);
	end component;

	--declation of converter
	component rawTo4Digit is 
	port(
			CLOCK_50MHZ : in std_logic;
			RAW_VALUE_IN : in std_logic_vector (11 downto 0);
			DigitDecade : out std_logic_vector (3 downto 0);
			DigitUnit : out std_logic_vector (3 downto 0); 
			DigitTenth : out std_logic_vector (3 downto 0);
			DigitHundredth : out std_logic_vector (3 downto 0)
		);
	end component;

	--declation of multiplexer
	component multiplex7seg4digit is
	port(	
			CLOCK_50MHZ : in std_logic;
			DigitDecade : in std_logic_vector (3 downto 0);
			DigitUnit : in std_logic_vector (3 downto 0);
			DigitTenth : in std_logic_vector (3 downto 0);
			DigitHundredth : in std_logic_vector (3 downto 0);
			DigitSelection : out std_logic_vector (3 downto 0);
			DigitOUT : out std_logic_vector (7 downto 0)
		);
	end component;

	--*************************************************************************************
	--***********************DISTANCEMeasure BEHAVioral BEGIN *****************************
	--*************************************************************************************

	BEGIN
	
	-- signals connections
	ext_ADC_CS<= sig_ADC_CS ;
	sig_ADC_IN<= ext_ADC_IN ;
	temp_ADC_OUT<= sig_ADC_OUT ;

	temp_DigitDecade  <= sig_temp_DigitDecade;
	temp_DigitUnit <= sig_temp_DigitUnit;
	temp_DigitTenth <= sig_temp_DigitTenth ;
	temp_DigitHundredth <= sig_temp_DigitHundredth;
	digitOUT <= sig_DigitOUT;

	
	--*************************************************************************************
	--***********************COMPONENTS INSTANCIATIONS*************************************
	--*************************************************************************************

	--instanciation of ADC0
	ADC0 : ADC port map (
					ADC_CS_N=>sig_ADC_CS,
					CLOCK_50MHZ => CLOCK_50M,
					ADC_SCLK=>ext_ADC_SCLK,
					ADC_DIN=>sig_ADC_IN,
					ADC_DOUT=>sig_ADC_OUT);

	--instanciation of converter 				
	Converter0 : rawTo4Digit port map (
					CLOCK_50MHZ => CLOCK_50M,
					RAW_VALUE_IN => sig_ADC_OUT,
					DigitDecade => sig_temp_DigitDecade,
					DigitUnit => sig_temp_DigitUnit,
					DigitTenth => sig_temp_DigitTenth,
					DigitHundredth => sig_temp_DigitHundredth
			);	

	--instanciation of multiplexer
	multiplex0 : multiplex7seg4digit port map (
				CLOCK_50MHZ => CLOCK_50M,
				DigitDecade => sig_temp_DigitDecade,
				DigitUnit => sig_temp_DigitUnit,
				DigitTenth => sig_temp_DigitTenth,
				DigitHundredth => sig_temp_DigitHundredth,
				DigitSelection => selectionDigit,
				DigitOUT => sig_DigitOUT
				
			);

END Behavioral;