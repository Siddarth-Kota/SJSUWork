`timescale 1ns / 1ps

module fsm (
    input a, b, clk,
    output z
    );

    reg q;
    initial begin
        q = 1'b0;
    end
    always @(posedge clk) begin
        q <= a;
    end
    assign z = (a & b) | (a & q) | (b & q);
endmodule