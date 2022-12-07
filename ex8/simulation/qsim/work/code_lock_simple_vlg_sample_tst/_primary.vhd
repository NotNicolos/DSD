library verilog;
use verilog.vl_types.all;
entity code_lock_simple_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        code            : in     vl_logic_vector(3 downto 0);
        enter           : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end code_lock_simple_vlg_sample_tst;
