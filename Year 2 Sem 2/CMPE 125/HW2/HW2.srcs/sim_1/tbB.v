`timescale 1ns / 1ps

module tbB;
    reg d, clk;
    wire q;

    d_from_jk dut(.d(d), .clk(clk), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; d = 0;

        #10.1 d = 1; //q=1 --> Set
        #10 d = 0; //q=0 --> Reset
        #10 d = 1; //q=1 --> Set
        #10 $finish;
    end
endmodule