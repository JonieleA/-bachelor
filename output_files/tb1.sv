`timescale 1ns/1ns

module tb1;

logic clk, plus, minus, plus_out, minus_out;

logic [6:0] count;

schet_param #(.Schet(80)) U1 (.clk(clk), .count(count), .plus_out(plus_out), .plus(plus), .minus(minus), .minus_out(minus_out));

initial begin
clk = 0;
plus = 0;
minus = 0;
end
always #1 plus = !plus;
always #1 clk = !clk;

initial #170 $stop;

endmodule