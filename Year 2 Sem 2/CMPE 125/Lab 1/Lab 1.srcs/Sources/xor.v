`timescale 1ns / 1ps

module xor (
    input A,
    input B,
    output Y
);
    assign Y = A ^ B;

endmodule