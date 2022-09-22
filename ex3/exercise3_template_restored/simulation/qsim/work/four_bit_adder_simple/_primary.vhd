library verilog;
use verilog.vl_types.all;
entity four_bit_adder_simple is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        Cin             : in     vl_logic;
        sum             : out    vl_logic_vector(3 downto 0);
        Cout            : out    vl_logic
    );
end four_bit_adder_simple;
