module del_par #(parameter del=2) (clk, outclk);

input logic clk;
output outclk;
logic [$clog2(del)-1:0] Q=0;

always_ff @(posedge clk) begin
	if (clk & Q < del-1) Q <= Q + 1;
	else if (clk) Q <= 0;
end

assign outclk = (Q < del/2) ? 1:0;

endmodule