`timescale 1ns / 1ps

module majority(
    input a, b, c,
    output m
    );

    wire and1, and2, and3;

    and(and1, a, c);
    and(and2, a, b);
    and(and3, b, c);
    or(m, and1, and2, and3);
endmodule