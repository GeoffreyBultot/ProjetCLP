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

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "09/22/2020 11:48:14"

-- 
-- Device: Altera EP4CE22E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DistanceMeasure IS
    PORT (
	reset : IN std_logic;
	CLOCK_50M : IN std_logic;
	OUTPUT : OUT std_logic;
	chip_select : OUT std_logic;
	the_ADC_CS : OUT std_logic;
	the_ADC_SCLK : OUT std_logic;
	the_ADC_IN : OUT std_logic;
	the_ADC_OUT : IN std_logic_vector(11 DOWNTO 0)
	);
END DistanceMeasure;

-- Design Ports Information
-- reset	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OUTPUT	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- chip_select	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_CS	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_SCLK	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_IN	=>  Location: PIN_72,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[0]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[1]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[2]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[3]	=>  Location: PIN_67,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[4]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[5]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[6]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[7]	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[8]	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[9]	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[10]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- the_ADC_OUT[11]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50M	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DistanceMeasure IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_CLOCK_50M : std_logic;
SIGNAL ww_OUTPUT : std_logic;
SIGNAL ww_chip_select : std_logic;
SIGNAL ww_the_ADC_CS : std_logic;
SIGNAL ww_the_ADC_SCLK : std_logic;
SIGNAL ww_the_ADC_IN : std_logic;
SIGNAL ww_the_ADC_OUT : std_logic_vector(11 DOWNTO 0);
SIGNAL \fd1|clock_temp~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50M~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[0]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[1]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[2]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[3]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[4]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[5]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[6]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[7]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[8]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[9]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[10]~input_o\ : std_logic;
SIGNAL \the_ADC_OUT[11]~input_o\ : std_logic;
SIGNAL \OUTPUT~output_o\ : std_logic;
SIGNAL \chip_select~output_o\ : std_logic;
SIGNAL \the_ADC_CS~output_o\ : std_logic;
SIGNAL \the_ADC_SCLK~output_o\ : std_logic;
SIGNAL \the_ADC_IN~output_o\ : std_logic;
SIGNAL \CLOCK_50M~input_o\ : std_logic;
SIGNAL \CLOCK_50M~inputclkctrl_outclk\ : std_logic;
SIGNAL \fd1|temp[0]~0_combout\ : std_logic;
SIGNAL \fd1|Add0~2_combout\ : std_logic;
SIGNAL \fd1|Add0~1_combout\ : std_logic;
SIGNAL \fd1|Add0~0_combout\ : std_logic;
SIGNAL \fd1|Add0~3_combout\ : std_logic;
SIGNAL \fd1|Add0~4_combout\ : std_logic;
SIGNAL \fd1|clock_temp~0_combout\ : std_logic;
SIGNAL \fd1|clock_temp~1_combout\ : std_logic;
SIGNAL \fd1|clock_temp~feeder_combout\ : std_logic;
SIGNAL \fd1|clock_temp~q\ : std_logic;
SIGNAL \fd1|clock_temp~clkctrl_outclk\ : std_logic;
SIGNAL \ADC0|temp[0]~0_combout\ : std_logic;
SIGNAL \ADC0|Add0~3_combout\ : std_logic;
SIGNAL \ADC0|Add0~4_combout\ : std_logic;
SIGNAL \ADC0|Add0~2_combout\ : std_logic;
SIGNAL \ADC0|Add0~0_combout\ : std_logic;
SIGNAL \ADC0|Add0~1_combout\ : std_logic;
SIGNAL \ADC0|Equal0~0_combout\ : std_logic;
SIGNAL \ADC0|Equal0~1_combout\ : std_logic;
SIGNAL \ADC0|enable~q\ : std_logic;
SIGNAL \fd1|temp\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ADC0|temp\ : std_logic_vector(4 DOWNTO 0);

BEGIN

