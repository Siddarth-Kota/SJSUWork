`timescale 1ns / 1ps

module ALU_tb;
    reg [31:0] A;
    reg [31:0] B;
    reg [2:0] F;
    wire [31:0] Y;
    wire overflow;
    wire Cout;
    wire zero;

    ALU dut (
        .A(A),
        .B(B),
        .F(F),
        .Y(Y),
        .overflow(overflow),
        .zero(zero),
        .Cout(Cout)
    );

    initial begin
        // Test AND
        A = 32'hFFFF0000; B = 32'h0000FFFF; F = 3'b000; #10;
        
        // Test OR
        A = 32'hFFFF0000; B = 32'h0000FFFF; F = 3'b001; #10;

        // Test ADD
        A = 32'h7FFFFFFF; B = 32'h7FFFFFFF; F = 3'b010; #10;

        // Test SUB
        A = 32'h00000001; B = 32'h00000002; F = 3'b110; #10;

        // Test SLT
        A = 32'h00000001; B = 32'h00000002; F = 3'b111; #10;

        // Test zero result
        A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; F = 3'b000; #10;
        $finish;
    end
endmodule