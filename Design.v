`timescale 1ns / 1ps

module mVoting(
   input [3:0]a_i, 
   output y_o, //majourity result
   output t_o //tie
);

//net(s)
wire [2:0]count;

//Comment: for commented design, make t_o of type reg.
//assign y_o = (a_i[3] & a_i[2] & a_i[1]) | (a_i[3] & a_i[2] & a_i[0]) | (a_i[3] & a_i[0] & a_i[1]) | (a_i[2] & a_i[1] & a_i[0]) | (a_i[3] & a_i[2] & a_i[1] & a_i[0]);
//always@(*) //in 4 bit input, number of 1s = number of 0s, y_o will be 0 as per above expression
//if(y_o || a_i == 4'b0)
//   t_o = 1'b0;
//else 
//   t_o = ~(^a_i); //1s are even, i.e. two

assign count = a_i[3] + a_i[2] + a_i[1] + a_i[0];
assign y_o = (count >= 4'd3);
assign t_o = (count == 4'd2);

endmodule
