`timescale 1ns / 1ps

module tb3;
    reg clk = 0;
    wire [2:0] q;

    gray_code_counter uut(.clk(clk), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        #100 $finish;
    end
endmodule