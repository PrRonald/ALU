`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Control(
    input clk,
    input [5:0] A, B,
    input [1:0] MC, //Logic and Arithmetic
    input mux, //change the out can be ALU or Mult and Comparator
    input [3:0] MUX,
    input MUL,
    output Coutm,
    output [2:0] out_act,
    output [6:0] sevensegment,
    output [6:0] out, //out general
    output [4:0] outm //out Mult
    );

wire [5:0] OUT;
wire Cint1, Cint2, Cint3, Cint4, Cint5, Cout;
Funtions ALU0 (.A(A[0]), .B(B[0]), .MC(~MC), .Cin(1'b0),   .MUX(~MUX), .OUT(OUT[0]), .Cout(Cint1));
Funtions ALU1 (.A(A[1]), .B(B[1]), .MC(~MC), .Cin(Cint1), .MUX(~MUX), .OUT(OUT[1]), .Cout(Cint2));
Funtions ALU2 (.A(A[2]), .B(B[2]), .MC(~MC), .Cin(Cint2), .MUX(~MUX), .OUT(OUT[2]), .Cout(Cint3));
Funtions ALU3 (.A(A[3]), .B(B[3]), .MC(~MC), .Cin(Cint3), .MUX(~MUX), .OUT(OUT[3]), .Cout(Cint4));
Funtions ALU4 (.A(A[4]), .B(B[4]), .MC(~MC), .Cin(Cint4), .MUX(~MUX), .OUT(OUT[4]), .Cout(Cint5));
Funtions ALU5 (.A(A[5]), .B(B[5]), .MC(~MC), .Cin(Cint5), .MUX(~MUX), .OUT(OUT[5]), .Cout(Cout));


bin_display binario_pantalla (
        .Bin({5'b0,out}), 
        .clk_in(clk),
        .out_act(out_act),
        .sevensegment(sevensegment)
    );

wire [11:0] info;
wire [1:0] X;
Comparator Comp (.A(A), .B(B), .X(X));
Mul M (.A(A), .B(B), .Cout(Coutm), .Mt(info));


wire [11:0] OUT1, OUT0;
assign OUT0 = {Cout, OUT};
assign OUT1 = ({MUX,MUL} == 5'b1) ? X : info;
assign {outm,out} = mux ? OUT0 : OUT1;




endmodule