ww_reset <= reset;
ww_CLOCK_50M <= CLOCK_50M;
OUTPUT <= ww_OUTPUT;
chip_select <= ww_chip_select;
the_ADC_CS <= ww_the_ADC_CS;
the_ADC_SCLK <= ww_the_ADC_SCLK;
the_ADC_IN <= ww_the_ADC_IN;
ww_the_ADC_OUT <= the_ADC_OUT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\fd1|clock_temp~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \fd1|clock_temp~q\);

\CLOCK_50M~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50M~input_o\);

-- Location: IOOBUF_X0_Y14_N2
\OUTPUT~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fd1|clock_temp~q\,
	devoe => ww_devoe,
	o => \OUTPUT~output_o\);

-- Location: IOOBUF_X45_Y34_N2
\chip_select~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \chip_select~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\the_ADC_CS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ADC0|enable~q\,
	devoe => ww_devoe,
	o => \the_ADC_CS~output_o\);

-- Location: IOOBUF_X53_Y24_N23
\the_ADC_SCLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \the_ADC_SCLK~output_o\);

-- Location: IOOBUF_X49_Y0_N2
\the_ADC_IN~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \the_ADC_IN~output_o\);

-- Location: IOIBUF_X0_Y16_N8
\CLOCK_50M~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50M,
	o => \CLOCK_50M~input_o\);

-- Location: CLKCTRL_G2
\CLOCK_50M~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50M~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50M~inputclkctrl_outclk\);

-- Location: LCCOMB_X1_Y16_N26
\fd1|temp[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fd1|temp[0]~0_combout\ = !\fd1|temp\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fd1|temp\(0),
	combout => \fd1|temp[0]~0_combout\);

-- Location: FF_X1_Y16_N27
\fd1|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50M~inputclkctrl_outclk\,
	d => \fd1|temp[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fd1|temp\(0));

-- Location: LCCOMB_X1_Y16_N22
\fd1|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \fd1|Add0~2_combout\ = \fd1|temp\(0) $ (\fd1|temp\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fd1|temp\(0),
	datac => \fd1|temp\(1),
	combout => \fd1|Add0~2_combout\);

-- Location: FF_X1_Y16_N23
\fd1|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50M~inputclkctrl_outclk\,
	d => \fd1|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fd1|temp\(1));

