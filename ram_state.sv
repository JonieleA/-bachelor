module ram_state (clk, rst, state, nextstate, clk_out, in, out, tab, tab_out, str, str_out);

input logic clk, rst;
input logic [7:0] in;
output logic [7:0] out;
output enum logic [1:0] {init, save, new_tab} state, nextstate;
logic [$clog2(48)-1:0] tab_mem;
input logic [$clog2(48)-1:0] tab;
input logic [$clog2(80)-1:0] str;
output logic [$clog2(80)-1:0] str_out;
output logic [$clog2(48)-1:0] tab_out;
logic [$clog2(3799)-1:0] counter=0;
output logic clk_out;
logic [$clog2(80)-1:0] new_tab_count=0;

always_ff @(posedge clk)
	tab_mem <= tab;
	
always_ff @(posedge clk, posedge rst)
	if (rst) state <= init;
	else state <= nextstate;
	
always_comb begin
	case(state)
	init:	begin
				out = 0;
				tab_out = tab;
				str_out = str;
				nextstate = (counter == 3739) ? save : init;
			end
	save:	begin
				out = in;
				tab_out = tab;
				str_out = str;
				nextstate = (tab != tab_mem) ? new_tab : save;
			end
	new_tab: begin
				out = 0;
				tab_out = tab;
				str_out = new_tab_count;
				nextstate = (new_tab_count == 79) ? save : new_tab;
			end
	endcase
end

addr_sum in_addr(.str(str), .tab(tab), .out(counter));

always_ff @(posedge clk)
	if (state != new_tab) new_tab_count <= 0;
	else if (state == new_tab) new_tab_count <= new_tab_count + 1;
	
assign clk_out = clk;	
	
endmodule
