library verilog;
use verilog.vl_types.all;
entity Code_lock_vlg_check_tst is
    port(
        lock            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Code_lock_vlg_check_tst;
