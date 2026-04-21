`timescale 1ns / 1ps

module tb_mVoting();
reg [3:0]a_ti; 
wire y_to;
wire t_to;

//net(s)
integer i;

//instantiation
mVoting UUT(.a_i(a_ti), 
   .y_o(y_to), 
   .t_o(t_to));

//feeding
initial begin
a_ti = 4'b0000;
for(i = 1; i < 16; i = i + 1)
   #5 a_ti = i;
#5 $finish;
end

//capture
initial begin
$monitor("Time: %0t | Inputs: %b | Majourity: %b | Tie: %b", $time, a_ti, y_to, t_to);
$dumpfile("mVoting.vcd");
$dumpvars(0, tb_mVoting);
end

endmodule
