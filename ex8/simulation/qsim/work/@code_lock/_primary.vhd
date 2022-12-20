library verilog;
use verilog.vl_types.all;
entity Code_lock is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enter           : in     vl_logic;
        code            : in     vl_logic_vector(3 downto 0);
        lock            : out    vl_logic
    );
end Code_lock;
