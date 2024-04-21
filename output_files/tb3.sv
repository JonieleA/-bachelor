`timescale 1ns/1ns

module tb3;

logic clk, Delete, CUF, CUB, CNL, CPL, CHA, CUP, ED, EL, SU, SD, HVP, SCP, RCP, Clear, Uname, _rst;
logic [6:0] str;
logic [7:0] in;
logic [4:0] state, nextstate;
commands commands(in, clk, str, Delete, CUF, CUB, CNL, CPL, CHA, CUP, ED, EL, SU, SD, HVP, SCP, RCP, Clear, Uname, _rst, state, nextstate);

initial begin
clk = 0;
_rst= 1;
end
always #1 clk = !clk;
initial begin
in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd51;
#2 in = 8'd126;
#2 in = 0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd67;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd68;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd69;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd70;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd71;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd72;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd74;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd75;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd83;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd84;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd102;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd115;
#2 in = 8'd0;
#2 in = 8'd27;
#2 in = 8'd91;
#2 in = 8'd117;
#2 in = 8'd0;
#2 in = 8'd99;
#2 in = 8'd108;
#2 in = 8'd101;
#2 in = 8'd97;
#2 in = 8'd114;
#2 in = 8'd0;
#2 in = 8'd117;
#2 in = 8'd110;
#2 in = 8'd97;
#2 in = 8'd109;
#2 in = 8'd101;
#2 in = 8'd32;
#2 in = 8'd45;
#2 in = 8'd97;
#2 in = 0;

end

initial #500 $stop;

endmodule