module commands(in, clk, str, Delete, CUF, CUB, CNL, CPL, CHA, CUP, ED, EL, SU, SD, HVP, SCP, RCP, Clear, Uname, _rst, state, nextstate);

input logic [7:0] in;
input logic clk;
output logic _rst=1;
output logic Delete, CUF, CUB, CNL, CPL, CHA, CUP, ED, EL, SU, SD, HVP, SCP, RCP, Clear, Uname;
output logic [6:0] str;
output enum logic [4:0] {zero, csi1, csi2, delete1, delete2, cuf, cub, cnl, cpl, cha, cup, ed, el, su, sd, hvp, scp, rcp, uname1, uname2, uname3, uname4, uname5, uname6, uname7, uname8, clear1, clear2, clear3, clear4, clear5} state=zero, nextstate;

logic [4:0] gnd=0;

schet_param #(.Schet(80)) schet (.clk(clk), .count(str), .plus_out(gnd[0]), .minus_out(gnd[1]), .plus(clk), .minus(gnd[2]));

always_ff @(posedge clk, negedge _rst)
	if (!_rst) state <= zero;
	else state <= nextstate;

always_comb begin
	case (state)
		zero : nextstate = (in == 8'd27) ? csi1: (in==8'd99) ? clear1: (in == 8'd117) ? uname1:zero;
		csi1 : nextstate = (in == 8'd91) ? csi2: zero;
		csi2 : nextstate = (in == 8'd51) ? delete1 : (in == 8'd67) ? cuf : (in == 8'd68) ? cub : (in == 8'd69) ? cnl : (in == 8'd70) ? cpl : (in == 8'd71) ? cha : (in == 8'd72) ? cup : (in == 8'd74) ? ed : (in == 8'd75) ? el : (in == 8'd83) ? su : (in == 8'd84) ? sd : (in == 8'd102) ? hvp : (in == 8'd115) ? scp : (in == 8'd117) ? rcp : zero;
		delete1 : nextstate = (in == 8'd126) ? delete2:zero;
		clear1 : nextstate = (in == 8'd108) ? clear2:zero;
		clear2 : nextstate = (in == 8'd101) ? clear3:zero;
		clear3 : nextstate = (in == 8'd97) ? clear4:zero;
		clear4 : nextstate = (in == 8'd114) ? clear5:zero;
		uname1 : nextstate = (in == 8'd110) ? uname2:zero;
		uname2 : nextstate = (in == 8'd97) ? uname3:zero;
		uname3 : nextstate = (in == 8'd109) ? uname4:zero;
		uname4 : nextstate = (in == 8'd101) ? uname5:zero;
		uname5 : nextstate = (in == 8'd32) ? uname6:zero;
		uname6 : nextstate = (in == 8'd45) ? uname7:zero;
		uname7 : nextstate = (in == 8'd97) ? uname8:zero;
		default : nextstate = zero;
	endcase
end

assign Delete = (state == delete2) ? 1:0;
assign CUF = (state == cuf) ? 1:0;
assign CUB = (state == cub) ? 1:0;
assign CNL = (state == cnl) ? 1:0;
assign CPL = (state == cpl) ? 1:0;
assign CHA = (state == cha) ? 1:0;
assign CUP = (state == cup) ? 1:0;
assign ED = (state == ed) ? 1:0;
assign EL = (state == el) ? 1:0;
assign SU = (state == su) ? 1:0;
assign SD = (state == sd) ? 1:0;
assign HVP = (state == hvp) ? 1:0;
assign SCP = (state == scp) ? 1:0;
assign RCP = (state == rcp) ? 1:0;
assign Clear = (state == clear5) ? 1:0;
assign Uname = (state == uname8) ? 1:0;

	
endmodule

