module ram_use (enter, clk, state, nextstate, rst, overflow, tab);

input logic enter, clk, overflow, tab, rst;
output enum logic [1:0] {display, commands, autoupd, resave} state, nextstate;
logic [$clog2(8)-1:0] com_count=0;
logic [$clog2(3799)-1:0] resave_count=0;
logic [$clog2(6)-1:0] auto_count=0;

always_ff @(posedge clk, posedge rst)
	if (rst) state <= display;
	else state <= nextstate;
	
always_comb begin
	case (state)
	display : nextstate = (enter) ? commands : (tab) ? autoupd : (overflow) ? resave : display;
	commands : nextstate = (com_count == 7) ? display : commands;
	autoupd : nextstate = (auto_count == 6) ? display : autoupd;
	resave : nextstate = (resave_count == 3799) ? display : resave;
	default : nextstate = display;
	endcase
end

always_ff @(posedge clk)
	if (state == commands & com_count < 7) com_count <= com_count + 1;
	else if (state == commands & com_count == 7) com_count <= 0;
	
always_ff @(posedge clk)
	if (state == autoupd & auto_count < 6) auto_count <= auto_count + 1;
	else if (state == commands & auto_count == 6) auto_count <= 0;
	
always_ff @(posedge clk)
	if (state == resave & resave_count < 3799) resave_count <= resave_count + 1;
	else if (state == commands & resave_count == 3799) resave_count <= 0;
	
endmodule
