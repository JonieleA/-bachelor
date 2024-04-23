module autoupd (clk, addr, in, out, state, nextstate, rst);

input logic clk, rst;
output logic [7:0] out;
output logic [4:0] addr=0;
output enum logic [3:0] {start, CSI1, clear1, clear2, clear3, clear4, uname1, uname2, uname3, uname4, uname5, uname6, uname7} state, nextstate;
input logic [7:0] in;

always_ff @(posedge clk, posedge rst)
	if (rst == 1) addr <= 0;
	else if (nextstate == start) addr <= 0;
	else if (nextstate != start) addr = addr+1;

always_comb begin
	case (state)
		start : nextstate = (in == 8'd27) ? CSI1 : (in == 8'd99) ? clear1 : (in == 8'd117) ? uname1 : start;
		CSI1 : nextstate = (addr == 2) ? start : CSI1;
		clear1 : nextstate = (in == 8'd108) ? clear2 : (in == 0 & addr != 5) ? clear1 : start;
		clear2 : nextstate = (in == 8'd101) ? clear3 : (in == 0 & addr != 5) ? clear2 : start;
		clear3 : nextstate = (in == 8'd97) ? clear4 : (in == 0 & addr != 5) ? clear3 : start;
		clear4 : nextstate = (addr != 5) ? clear4 : start;
		
		uname1 : nextstate = (in == 8'd110) ? uname2 : (in == 0 & addr != 8) ? uname1 : start;
		uname2 : nextstate = (in == 8'd97) ? uname3 : (in == 0 & addr != 8) ? uname2 : start;
		uname3 : nextstate = (in == 8'd109) ? uname4 : (in == 0 & addr != 8) ? uname3 : start;
		uname4 : nextstate = (in == 8'd110) ? uname5 : (in == 0 & addr != 8) ? uname4 : start;
		uname5 : nextstate = (in == 8'd32) ? uname6 : (in == 0 & addr != 8) ? uname5 : start;
		uname6 : nextstate = (in == 8'd45) ? uname7 : (in == 0 & addr != 8) ? uname6 : start;
		uname7 : nextstate = (addr != 8) ? uname7 : start;
		default : nextstate = start;
	endcase
end

always_ff @(posedge clk, posedge rst)
	if (rst) state <= start;
	else state <= nextstate;
	
always_comb begin
	case (addr)
		1 : out = (state == CSI1) ? 8'd91 : (state == clear1) ? 8'd108 : (state == uname1) ? 8'd110 : 8'd0;
		2 : out = (state == clear1 | state == clear2) ? 8'd101 : (state == uname1 | state == uname2) ? 8'd97 : 8'd0;
		3 : out = (state == clear2 | state == clear2 | state == clear3) ? 8'd97 : (state == uname1 | state == uname2 | state == uname3) ? 8'd109 : 8'd0;
		4 : out = (state == clear2 | state == clear2 | state == clear3 | state == clear4) ? 8'd114 : (state == uname1 | state == uname2 | state == uname3 | state == uname4) ? 8'd101 : 8'd0;
		5 : out = (state == uname1 | state == uname2 | state == uname3 | state == uname4 | state == uname5) ? 8'd32 : 8'd0;
		6 : out = (state == uname1 | state == uname2 | state == uname3 | state == uname4 | state == uname5 | state == uname6) ? 8'd45 : 8'd0;
		7 : out = (state == uname1 | state == uname2 | state == uname3 | state == uname4 | state == uname5 | state == uname6 | state == uname7) ? 8'd97 : 8'd0;
		default : out = 8'd0; 
	endcase
end

endmodule
