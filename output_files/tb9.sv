`timescale 1ns/1ns

module tb9;

logic clk, we, clear_flag, rst, overload, state, nextstate, str_clear_flag, back;
logic [7:0] in, out;
logic [$clog2(80)-1:0] str_out, clear_count;

string_ram string_ram (.in(in), .out(out), .clk(clk), .we(we), .str_out(str_out), .clear_flag(clear_flag), .rst(rst), .overload(overload), .state(state), .nextstate(nextstate), .str_clear_flag(str_clear_flag), .clear_count(clear_count), .back(back));
initial begin
 rst = 1;
 back = 0;
 we = 1;
 clk = 0;
 clear_flag = 0;
 str_out =0;
 in = 8'd101;
 #10 rst = 0;
 #500 clear_flag = 1;
 
 
end
always #1 clk=!clk;
initial #1000 $stop;

endmodule