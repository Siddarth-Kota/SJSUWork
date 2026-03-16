`timescale 1ns / 1ps

module HW2Q4(
    input [2:0] in,
    output [15:0] out
    );
    function [15:0] factorial;
        input [2:0] n;
        begin
            factorial = 1;
            for (integer i = 2; i <= n; i = i + 1) begin
                factorial = factorial * i;
            end
        end
    endfunction

    assign out = factorial(in);
endmodule