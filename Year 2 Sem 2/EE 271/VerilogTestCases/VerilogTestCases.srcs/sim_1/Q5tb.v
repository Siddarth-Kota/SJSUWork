`timescale 1ns / 1ps

module tb( );
    reg unsigned [3:0] A;
    reg signed [3:0] B;
    initial begin
        A = -1;
        B = A + 2;
        $display ("A = %d", A);
        $display ("B = %d", B);
    end
endmodule