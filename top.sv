module top (ps2_clk, data, out, str_out, str_in, clk, flag, code, flag_del, count_str, count_tab);

input logic ps2_clk, data, clk;
output logic [7:0] out;
output logic [7:0] code;
output logic flag;
output logic [11:0] str_in;
input logic [11:0] str_out;
output logic flag_del;

output logic [$clog2(80)-1:0] count_str=0;
output logic [$clog2(48)-1:0] count_tab=0;
logic tab_minus, tab_overflow, tab_plus, tab_over;
logic [15:0] gnd = 0;
logic [15:0] vdd = 1;
logic [7:0] to_command;

logic [6:0] str_command;

logic Delete, CUF, CUB, CNL, CPL, CHA, CUP, ED, EL, SU, SD, HVP, SCP, RCP, Clear, Uname;

KeyboardController KeyboardController(.ps2_clk(ps2_clk), .data(data), .code(code), .flag(flag), .enter(gnd[0]), .tab(gnd[1]), .backspace(gnd[2]));
schet_param #(.Schet(80)) str_counter_in (.clk(clk), .count(count_str), .plus_out(tab_plus), .plus(flag_del), .minus(gnd[3]), .minus_out(tab_minus));
schet_param #(.Schet(48)) tab_counter_in (.clk(clk), .count(count_tab), .plus_out(tab_overflow), .plus(tab_plus), .minus(tab_minus), .minus_out(tab_over));
addr_sum in_addr(.str(count_str), .tab(count_tab), .out(str_in));
flag_del1 flag_del1(.clk(clk), .flag(flag), .out(flag_del));
simple_dual_port_ram_single_clock RAM(.data(code), .read_addr(str_out), .write_addr(str_in), .we(flag), .clk(clk), .q(out));
string_ram command_ram (.in(code), .out(to_command), .clk(clk), .we(flag), .str_out(str_command), .clear_flag(Clear), .rst(gnd[4]), .overload(), .state(), .nextstate(), .str_clear_flag(), .clear_count(), .back(gnd[5]));
commands commands(.in(to_command), .clk(clk), .str(str_command), .Delete(Delete), .CUF(CUF), .CUB(CUB), .CNL(CNL), .CPL(CPL), .CHA(CHA), .CUP(CUP), .ED(ED), .EL(EL), .SU(SU), .SD(SD), .HVP(HVP), .SCP(SCP), .RCP(RCP), .Clear(Clear), .Uname(Uname), .rst(gnd[6]), .state(), .nextstate());

endmodule