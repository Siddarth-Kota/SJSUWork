`timescale 1ns / 1ps

module d_ff(
    input d,
    input clk,
    output reg q
    );

    initial begin
        q = 0;
    end
    
    always @(posedge clk) begin
        q <= d;
    end
endmodule