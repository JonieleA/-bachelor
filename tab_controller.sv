// следит за тем какие строчки идут на экран


module tab_controller (enter, tab_disp, tab_out);

input logic enter;
logic [$clog2(48)-1:0] tab=0;
input logic [$clog2(24)-1:0] tab_disp;
output logic [$clog2(48)-1:0] tab_out;

always_ff @(posedge enter)
	if (tab < 47) tab <= tab + 1;
	else tab <= 0;

assign tab_out = (tab + tab_disp > 47) ? tab + tab_disp-47 : tab+tab_disp;

endmodule
