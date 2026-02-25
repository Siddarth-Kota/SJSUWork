`timescale 1ns / 1ps

module xor_gate_P1(
    input wire [3:0] a,
    output wire y
    );

    assign y = a[0] ^ a[1] ^ a[2] ^ a[3];

endmodule