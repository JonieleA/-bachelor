module addr_sum (str, tab, out);

input logic [$clog2(80)-1:0] str;
input logic [$clog2(48)-1:0] tab;

output logic [$clog2(3840)-1:0] out;

assign out  = 80*tab + str;

endmodule