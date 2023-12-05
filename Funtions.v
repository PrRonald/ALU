`timescale 1ns / 1ps

module Funtions(
    input A, B, //word
    input [1:0] MC, //Logic, Arithmecti
    input Cin, //Carry in
    input [3:0] MUX,
    output reg OUT, //ALU out
	 output reg Cout //Carry out
    );

reg BF; //B Funtion is created for subtraction with constan
always @(A, B, MUX, Cin, MC, BF)begin
    BF = 1'd1;
    case (MUX)
        4'h0:begin
            if(MC == 2'b11)begin
                OUT = A;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = A ^ BF ^ Cin;
               Cout = ~A & BF | Cin & ~A | Cin &BF; 
            end

            else if(MC == 2'b10)begin
                OUT = ~A;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = A;
                Cout = 1'b0;
            end
            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end
        end 

        4'h1:begin
            if(MC == 2'b11)begin
                OUT = A & B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = (A&B) ^ BF ^ Cin;
               Cout = ~(A&B) & BF | Cin & ~(A&B) | Cin &BF; 
            end

            else if(MC == 2'b10)begin
                OUT = ~A & ~B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = A | B;
                Cout = 1'b0;
            end

            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end 

        4'h2:begin
            if(MC == 2'b11)begin
                OUT = ~A & B;
                Cout = 1'b0;
            end
            else if(MC == 2'b00)begin
                OUT = (A&~B) ^ BF ^ Cin;
                Cout = ~(A&~B) & BF | Cin & ~(A&~B) | Cin &BF; 
            end

            else if(MC == 2'b10)begin
                OUT = ~A & B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = A | ~B;
                Cout = 1'b0;
            end

            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end 

        4'h3:begin
            if(MC == 2'b11)begin
                OUT = ~A & ~B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = A ^ (A|~B) ^ Cin;
                Cout = A & (A|~B) | A & Cin | (A|~B) & Cin;
            end

            else if(MC == 2'b10)begin
                OUT = ~A | ~B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = A ^ (A&~B) ^ Cin;
                Cout = A & (A&~B) | A & Cin | (A&~B) & Cin;
            end

            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end 
        4'h4:begin
            if(MC == 2'b11)begin
                OUT = ~B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = (A&B) ^ (A|~B) ^ Cin;
                Cout = (A&B) & (A|~B) | (A&B) & Cin | (A|~B) & Cin;
            end

            else if(MC == 2'b10)begin
                OUT = ~A | ~B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = (A|B) ^ (A&~B) ^ Cin;
                Cout = (A|B) & (A&~B) | (A|B) & Cin | (A&~B) & Cin;
            end

            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end
        4'h5:begin
            if(MC == 2'b11)begin
                OUT = A ~^ B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = A ^ B ^ Cin;
                Cout = ~A & B | ~A & Cin| B & Cin;
            end

            else if(MC == 2'b10)begin
                OUT =A ^ B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = A ^ B ^ Cin;
               Cout = ~A & B | ~A & Cin| B & Cin;
            end
            
            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end
        4'h6:begin
            if(MC == 2'b11)begin
                OUT = A | ~B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = A | ~B;
                Cout = 1'b0;
            end

            else if(MC == 2'b10)begin
                OUT =A & ~B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = (A&~B) ^ BF ^ Cin;
                Cout = ~(A&~B) & BF | ~(A&~B) & Cin| BF & Cin;
            end
            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end

        4'h7:begin
            if(MC == 2'b11)begin
                OUT = ~A & B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = A ^ (A|B) ^ Cin;
               Cout = A & (A|B) | A & Cin | (A|B) & Cin;
            end

            else if(MC == 2'b10)begin
                OUT = ~A | B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = A ^ (A&B) ^ Cin;
                Cout = A & (A&B) | A & Cin | (A&B) & Cin;
            end
            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end

        4'h8:begin
            if(MC == 2'b11)begin
                OUT = A ^ B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = A ^ B ^ Cin;
                Cout = A & B | A & Cin | B & Cin;
            end

            else if(MC == 2'b10)begin
                OUT = A ~^ B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = A ^ B ^ Cin;
                Cout = A & B | A & Cin | B & Cin;
            end
            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end
        4'h9:begin
            if(MC == 2'b11)begin
                OUT = B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = (A&~B) ^ (A|B)^ Cin;
               Cout = (A&~B) & (A|B)| (A&~B) & Cin | (A|B) & Cin;
            end

            else if(MC == 2'b10)begin
                OUT = B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = (A|~B) ^ (A&B)^ Cin;
                Cout = (A|~B) & (A&B)| (A|~B) & Cin | (A&B)& Cin;
            end
            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end

        4'hA:begin
            if(MC == 2'b11)begin
                OUT = A | B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = A | B;
                Cout = 1'b0;
            end

            else if(MC == 2'b10)begin
                OUT = A & B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = (A&B) ^ BF ^ Cin;
                Cout = ~(A&B) & BF | ~(A&B) & Cin | BF & Cin;
            end
            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end

        4'hB:begin
            if(MC == 2'b11)begin
                OUT = A & ~B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = (A&B) ^ A ^ Cin;
               Cout = (A&B) & A | (A&B) & Cin | A & Cin;

            end

            else if(MC == 2'b10)begin
                OUT = A | ~B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = (A|B) ^ A ^ Cin;
                Cout = (A|B) & A | (A|B) & Cin | A & Cin;
            end
            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end

        4'hC:begin
            if(MC == 2'b11)begin
                OUT = A & B;
                Cout = 1'b0;
            end
            
            else if(MC == 2'b00)begin
                OUT = (A&~B) ^ A ^ Cin;
               Cout = (A&~B) & A | (A&~B) & Cin | A & Cin;

            end

            else if(MC == 2'b10)begin
                OUT = A | B;
                Cout = 1'b0;
            end

            else if(MC == 2'b01)begin
                OUT = (A|~B) ^ A ^ Cin;
                Cout = (A|~B) & A | (A|~B) & Cin | A & Cin;
            end
            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end

        4'hD:begin
            if(MC == 2'b11 || MC == 2'b00 || MC == 2'b10)begin
                OUT = A;
                Cout = 1'b0;
            end

            else if(MC == 2'b10)begin
                OUT = A ^ BF ^ Cin;
                Cout = ~A & BF | ~A & Cin | BF & Cin;
            end 
            else begin
                OUT = 1'b0;
                Cout = 1'b0;
            end

        end
        4'hE:begin
            {OUT,Cout} = {A,B};
        end
        4'hF:begin
            OUT = A ^ B ^ Cin;
            Cout =  A & B | A & Cin | B & Cin;
        end
    endcase
end

endmodule
