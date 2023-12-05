`timescale 1ns / 1ps
module adder12bits(A, B, S, Cin, Cout);

input [11:0] A; 
input [11:0] B;
input Cin;
output Cout;
output [11:0] S;
wire [10:0] C;


assign S[0] = A[0] ^ B[0] ^ Cin ;
assign C[0] = A[0] & B[0] | A[0] & Cin | B[0] & Cin;

assign S[1] = A[1] ^ B[1] ^ C[0];
assign C[1] = A[1] & B[1] | A[1] & C[0] | B[1] & C[0];

assign S[2] = A[2] ^ B[2] ^ C[1] ;
assign C[2] = A[2] & B[2] | A[2] & C[1] | B[2] & C[1];

assign S[3] = A[3] ^ B[3] ^ C[2] ;
assign C[3] = A[3] & B[3]| A[3] & C[2] | B[3] & C[2];

assign S[4] = A[4] ^ B[4] ^ C[3] ;
assign C[4] = A[4] & B[4]| A[4] & C[3] | B[4] & C[3];

assign S[5] = A[5] ^ B[5] ^ C[4];
assign C[5] = A[5] & B[5]| A[5] & C[4] | B[5] & C[4];

assign S[6] = A[6] ^ B[6] ^ C[5];
assign C[6] = A[6] & B[6]| A[6] & C[5] | B[6] & C[5];

assign S[7] = A[7] ^ B[7] ^ C[6];
assign C[7] = A[7] & B[7]| A[7] & C[6] | B[7] & C[6];

assign S[8] = A[8] ^ B[8] ^ C[7] ;
assign C[8] = A[8] & B[8]| A[8] & C[7] | B[8] & C[7];

assign S[9] = A[9] ^ B[9] ^ C[8] ;
assign C[9] = A[9] & B[9]| A[9] & C[8] | B[9] & C[8];

assign S[10] = A[10] ^ B[10] ^  C[9] ;
assign C[10] = A[10] & B[10] | A[10] & C[9] | B[10] & C[9];

assign S[11] = A[11] ^ B[11] ^ C[10] ;
assign Cout = A[11] & B[11]| A[11] & C[10] | B[11] & C[10];


endmodule

