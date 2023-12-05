`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Comparador(
    input [5:0] A, B,
    output reg [1:0] X
    );

always @(A, B) begin
    if (A > B)
        X = 2'b01;
    else if (A < B)
        X = 2'b10;
    else 
        X = 2'b11;
end


endmodule
