`timescale 1ns / 1ps

module t_from_jk(
    input t,
    input clk,
    output q
    );
    
    jk_from_d jk(.j(t), .k(t), .clk(clk), .q(q));
endmodule