-- Location: LCCOMB_X1_Y16_N4
\fd1|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fd1|Add0~1_combout\ = \fd1|temp\(2) $ (((\fd1|temp\(0) & \fd1|temp\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fd1|temp\(0),
	datac => \fd1|temp\(2),
	datad => \fd1|temp\(1),
	combout => \fd1|Add0~1_combout\);

-- Location: FF_X1_Y16_N5
\fd1|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50M~inputclkctrl_outclk\,
	d => \fd1|Add0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fd1|temp\(2));

-- Location: LCCOMB_X1_Y16_N10
\fd1|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fd1|Add0~0_combout\ = \fd1|temp\(3) $ (((\fd1|temp\(0) & (\fd1|temp\(2) & \fd1|temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fd1|temp\(0),
	datab => \fd1|temp\(2),
	datac => \fd1|temp\(3),
	datad => \fd1|temp\(1),
	combout => \fd1|Add0~0_combout\);

-- Location: FF_X1_Y16_N11
\fd1|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50M~inputclkctrl_outclk\,
	d => \fd1|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fd1|temp\(3));

-- Location: LCCOMB_X1_Y16_N28
\fd1|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \fd1|Add0~3_combout\ = (!\fd1|temp\(2)) # (!\fd1|temp\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fd1|temp\(1),
	datad => \fd1|temp\(2),
	combout => \fd1|Add0~3_combout\);

-- Location: LCCOMB_X1_Y16_N6
\fd1|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \fd1|Add0~4_combout\ = \fd1|temp\(4) $ (((\fd1|temp\(0) & (\fd1|temp\(3) & !\fd1|Add0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fd1|temp\(0),
	datab => \fd1|temp\(3),
	datac => \fd1|temp\(4),
	datad => \fd1|Add0~3_combout\,
	combout => \fd1|Add0~4_combout\);

-- Location: FF_X1_Y16_N7
\fd1|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50M~inputclkctrl_outclk\,
	d => \fd1|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fd1|temp\(4));

-- Location: LCCOMB_X1_Y16_N20
\fd1|clock_temp~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fd1|clock_temp~0_combout\ = (\fd1|temp\(1) & (!\fd1|temp\(2) & \fd1|temp\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fd1|temp\(1),
	datac => \fd1|temp\(2),
	datad => \fd1|temp\(4),
	combout => \fd1|clock_temp~0_combout\);

-- Location: LCCOMB_X1_Y16_N12
\fd1|clock_temp~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fd1|clock_temp~1_combout\ = \fd1|clock_temp~q\ $ (((!\fd1|temp\(3) & (\fd1|temp\(0) & \fd1|clock_temp~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fd1|temp\(3),
	datab => \fd1|clock_temp~q\,
	datac => \fd1|temp\(0),
	datad => \fd1|clock_temp~0_combout\,
	combout => \fd1|clock_temp~1_combout\);

-- Location: LCCOMB_X1_Y16_N14
\fd1|clock_temp~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \fd1|clock_temp~feeder_combout\ = \fd1|clock_temp~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fd1|clock_temp~1_combout\,
	combout => \fd1|clock_temp~feeder_combout\);

-- Location: FF_X1_Y16_N15
\fd1|clock_temp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50M~inputclkctrl_outclk\,
	d => \fd1|clock_temp~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fd1|clock_temp~q\);

-- Location: CLKCTRL_G4
\fd1|clock_temp~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \fd1|clock_temp~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \fd1|clock_temp~clkctrl_outclk\);

-- Location: LCCOMB_X21_Y1_N22
\ADC0|temp[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|temp[0]~0_combout\ = !\ADC0|temp\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ADC0|temp\(0),
	combout => \ADC0|temp[0]~0_combout\);

-- Location: FF_X21_Y1_N23
\ADC0|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \fd1|clock_temp~clkctrl_outclk\,
	d => \ADC0|temp[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|temp\(0));

-- Location: LCCOMB_X21_Y1_N2
\ADC0|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Add0~3_combout\ = \ADC0|temp\(1) $ (\ADC0|temp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ADC0|temp\(1),
	datad => \ADC0|temp\(0),
	combout => \ADC0|Add0~3_combout\);

-- Location: FF_X21_Y1_N3
\ADC0|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \fd1|clock_temp~clkctrl_outclk\,
	d => \ADC0|Add0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|temp\(1));

-- Location: LCCOMB_X21_Y1_N24
\ADC0|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Add0~4_combout\ = \ADC0|temp\(3) $ (((\ADC0|temp\(2) & (\ADC0|temp\(1) & \ADC0|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|temp\(2),
	datab => \ADC0|temp\(1),
	datac => \ADC0|temp\(3),
	datad => \ADC0|temp\(0),
	combout => \ADC0|Add0~4_combout\);

-- Location: FF_X21_Y1_N25
\ADC0|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \fd1|clock_temp~clkctrl_outclk\,
	d => \ADC0|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|temp\(3));

-- Location: LCCOMB_X21_Y1_N8
\ADC0|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Add0~2_combout\ = \ADC0|temp\(2) $ (((\ADC0|temp\(1) & \ADC0|temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADC0|temp\(1),
	datac => \ADC0|temp\(2),
	datad => \ADC0|temp\(0),
	combout => \ADC0|Add0~2_combout\);

-- Location: FF_X21_Y1_N9
\ADC0|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \fd1|clock_temp~clkctrl_outclk\,
	d => \ADC0|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|temp\(2));

-- Location: LCCOMB_X21_Y1_N6
\ADC0|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Add0~0_combout\ = (\ADC0|temp\(0) & (\ADC0|temp\(2) & \ADC0|temp\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|temp\(0),
	datac => \ADC0|temp\(2),
	datad => \ADC0|temp\(1),
	combout => \ADC0|Add0~0_combout\);

-- Location: LCCOMB_X21_Y1_N26
\ADC0|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Add0~1_combout\ = \ADC0|temp\(4) $ (((\ADC0|temp\(3) & \ADC0|Add0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADC0|temp\(3),
	datac => \ADC0|temp\(4),
	datad => \ADC0|Add0~0_combout\,
	combout => \ADC0|Add0~1_combout\);

-- Location: FF_X21_Y1_N27
\ADC0|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \fd1|clock_temp~clkctrl_outclk\,
	d => \ADC0|Add0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|temp\(4));

-- Location: LCCOMB_X21_Y1_N12
\ADC0|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Equal0~0_combout\ = (\ADC0|temp\(0) & \ADC0|temp\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ADC0|temp\(0),
	datad => \ADC0|temp\(3),
	combout => \ADC0|Equal0~0_combout\);

-- Location: LCCOMB_X21_Y1_N28
\ADC0|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Equal0~1_combout\ = (\ADC0|temp\(2) & (\ADC0|temp\(1) & (!\ADC0|temp\(4) & \ADC0|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|temp\(2),
	datab => \ADC0|temp\(1),
	datac => \ADC0|temp\(4),
	datad => \ADC0|Equal0~0_combout\,
	combout => \ADC0|Equal0~1_combout\);

-- Location: FF_X21_Y1_N29
\ADC0|enable\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \fd1|clock_temp~clkctrl_outclk\,
	d => \ADC0|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|enable~q\);

-- Location: IOIBUF_X18_Y34_N1
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X0_Y6_N15
\the_ADC_OUT[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(0),
	o => \the_ADC_OUT[0]~input_o\);

-- Location: IOIBUF_X53_Y14_N1
\the_ADC_OUT[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(1),
	o => \the_ADC_OUT[1]~input_o\);

-- Location: IOIBUF_X53_Y20_N22
\the_ADC_OUT[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(2),
	o => \the_ADC_OUT[2]~input_o\);

-- Location: IOIBUF_X43_Y0_N15
\the_ADC_OUT[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(3),
	o => \the_ADC_OUT[3]~input_o\);

-- Location: IOIBUF_X38_Y34_N15
\the_ADC_OUT[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(4),
	o => \the_ADC_OUT[4]~input_o\);

-- Location: IOIBUF_X29_Y34_N15
\the_ADC_OUT[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(5),
	o => \the_ADC_OUT[5]~input_o\);

-- Location: IOIBUF_X27_Y0_N22
\the_ADC_OUT[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(6),
	o => \the_ADC_OUT[6]~input_o\);

-- Location: IOIBUF_X27_Y0_N15
\the_ADC_OUT[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(7),
	o => \the_ADC_OUT[7]~input_o\);

-- Location: IOIBUF_X36_Y0_N22
\the_ADC_OUT[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(8),
	o => \the_ADC_OUT[8]~input_o\);

-- Location: IOIBUF_X0_Y16_N15
\the_ADC_OUT[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(9),
	o => \the_ADC_OUT[9]~input_o\);

-- Location: IOIBUF_X0_Y16_N22
\the_ADC_OUT[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(10),
	o => \the_ADC_OUT[10]~input_o\);

-- Location: IOIBUF_X34_Y0_N22
\the_ADC_OUT[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_the_ADC_OUT(11),
	o => \the_ADC_OUT[11]~input_o\);

ww_OUTPUT <= \OUTPUT~output_o\;

ww_chip_select <= \chip_select~output_o\;

ww_the_ADC_CS <= \the_ADC_CS~output_o\;

ww_the_ADC_SCLK <= \the_ADC_SCLK~output_o\;

ww_the_ADC_IN <= \the_ADC_IN~output_o\;
END structure;


