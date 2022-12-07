library verilog;
use verilog.vl_types.all;
entity code_lock_simple is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        code            : in     vl_logic_vector(3 downto 0);
        enter           : in     vl_logic;
        lock            : out    vl_logic
    );
end code_lock_simple;
