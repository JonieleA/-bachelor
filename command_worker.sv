// исполняет команды

module command_worker (clk, rst, Delete, CUF, CUB, CNL, CPL, CHA, CUP, ED, EL, SU, SD, HVP, SCP, RCP, Clear, Uname, state, nextstate);

input logic clk, rst, Delete, CUF, CUB, CNL, CPL, CHA, CUP, ED, EL, SU, SD, HVP, SCP, RCP, Clear, Uname;

output enum logic [4:0] {none, Delete1, CUF1, CUB1, CNL1, CPL1, CHA1, CUP1, ED1, EL1, SU1, SD1, HVP1, SCP1, RCP1, Clear1, Uname1} state, nextstate;

always_ff @(posedge clk, posedge rst)
	if (rst) state <= none;
	else state <= nextstate;
	
always_comb begin
	case(state)
		none : nextstate = (Delete) ? Delete1 : (CUF) ? CUF1 : (CUB) ? CUB1 : (CNL) ? CNL1 : (CPL) ? CPL1 : (CHA) ? CHA1 : (CUP) ? CUP1 : (ED) ? ED1 : (EL) ? EL1 : (SU) ? SU1 : (SD) ? SD1 : (HVP) ? HVP1 : (SCP) ? SCP1 : (RCP) ? RCP1 : (Clear) ? Clear1 : (Uname) ? Uname1 : none;
		
		default : nextstate = none;
	endcase
end




endmodule