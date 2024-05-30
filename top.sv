module top (ps2_clk, data, out, str_out, str_in, clk, flag, code, flag_del, count_str, count_tab);

input logic ps2_clk, data, clk;
output logic [7:0] out;
output logic [7:0] code;
output logic flag;
output logic [11:0] str_in;
input logic [11:0] str_out;
output logic flag_del;

output logic [6:0] count_str;
output logic [5:0] count_tab;
logic tab_minus, tab_overflow, tab_plus, tab_over;
logic [15:0] gnd = 16'd0;
logic [15:0] vdd = 16'b1111111111111111;
logic [7:0] to_command;

logic [6:0] str_command;

logic Delete, CUF, CUB, CNL, CPL, CHA, CUP, ED, EL, SU, SD, HVP, SCP, RCP, Clear, Uname;

logic init, ready, next_symb, next_line, no_com;
logic [7:0] init_out;

logic addr, rst_autoupd;
logic [7:0] in_autoupd, out_autoupd;

logic clk_out, rst_state, rst;
logic [5:0] tab;
logic [6:0] str;
logic [6:0] str_out_state;
logic [5:0] tab_out_state;
logic [7:0] in_state, out_state;

logic enter_tab, enter, tabo, tab_pluss, backspace, minus, plus, back;
logic [4:0] tab_disp;
logic [5:0] tab_out_controller;

logic [7:0] in_disp, out_memory;
logic [16:0] read_addr, write_addr;

KeyboardController KeyboardController(.ps2_clk(ps2_clk), .data(data), .code(code), .flag(flag), .enter(enter), .tab(tabo), .backspace(backspace));
schet_param #(.Schet(80)) str_counter_in (.clk(clk), .count(count_str), .plus_out(plus), .plus(flag_del), .minus(minus), .minus_out(tab_minus));
schet_param #(.Schet(48)) tab_counter_in (.clk(clk), .count(count_tab), .plus_out(tab_overflow), .plus(tab_pluss), .minus(tab_minus), .minus_out(tab_over));
addr_sum in_addr(.str(count_str), .tab(count_tab), .out(str_in));
flag_del1 flag_del1(.clk(clk), .flag(flag), .out(flag_del));
simple_dual_port_ram_single_clock RAM(.data(code), .read_addr(str_out), .write_addr(str_in), .we(flag), .clk(clk), .q(out));
string_ram command_ram (.in(code), .out(to_command), .clk(clk), .we(flag), .str_out(str_command), .clear_flag(Clear), .rst(rst), .overload(), .str_clear_flag(), .clear_count(), .back(minus));
commands commands(.in(to_command), .clk(clk), .str(str_command), .Delete(Delete), .CUF(CUF), .CUB(CUB), .CNL(CNL), .CPL(CPL), .CHA(CHA), .CUP(CUP), .ED(ED), .EL(EL), .SU(SU), .SD(SD), .HVP(HVP), .SCP(SCP), .RCP(RCP), .Clear(Clear), .Uname(Uname), .rst(rst));
str_init str_init(.init(init), .clk(clk), .ready(ready), .next_symb(next_symb), .next_line(next_line), .out(init_out), .no_com(no_com));
autoupd autoupd(.clk(clk), .addr(addr), .in(out), .out(out_autoupd), .rst(rst_autoupd));
ram_state ram_state (.clk(clk), .rst(rst_state), .clk_out(clk_out), .in(out), .out(out_state), .tab(tab), .tab_out(tab_out_state), .str(str), .str_out(str_out_state));
tab_controller tab_controller(.enter(enter_tab), .tab_disp(tab_disp), .tab_out(tab_out_controller));
// mem_to_disp mem_to_disp(.in(in_disp), .clk(clk), .out(out), .read_addr(read_addr), .write_addr(write_addr));
assign enter_tab = (rst | tab_plus | enter) ? 1 : 0;
assign tab_pluss = (tabo | tab_plus) ? 1 : 0;
assign minus = (backspace | CUB) ? 1 : 0;
assign plus = (flag_del | CUF) ? 1 : 0;
endmodule