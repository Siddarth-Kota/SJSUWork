`timescale 1ns / 1ps

module tb1;

    reg A;
    reg B;
    wire Y;

    xor_gate dut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        // Test case 1: A=0, B=0
        A = 0; B = 0; #10;
        $display("A=%b, B=%b, Y=%b", A, B, Y);

        // Test case 2: A=0, B=1
        A = 0; B = 1; #10;
        $display("A=%b, B=%b, Y=%b", A, B, Y);

        // Test case 3: A=1, B=0
        A = 1; B = 0; #10;
        $display("A=%b, B=%b, Y=%b", A, B, Y);

        // Test case 4: A=1, B=1
        A = 1; B = 1; #10;
        $display("A=%b, B=%b, Y=%b", A, B, Y);

        $finish;
    end
endmodule