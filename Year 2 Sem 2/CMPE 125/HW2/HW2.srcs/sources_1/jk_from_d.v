`timescale 1ns / 1ps

module jk_from_d(
    input j,
    input k,
    input clk,
    output q
    );
    
    wire q_next;
    assign q_next = (j & ~q) | (~k & q);
    d_ff dff(.d(q_next), .clk(clk), .q(q));
endmodule