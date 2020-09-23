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

-- DATE "09/23/2020 17:20:39"

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
	CLOCK_50M : IN std_logic;
	CLOCK_25M : IN std_logic;
	ext_ADC_CS : OUT std_logic;
	ext_ADC_SCLK : OUT std_logic;
	ext_ADC_IN : OUT std_logic;
	temp_ADC_OUT : IN std_logic_vector(11 DOWNTO 0)
	);
END DistanceMeasure;

-- Design Ports Information
-- CLOCK_50M	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ext_ADC_CS	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ext_ADC_SCLK	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ext_ADC_IN	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[0]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[1]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[2]	=>  Location: PIN_72,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[3]	=>  Location: PIN_103,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[4]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[5]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[6]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[7]	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[8]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[9]	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[10]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- temp_ADC_OUT[11]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_25M	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_CLOCK_50M : std_logic;
SIGNAL ww_CLOCK_25M : std_logic;
SIGNAL ww_ext_ADC_CS : std_logic;
SIGNAL ww_ext_ADC_SCLK : std_logic;
SIGNAL ww_ext_ADC_IN : std_logic;
SIGNAL ww_temp_ADC_OUT : std_logic_vector(11 DOWNTO 0);
SIGNAL \CLOCK_25M~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ADC0|Add0~1_combout\ : std_logic;
SIGNAL \CLOCK_50M~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[0]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[1]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[2]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[3]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[4]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[5]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[6]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[7]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[8]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[9]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[10]~input_o\ : std_logic;
SIGNAL \temp_ADC_OUT[11]~input_o\ : std_logic;
SIGNAL \ext_ADC_CS~output_o\ : std_logic;
SIGNAL \ext_ADC_SCLK~output_o\ : std_logic;
SIGNAL \ext_ADC_IN~output_o\ : std_logic;
SIGNAL \CLOCK_25M~input_o\ : std_logic;
SIGNAL \CLOCK_25M~inputclkctrl_outclk\ : std_logic;
SIGNAL \ADC0|temp[0]~0_combout\ : std_logic;
SIGNAL \ADC0|Add0~3_combout\ : std_logic;
SIGNAL \ADC0|Add0~2_combout\ : std_logic;
SIGNAL \ADC0|Add0~0_combout\ : std_logic;
SIGNAL \ADC0|Add0~4_combout\ : std_logic;
SIGNAL \ADC0|Equal0~0_combout\ : std_logic;
SIGNAL \ADC0|Equal0~1_combout\ : std_logic;
SIGNAL \ADC0|enable~q\ : std_logic;
SIGNAL \ADC0|temp\ : std_logic_vector(4 DOWNTO 0);

BEGIN

ww_CLOCK_50M <= CLOCK_50M;
ww_CLOCK_25M <= CLOCK_25M;
ext_ADC_CS <= ww_ext_ADC_CS;
ext_ADC_SCLK <= ww_ext_ADC_SCLK;
ext_ADC_IN <= ww_ext_ADC_IN;
ww_temp_ADC_OUT <= temp_ADC_OUT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_25M~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_25M~input_o\);

-- Location: FF_X4_Y1_N7
\ADC0|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_25M~inputclkctrl_outclk\,
	d => \ADC0|Add0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|temp\(3));

-- Location: LCCOMB_X4_Y1_N6
\ADC0|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Add0~1_combout\ = \ADC0|temp\(3) $ (((\ADC0|temp\(1) & (\ADC0|temp\(2) & \ADC0|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|temp\(1),
	datab => \ADC0|temp\(2),
	datac => \ADC0|temp\(3),
	datad => \ADC0|temp\(0),
	combout => \ADC0|Add0~1_combout\);

-- Location: IOOBUF_X3_Y0_N2
\ext_ADC_CS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ADC0|enable~q\,
	devoe => ww_devoe,
	o => \ext_ADC_CS~output_o\);

-- Location: IOOBUF_X0_Y14_N2
\ext_ADC_SCLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CLOCK_25M~input_o\,
	devoe => ww_devoe,
	o => \ext_ADC_SCLK~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\ext_ADC_IN~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ext_ADC_IN~output_o\);

-- Location: IOIBUF_X0_Y16_N8
\CLOCK_25M~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_25M,
	o => \CLOCK_25M~input_o\);

-- Location: CLKCTRL_G2
\CLOCK_25M~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_25M~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_25M~inputclkctrl_outclk\);

-- Location: LCCOMB_X4_Y1_N2
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

-- Location: FF_X4_Y1_N3
\ADC0|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_25M~inputclkctrl_outclk\,
	d => \ADC0|temp[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|temp\(0));

-- Location: LCCOMB_X4_Y1_N0
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

