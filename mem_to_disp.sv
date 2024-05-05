module mem_to_disp(in, clk, q, read_addr, write_addr);
input logic clk;
input logic [7:0] in;
logic ram[2**17-1:0];
logic we = 1;
output logic q;
input [(17-1):0] read_addr, write_addr;

	always @ (posedge clk)
	begin
		// Write
		if (we)
			ram[write_addr] <= in;

		// Read (if read_addr == write_addr, return OLD data).	To return
		// NEW data, use = (blocking write) rather than <= (non-blocking write)
		// in the write assignment.	 NOTE: NEW data may require extra bypass
		// logic around the RAM.
		q <= ram[read_addr];
	end
	
endmodule
