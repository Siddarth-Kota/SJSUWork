`timescale 1ns / 1ps

module d_from_jk(
    input d,
    input clk,
    output q
    );
    
    jk_from_d jk(.j(d), .k(~d), .clk(clk), .q(q));
endmodule