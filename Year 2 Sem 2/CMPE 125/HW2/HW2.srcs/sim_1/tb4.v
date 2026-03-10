`timescale 1ns / 1ps

module tb4;
    reg a = 0, b = 0, clk = 0;
    wire z;

    fsm dut(.a(a), .b(b), .clk(clk), .z(z));

    always #5 clk = ~clk;

    initial begin
        clk = 0; a = 0; b = 0;

        $display("Starting test at time %t", $time);
        $monitor("At time %t: a = %b, b = %b, z = %b", $time, a, b, z);

        #10.1 a = 1; b = 0; //z = 0
        #10 a = 0; b = 1; //z = 1
        #10 a = 1; b = 1; //z = 1
        #10 a = 1; b = 0; //z = 1
        #10 $finish;
    end
endmodule