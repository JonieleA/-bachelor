module memory_schet (clk, plus_str, plus_tab, minus_str, minus_tab, count, flag);

input logic clk, plus_str, plus_tab, minus_str, minus_tab;
output logic [11:0] count=0;
output logic flag;

always_ff @(posedge clk) begin
	if (clk) begin
		if (plus_str & ! plus_tab & !minus_str & !minus_tab) if (count < 3839) count <= count + 1; else count <= count + 1 - 3840;
		else if (!plus_str & plus_tab & !minus_str & !minus_tab) if (count < 3759) count <= (count/80+1)*80; else count <= 0;
		else if (!plus_str & !plus_tab & minus_str & !minus_tab) if (count > 0) count <= count - 1; else count <= count - 1 + 3840;
		else if (!plus_str & !plus_tab & !minus_str & minus_tab) if (count > 79) count <= (count/80-1)*80; else count <= 3720;
		else count <= count;
		end
end

assign flag = 0;//(count == 3839) ? 1:0;

endmodule