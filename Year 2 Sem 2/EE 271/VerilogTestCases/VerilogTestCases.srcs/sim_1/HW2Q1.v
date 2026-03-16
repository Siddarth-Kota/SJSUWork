`timescale 1ns / 1ps

module HW2Q1;
    reg [3:0] A, B;
    wire C;
    wire [3:0] D;

    assign C = A && B;
    assign D = A & B;

    initial begin
        A = 4'b0110;
        B = 4'b1000;
        #1;
        $display("SJSU ID: [Insert Your ID Here]");
        $display("A = %b, B = %b", A, B);
        $display("C (A&&B) = %b", C);
        $display("D (A&B)  = %b", D);
        $finish;
    end
endmodule