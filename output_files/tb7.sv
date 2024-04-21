`timescale 1ns/1ns

module tb7;

logic [$clog2(80)-1:0] str;
logic [$clog2(48)-1:0] tab;
logic [$clog2(3840)-1:0] out;

addr_sum addr_sum(.str(str), .tab(tab), .out(out));

initial begin
str = 79;
tab = 47;
end

initial #10 $stop;

endmodule