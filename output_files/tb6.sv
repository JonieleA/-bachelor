`timescale 1ns/1ns

module tb6;

logic clk, out;
delay_param #(.delay(5)) delay (.clk(clk), .out(out));

initial begin
clk = 0;
end
always #1 clk = !clk;
initial #50 $stop;

endmodule