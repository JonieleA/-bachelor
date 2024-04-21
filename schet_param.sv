module schet_param #(parameter Schet = 80) (clk, count, plus_out, minus_out, plus, minus);

input logic clk, plus, minus;
output logic [$clog2(Schet)-1:0] count=0;
output logic plus_out=0, minus_out=0;

always_ff @(posedge clk) begin
	if (plus & !minus & count < Schet-1) begin
		count <= count + 1;
		plus_out <= 0;
	end
	else if (plus & !minus & count == Schet-1) begin
		count <= 0;
		plus_out <= 1;
	end
	if (minus & !plus & count > 0) begin
		count <= count - 1;
		minus_out <= 0;
	end
	else if (minus & !plus & count == 0) begin
		count <= Schet-1;
		minus_out <= 1;
	end
end

endmodule