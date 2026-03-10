`timescale 1ns / 1ps

module tbA;
    reg j, k, clk;
    wire q;
    
    jk_from_d dut(.j(j), .k(k), .clk(clk), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; j = 0; k = 0;

        #10.1 j = 1; k = 0; //q=1 --> Set
        #10 j = 0; k = 0; //q=1 --> Hold
        #10 j = 0; k = 1; //q=0 --> Reset
        #10 j = 1; k = 1; //q=1 --> Toggle
        #10 j = 1; k = 1; //q=0 --> Toggle
        #10 $finish;
    end
endmodule