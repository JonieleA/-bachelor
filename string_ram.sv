module string_ram (in, out, clk, we, str_out, clear_flag, rst, overload, state, nextstate, str_clear_flag, clear_count, back);

input logic clk, we, clear_flag, rst;
input logic [7:0] in;
input logic [$clog2(80)-1:0] str_out;
output logic [7:0] out;
output logic [$clog2(80)-1:0] clear_count = 0;
logic [7:0] data;
output enum logic {save=1'b0, clear=1'b1} state, nextstate;
output logic str_clear_flag;
output logic overload;
input logic back;

simple_dual_port_ram_single_clock #(.DATA_WIDTH(8), .ADDR_WIDTH(7)) string_ram(.data(data), .read_addr(str_out), .write_addr(clear_count), .we(we), .clk(clk), .q(out));

always_comb	case(state)
	save: nextstate = (clear_flag) ? clear: (clear_count >= 79) ? clear : save;
	clear: nextstate = (clear_flag) ? clear : (clear_count >= 79) ? save : clear;
	default : nextstate = save;
endcase

always_ff @(posedge clk, posedge rst)
	if (rst) state <= clear;
	else state <= nextstate;

always_ff @(posedge clk) begin
	if (state != nextstate) clear_count <= 0;
	else if (back & clear_count > 0) clear_count <= clear_count - 1;
	else if (state == nextstate & clear_count < 79) clear_count <= clear_count + 1;
	else if (state == nextstate) clear_count = 0;
end
	
assign data = (state==save) ? in : 0;
assign overload = (clear_count == 79 & state==save) ? 1 : 0;
assign str_clear_flag = (clear_count == 79 & state==clear) ? 1 : 0;

endmodule