// not used
module memory_line(in, out, clr, str_in, read, enable, str_out);

input logic [7:0] in; 
input logic [11:0] str_in, str_out;
output logic [7:0] out=0;
input logic clr;
input logic read;
input logic enable;

//always_ff @(posedge set) begin
//	if (mem[30719-str*640+(80-tab)*8:30719-str*640+(80-tab)*8-7]==0 & set & tab<80) begin
//		mem[30719-str*640+(80-tab)*8:30719-str*640+(80-tab)*8-7]<= in;
//		if (tab<79)tab <= tab+1;
//		else begin
//			tab <= 0;
//			str <= str-1;
//		end
//	end
//end

logic [7:0] RAM [3840];		
		
always_ff @(posedge clr) begin
if (enable) begin
	if (clr) RAM[str_in] <= in;

	end

end

//always_ff @(posedge read) begin
//	if (read) out <= RAM[str_out];
//	else out <= 8'd0;
//end
	
assign out = RAM[str_out];
	
endmodule


