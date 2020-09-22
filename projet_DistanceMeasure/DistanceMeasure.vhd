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

ENTITY DistanceMeasure IS 
	PORT
	(
		reset : IN STD_LOGIC;
		CLOCK_50M : IN STD_LOGIC;
		OUTPUT :  OUT  STD_LOGIC;
		chip_select : out std_logic;
		the_ADC_CS : out STD_LOGIC;
		the_ADC_SCLK: out STD_LOGIC;
		the_ADC_IN : out STD_LOGIC;
		the_ADC_OUT: IN STD_LOGIC_vector (11 downto 0)
		
		
	);
END DistanceMeasure;

ARCHITECTURE Behavioral OF DistanceMeasure IS 

--variable Count : unsigned integer:=0;
signal clock_ADC_temp: std_logic;
signal sig_ADC_CS :std_logic;
signal sig_ADC_IN :std_logic;
signal sig_ADC_OUT :std_logic_vector (11 downto 0);



component freq_div is
port( clock_in : in std_logic;
		clock_out : out std_logic);
end component;

component ADC is
port(
		
		ADC_CS : out std_logic;
		ADC_SCLK : in std_logic;--ADC clock
		ADC_DIN : in std_logic;
		ADC_DOUT : out std_logic_vector (11 downto 0)
		);
end component;


BEGIN
the_ADC_CS<= sig_ADC_CS ;
the_ADC_IN<= sig_ADC_IN ;
sig_ADC_OUT <= the_ADC_OUT;
fd1 : freq_div port map (clock_in=>CLOCK_50M,clock_out=>clock_ADC_temp);
OUTPUT<=clock_ADC_temp;
ADC0 : ADC port map (
				ADC_CS=>sig_ADC_CS,
				ADC_SCLK=>clock_ADC_temp,
				ADC_DIN=>sig_ADC_IN,
				ADC_DOUT=>sig_ADC_OUT);



END Behavioral;