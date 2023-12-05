`timescale 1ns / 1ps
module Mul(
    input [5:0] A, B,
    output Cout,
    output [11:0] Mt
);

 

reg [11:0] P0, P1, P2, P3, P4, P5;

always @(A, B) begin

    if(B[0] == 0)
        P0 = 0;
    else P0 = A;

    if(B[1] == 0)
        P1 = 0;
    else
        P1 = A << 1;

    if(B[2] == 0)
        P2 = 0;
    else 
        P2 = A << 2;

    if(B[3] == 0)
        P3 = 0;
    else
        P3 = A << 3;

    if(B[4] == 0)
        P4 = 0;
    else
        P4 = A << 4;

    if(B[5] == 0)
        P5 = 0;
    else
        P5 = A << 5;
	
end

wire [11:0] S0, S1, S2, S3;
wire Cin0, Cin1, Cin2, Cin3;
parameter C = 1'b0;

adder12bits adder0 (.A(P0), .B(P1), .Cin(C), .Cout(Cin0),  .S(S0));
adder12bits adder1 (.A(S0), .B(P2), .Cin(Cin0), .Cout(Cin1), .S(S1));
adder12bits adder2 (.A(S1), .B(P3), .Cin(Cin1), .Cout(Cin2), .S(S2));
adder12bits adder3 (.A(S2), .B(P4), .Cin(Cin2), .Cout(Cin3), .S(S3));
adder12bits adder4 (.A(S3), .B(P5), .Cin(Cin3), .Cout(Cout), .S(Mt));


endmodule
