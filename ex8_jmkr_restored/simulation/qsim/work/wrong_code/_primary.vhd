library verilog;
use verilog.vl_types.all;
entity wrong_code is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        err_event       : in     vl_logic;
        failed          : out    vl_logic
    );
end wrong_code;
