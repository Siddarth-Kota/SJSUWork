`timescale 1ns / 1ps

module Q4tb;

    reg A, clk, rst;
    wire out;

    Q4 uut (
        .A(A), 
        .clk(clk), 
        .rst(rst), 
        .out(out)
    );

    initial begin

        A = 0;
        clk = 0;
        rst = 1;

        #12; rst = 0;

        #10;
        #10; A = 1;
        #20; $finish;
    end

    always #5 clk = ~clk;

endmodule