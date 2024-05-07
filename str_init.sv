// приглашение к вводу.
module str_init(init, clk, ready, next_symb, next_line, out, no_com);

input logic clk, init, no_com;
output logic ready, next_symb, next_line;
output  logic [7:0] out;

logic [6:0] Q = 0;
logic init_com = 0, no_com_start = 0;

always_comb begin
	case (Q)
		7'd22 : out <= 8'h67;
		7'd21 : out <= 8'h111;
		7'd20 : out <= 8'h109;
		7'd19 : out <= 8'h109;
		7'd18 : out <= 8'h97;
		7'd17 : out <= 8'h110;
		7'd16 : out <= 8'h100;
		7'd15 : out <= 8'h32;
		7'd14 : out <= 8'h117;
		7'd13 : out <= 8'h110;
		7'd12 : out <= 8'h107;
		7'd11 : out <= 8'h110;
		7'd10 : out <= 8'h111;
		7'd9 : out <= 8'h119;
		7'd8 : out <= 8'h110;		
		7'd7 : out <= 8'h117;
		7'd6 : out <= 8'h115;
		7'd5 : out <= 8'h101;
		7'd4 : out <= 8'h110;
		7'd3 : out <= 8'h58;
		7'd2 : out <= 8'h62;
		7'd1 : out <= 8'h32;		
		default : out <= 8'h0;
	endcase
end
		
always_ff @(posedge clk) begin
	if (clk & no_com & Q == 0) begin
		Q <= 22;
		no_com_start <= 1;
	end
	if (clk & Q == 8 & no_com_start) begin
		no_com_start <= 0;
		Q <= 0;
	end
	if (clk & init & Q == 0) begin
		Q <= 6'd7;
		init_com <= 1;
	end
	if (clk & Q == 1 & init_com) begin
		Q <= 0;
		init_com <= 0;
	end
	if (Q>0 & (init_com | no_com_start)) Q <= Q - 1;
end

assign next_symb = ((!clk & Q > 1 & init_com)	| (!clk & Q > 1 & no_com_start)) ? 1 : 0;
assign next_line = (!clk & Q == 8 & no_com_start) ? 1 : 0;
assign ready = (Q==0) ? 1 : 0;
endmodule