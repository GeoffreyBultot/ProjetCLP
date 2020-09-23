library verilog;
use verilog.vl_types.all;
entity DistanceMeasure is
    port(
        CLOCK_50M       : in     vl_logic;
        CLOCK_25M       : in     vl_logic;
        ext_ADC_CS      : out    vl_logic;
        ext_ADC_SCLK    : out    vl_logic;
        ext_ADC_IN      : in     vl_logic;
        temp_ADC_OUT    : out    vl_logic_vector(11 downto 0);
        temp_DigitDecade: out    vl_logic_vector(3 downto 0);
        temp_DigitUnit  : out    vl_logic_vector(3 downto 0);
        temp_DigitTenth : out    vl_logic_vector(3 downto 0);
        temp_DigitHundredth: out    vl_logic_vector(3 downto 0)
    );
end DistanceMeasure;
