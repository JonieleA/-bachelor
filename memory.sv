// not used
module memory (in, out, clr, str, clk, tab);

input logic [7:0] in; 
input logic [6:0] str;
input logic [5:0] tab;
//logic [30719:0] mem=0;
output logic [7:0] out;
logic [7:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28, out29, out30, out31, out32, out33, out34, out35, out36, out37, out38, out39, out40, out41, out42, out43, out44, out45, out46, out47;
input logic clr;
input logic clk;

memory_line line0 (.in(in), .out(out0 ), .clr(clr), .str(str), .clk(clk), .enable(tab==0 ));
memory_line line1 (.in(in), .out(out1 ), .clr(clr), .str(str), .clk(clk), .enable(tab==1 ));
memory_line line2 (.in(in), .out(out2 ), .clr(clr), .str(str), .clk(clk), .enable(tab==2 ));
memory_line line3 (.in(in), .out(out3 ), .clr(clr), .str(str), .clk(clk), .enable(tab==3 ));
memory_line line4 (.in(in), .out(out4 ), .clr(clr), .str(str), .clk(clk), .enable(tab==4 ));
memory_line line5 (.in(in), .out(out5 ), .clr(clr), .str(str), .clk(clk), .enable(tab==5 ));
memory_line line6 (.in(in), .out(out6 ), .clr(clr), .str(str), .clk(clk), .enable(tab==6 ));
memory_line line7 (.in(in), .out(out7 ), .clr(clr), .str(str), .clk(clk), .enable(tab==7 ));
memory_line line8 (.in(in), .out(out8 ), .clr(clr), .str(str), .clk(clk), .enable(tab==8 ));
memory_line line9 (.in(in), .out(out9 ), .clr(clr), .str(str), .clk(clk), .enable(tab==9 ));
memory_line line10(.in(in), .out(out10), .clr(clr), .str(str), .clk(clk), .enable(tab==10));
memory_line line11(.in(in), .out(out11), .clr(clr), .str(str), .clk(clk), .enable(tab==11));
memory_line line12(.in(in), .out(out12), .clr(clr), .str(str), .clk(clk), .enable(tab==12));
memory_line line13(.in(in), .out(out13), .clr(clr), .str(str), .clk(clk), .enable(tab==13));
memory_line line14(.in(in), .out(out14), .clr(clr), .str(str), .clk(clk), .enable(tab==14));
memory_line line15(.in(in), .out(out15), .clr(clr), .str(str), .clk(clk), .enable(tab==15));
memory_line line16(.in(in), .out(out16), .clr(clr), .str(str), .clk(clk), .enable(tab==16));
memory_line line17(.in(in), .out(out17), .clr(clr), .str(str), .clk(clk), .enable(tab==17));
memory_line line18(.in(in), .out(out18), .clr(clr), .str(str), .clk(clk), .enable(tab==18));
memory_line line19(.in(in), .out(out19), .clr(clr), .str(str), .clk(clk), .enable(tab==19));
memory_line line20(.in(in), .out(out20), .clr(clr), .str(str), .clk(clk), .enable(tab==20));
memory_line line21(.in(in), .out(out21), .clr(clr), .str(str), .clk(clk), .enable(tab==21));
memory_line line22(.in(in), .out(out22), .clr(clr), .str(str), .clk(clk), .enable(tab==22));
memory_line line23(.in(in), .out(out23), .clr(clr), .str(str), .clk(clk), .enable(tab==23));
memory_line line24(.in(in), .out(out24), .clr(clr), .str(str), .clk(clk), .enable(tab==24));
memory_line line25(.in(in), .out(out25), .clr(clr), .str(str), .clk(clk), .enable(tab==25));
memory_line line26(.in(in), .out(out26), .clr(clr), .str(str), .clk(clk), .enable(tab==26));
memory_line line27(.in(in), .out(out27), .clr(clr), .str(str), .clk(clk), .enable(tab==27));
memory_line line28(.in(in), .out(out28), .clr(clr), .str(str), .clk(clk), .enable(tab==28));
memory_line line29(.in(in), .out(out29), .clr(clr), .str(str), .clk(clk), .enable(tab==29));
memory_line line30(.in(in), .out(out30), .clr(clr), .str(str), .clk(clk), .enable(tab==30));
memory_line line31(.in(in), .out(out31), .clr(clr), .str(str), .clk(clk), .enable(tab==31));
memory_line line32(.in(in), .out(out32), .clr(clr), .str(str), .clk(clk), .enable(tab==32));
memory_line line33(.in(in), .out(out33), .clr(clr), .str(str), .clk(clk), .enable(tab==33));
memory_line line34(.in(in), .out(out34), .clr(clr), .str(str), .clk(clk), .enable(tab==34));
memory_line line35(.in(in), .out(out35), .clr(clr), .str(str), .clk(clk), .enable(tab==35));
memory_line line36(.in(in), .out(out36), .clr(clr), .str(str), .clk(clk), .enable(tab==36));
memory_line line37(.in(in), .out(out37), .clr(clr), .str(str), .clk(clk), .enable(tab==37));
memory_line line38(.in(in), .out(out38), .clr(clr), .str(str), .clk(clk), .enable(tab==38));
memory_line line39(.in(in), .out(out39), .clr(clr), .str(str), .clk(clk), .enable(tab==39));
memory_line line40(.in(in), .out(out40), .clr(clr), .str(str), .clk(clk), .enable(tab==40));
memory_line line41(.in(in), .out(out41), .clr(clr), .str(str), .clk(clk), .enable(tab==41));
memory_line line42(.in(in), .out(out42), .clr(clr), .str(str), .clk(clk), .enable(tab==42));
memory_line line43(.in(in), .out(out43), .clr(clr), .str(str), .clk(clk), .enable(tab==43));
memory_line line44(.in(in), .out(out44), .clr(clr), .str(str), .clk(clk), .enable(tab==44));
memory_line line45(.in(in), .out(out45), .clr(clr), .str(str), .clk(clk), .enable(tab==45));
memory_line line46(.in(in), .out(out46), .clr(clr), .str(str), .clk(clk), .enable(tab==46));
memory_line line47(.in(in), .out(out47), .clr(clr), .str(str), .clk(clk), .enable(tab==47));

or(out, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28, out29, out30, out31, out32, out33, out34, out35, out36, out37, out38, out39, out40, out41, out42, out43, out44, out45, out46, out47);


endmodule

