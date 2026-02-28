`timescale 1ns / 1ps

module Hw2Q3circuitImplementation(
    input a,
    input b,
    output reg X
    );
    always @(*) begin
        X = ~( ~( ~(a | ~b) | (a & b) ) & (a | b));
    end
endmodule