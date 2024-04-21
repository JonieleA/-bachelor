module VGA_test (clk, H_SYNC, V_SYNC, V_R, V_G, V_B);

logic [2:0]pix = 3'b111;
input logic clk;
output logic H_SYNC, V_SYNC;
output logic V_R, V_B;
output logic V_G;
logic vga_clk;

assign V_R = {pix[1]};
assign V_G = {pix[2]};
assign V_B = {pix[0]};

logic [9:0] x,y;

always_ff @(posedge vga_clk) begin
	if ((x < 640) & (y < 480)) begin
		if (x % 80 == 0) pix <= pix - 1;
	end
	else  pix <= 0;
end

pll_inst pll_inst(.inclk0(clk), .c0(vga_clk));
vga_sync vga_sync (.clk(vga_clk), .hsync(H_SYNC), .vsync(V_SYNC), .xpos(x), .ypos(y));

endmodule