module delay_param #(parameter delay = 1) (clk, out);

input logic clk;
output logic out;
logic [$clog2(delay+1):0] count=0;

always_ff @(posedge clk) begin
	if (count <= delay) count <= count + 1;
	else if (count == delay+1) count <= 1;
end

assign out = (count == delay+1) ? 1 : 0;

endmodule