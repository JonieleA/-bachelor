`timescale 1ns/1ns

module tb2;

logic clk, outclk;

del_par #(.del(2)) U1 (.clk(clk), .outclk(outclk));

initial begin
clk = 0;
end

always #1 clk = !clk;

initial #50 $stop;

endmodule