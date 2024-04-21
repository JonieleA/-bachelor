// not used
module scan_to_ascii (clk, data, out, enter, tab, backspace);

input logic clk;
input logic data;
logic [7:0] code;
logic [3:0] timer = 0;
output logic [7:0] out;
output logic enter, tab, backspace;

always_ff @(posedge clk) begin
	if (clk & !data & timer== 4'd0 ) timer=4'd9;
	if (clk & timer > 1) begin
		timer = timer - 1;
		code[6:0] <= code[7:1];
		code[7] <= data;
	end
	if (clk & data & timer == 4'd1) timer = 4'd0;
end

	assign out = (clk & data & timer == 4'd1 & code != 8'd13 & code != 8'd9 & code != 8'd8 ) ? code : 0;
	assign enter = (clk & data & timer == 4'd1 & code == 8'd13) ? 1 : 0;
	assign tab = (clk & data & timer == 4'd1 & code == 8'd9) ? 1 : 0;
	assign backspace = (clk & data & timer == 4'd1 & code == 8'd8) ? 1 : 0;
	
endmodule
