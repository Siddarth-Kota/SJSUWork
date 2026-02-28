`timescale 1ns / 1ps

module top(
    input [2:0] x, y,
    output out
    );
    wire m1, m2;

    majority m1(x[0], x[1], x[2], m1);
    majority m2(y[0], y[1], y[2], m2);
    and(out, m1, m2);
endmodule