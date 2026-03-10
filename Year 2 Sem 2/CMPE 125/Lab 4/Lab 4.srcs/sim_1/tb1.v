`timescale 1ns / 1ps

module tb1;
    reg [3:0] A, B;
    reg Ci;
    wire [3:0] S;
    wire Co, PG, GG;

    CLA4 dut(.A(A), .B(B), .Ci(Ci), .S(S), .Co(Co), .PG(PG), .GG(GG));

    initial begin
        A = 4'b0000; B = 4'b0000; Ci = 0;
        #10 A = 4'b1010; B = 4'b0101; Ci = 0;
        #10 A = 4'b0111; B = 4'b1001; Ci = 0;
        #10 $finish;
    end
endmodule