-- Location: FF_X4_Y1_N1
\ADC0|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_25M~inputclkctrl_outclk\,
	d => \ADC0|Add0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|temp\(1));

-- Location: LCCOMB_X4_Y1_N4
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

-- Location: FF_X4_Y1_N5
\ADC0|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_25M~inputclkctrl_outclk\,
	d => \ADC0|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|temp\(2));

-- Location: LCCOMB_X4_Y1_N10
\ADC0|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Add0~0_combout\ = (\ADC0|temp\(1) & (\ADC0|temp\(2) & \ADC0|temp\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADC0|temp\(1),
	datac => \ADC0|temp\(2),
	datad => \ADC0|temp\(0),
	combout => \ADC0|Add0~0_combout\);

-- Location: LCCOMB_X4_Y1_N28
\ADC0|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Add0~4_combout\ = \ADC0|temp\(4) $ (((\ADC0|temp\(3) & \ADC0|Add0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|temp\(3),
	datac => \ADC0|temp\(4),
	datad => \ADC0|Add0~0_combout\,
	combout => \ADC0|Add0~4_combout\);

-- Location: FF_X4_Y1_N29
\ADC0|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_25M~inputclkctrl_outclk\,
	d => \ADC0|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|temp\(4));

-- Location: LCCOMB_X4_Y1_N30
\ADC0|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Equal0~0_combout\ = (\ADC0|temp\(3) & (\ADC0|temp\(1) & (\ADC0|temp\(2) & \ADC0|temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|temp\(3),
	datab => \ADC0|temp\(1),
	datac => \ADC0|temp\(2),
	datad => \ADC0|temp\(0),
	combout => \ADC0|Equal0~0_combout\);

-- Location: LCCOMB_X4_Y1_N20
\ADC0|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ADC0|Equal0~1_combout\ = (\ADC0|Equal0~0_combout\ & (\ADC0|temp\(4) $ (((\ADC0|temp\(3) & \ADC0|Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|temp\(3),
	datab => \ADC0|temp\(4),
	datac => \ADC0|Equal0~0_combout\,
	datad => \ADC0|Add0~0_combout\,
	combout => \ADC0|Equal0~1_combout\);

-- Location: FF_X4_Y1_N21
\ADC0|enable\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_25M~inputclkctrl_outclk\,
	d => \ADC0|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ADC0|enable~q\);

-- Location: IOIBUF_X18_Y34_N1
\CLOCK_50M~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50M,
	o => \CLOCK_50M~input_o\);

-- Location: IOIBUF_X49_Y34_N8
\temp_ADC_OUT[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(0),
	o => \temp_ADC_OUT[0]~input_o\);

-- Location: IOIBUF_X0_Y23_N22
\temp_ADC_OUT[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(1),
	o => \temp_ADC_OUT[1]~input_o\);

-- Location: IOIBUF_X49_Y0_N1
\temp_ADC_OUT[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(2),
	o => \temp_ADC_OUT[2]~input_o\);

-- Location: IOIBUF_X53_Y22_N8
\temp_ADC_OUT[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(3),
	o => \temp_ADC_OUT[3]~input_o\);

-- Location: IOIBUF_X47_Y34_N22
\temp_ADC_OUT[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(4),
	o => \temp_ADC_OUT[4]~input_o\);

-- Location: IOIBUF_X45_Y34_N8
\temp_ADC_OUT[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(5),
	o => \temp_ADC_OUT[5]~input_o\);

-- Location: IOIBUF_X27_Y0_N22
\temp_ADC_OUT[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(6),
	o => \temp_ADC_OUT[6]~input_o\);

-- Location: IOIBUF_X27_Y0_N15
\temp_ADC_OUT[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(7),
	o => \temp_ADC_OUT[7]~input_o\);

-- Location: IOIBUF_X29_Y34_N15
\temp_ADC_OUT[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(8),
	o => \temp_ADC_OUT[8]~input_o\);

-- Location: IOIBUF_X0_Y16_N15
\temp_ADC_OUT[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(9),
	o => \temp_ADC_OUT[9]~input_o\);

-- Location: IOIBUF_X0_Y16_N22
\temp_ADC_OUT[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(10),
	o => \temp_ADC_OUT[10]~input_o\);

-- Location: IOIBUF_X11_Y0_N22
\temp_ADC_OUT[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_temp_ADC_OUT(11),
	o => \temp_ADC_OUT[11]~input_o\);

ww_ext_ADC_CS <= \ext_ADC_CS~output_o\;

ww_ext_ADC_SCLK <= \ext_ADC_SCLK~output_o\;

ww_ext_ADC_IN <= \ext_ADC_IN~output_o\;
END structure;


