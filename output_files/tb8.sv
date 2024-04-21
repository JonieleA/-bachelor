`timescale 1ns/1ns

module tb8;

logic enter, clk, overflow, tab, rst;
logic [1:0] state, nextstate;

ram_use ram_use(.enter(enter), .clk(clk), .state(state), .nextstate(nextstate), .rst(rst), .overflow(overflow), .tab(tab));

initial begin
 rst = 1;
 clk = 0;
 enter = 0;
 overflow=0;
 tab=0;
 #10;
 rst = 0;
 #6;
 enter = 1;
 #100;
 enter = 0;
 #10;
 overflow = 1;
 #2 overflow = 0;
 #10000 tab = 1;
 #2 tab=0;
end
always #1 clk=!clk;
initial #20000 $stop;

endmodule