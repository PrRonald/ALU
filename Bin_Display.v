`timescale 1ns / 1ps
//binary to BCD togheter with mult_Display and sevensegment

module bin_display(
    input [11:0] Bin,
    input clk_in, 
    output reg [2:0] out_act,
    output [6:0] sevensegment); //in this output we gona give the display that will be activate

clk inclk (.clock_in(clk_in), .clock_out(clk));
reg [11:0] BCD;
reg [3:0] i;

always@ (Bin) 
    begin
        BCD = 12'b0;
        for (i = 0; i < 12; i = i + 1'b1)
            begin
                BCD = {BCD[10:0], Bin[11-i]};
                if(i<11 && BCD[3:0] > 4)
                    BCD[3:0] = BCD[3:0] + 2'b11;
                if(i<11 && BCD[7:4] > 4)
                    BCD[7:4] = BCD[7:4] + 2'b11;
                if(i<11 && BCD[11:8] > 4)
                    BCD[11:8] = BCD[11:8] + 2'b11;
            end
    end


reg [1:0] start; //this variable work like a counter, in each change one display is activated
reg [3:0] in; //in this reg is the input to seven segment display

always @(posedge clk)
begin
    start <= 2'b00;
        case (start)
            2'b00: begin
               in[3:0] = BCD[3:0];
               out_act = 3'b011; 
               start <= start + 2'b01; 
            end
            2'b01: begin
                in[3:0] = BCD[7:4];
                out_act = 3'b101;
                start <= start + 2'b01;
            end 
            2'b10: begin
                in[3:0] = BCD[11:8];
                out_act = 3'b110;
                start <= start + 2'b01;
            end
            2'b11: start <= 2'b00;
        endcase
end

wire [6:0] out;
	 
wire A, B, C, D;

assign D = in[0];
assign C = in[1];
assign B = in[2];
assign A = in[3];

assign out[6] = (~A & ~B & ~C)|(B & C & D);
assign out[5] = (~A & ~B & D)|(~B & C) | (C & D);
assign out[4] = (D) | (B & ~C);
assign out[3] = (~A & ~B & ~C & D)|(B & ~C & ~D) | (B & C & D);
assign out[2] = (~B & C & ~D);
assign out[1] = (B & C & ~D)|(B & ~C & D);
assign out[0] = (~A & ~B & ~C & D)|(B & ~C & ~D);

assign sevensegment = out;

endmodule