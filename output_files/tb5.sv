
module tb5();
// Inputs
logic ps2_clk, clk, flag, flag_del;
logic data;

// Outputs
logic [7:0] out, code;
logic [11:0] str_out, str_in, count_str, count_tab;

top top (.ps2_clk(ps2_clk), .data(data), .out(out), .str_out(str_out), .str_in(str_in), .clk(clk), .flag(flag), .code(code), .flag_del(flag_del), .count_str(count_str), .count_tab(count_tab));

initial begin
	str_out = 0;
	clk = 1;
    // Initialize Inputs
    #50 ps2_clk = 1;
    #50 data = 1;
        
    // 0 - Start
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 1
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 2
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 3
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 4
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 5
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 6
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 7
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 8
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 9 - Parity Bit
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 10 - End
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 
	 // 0 - Start
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    
	 // 1
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 2
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 3
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 4
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 5
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 6
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 7
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 8
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 9 - Parity
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 10 - End
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;

    // Break code
	 // 0 - Start
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 1
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 2
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 3
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 4
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 5
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 6
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 7
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 8
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 9 - Parity
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 10 - Stop
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
end
always #50 clk = !clk;
initial #2500 str_out = 1;
initial #3400 $stop;
endmodule // KeyboardController_testbench
