library verilog;
use verilog.vl_types.all;
entity wrong_code_tester is
    port(
        clock_50        : in     vl_logic;
        KEY             : in     vl_logic_vector(3 downto 2);
        LEDR            : out    vl_logic_vector(2 downto 0)
    );
end wrong_code_tester;
