module vga_sync (clk, hsync, vsync, xpos, ypos);

input logic clk;
output logic vsync=1, hsync=1;
output logic [9:0] xpos, ypos;

logic [9:0] h_cnt = 10'h3FF, v_cnt = 10'h3FF;

parameter 	H_front_t = 16,
				H_sync_t = 96,
				H_back_t = 48,
				H_active_t = 640,
				H_blank_t = H_front_t + H_sync_t + H_back_t,
				H_total_t = H_active_t + H_blank_t;
				
parameter 	V_front_t = 10,
				V_sync_t = 2,
				V_back_t = 33,
				V_active_t = 480,
				V_blank_t = V_front_t + V_sync_t + V_back_t,
				V_total_t = V_active_t + V_blank_t;

assign xpos = h_cnt - H_blank_t;
assign ypos = v_cnt - V_blank_t;

always_ff @(posedge clk) begin
	if (h_cnt == H_total_t - 1) h_cnt <= 0;
	else h_cnt <= h_cnt + 1;
	if (h_cnt == H_front_t - 1) hsync <= 0;
	else if (h_cnt == H_front_t + H_sync_t - 1) begin
		hsync <= 1;
		
		if (v_cnt == V_total_t - 1) v_cnt <= 0;
		else v_cnt <= v_cnt + 1;
		
		if (v_cnt == V_front_t - 1) vsync 	<= 0;
		else if (v_cnt == V_front_t + V_sync_t - 1) vsync <= 1;
		end
end

endmodule