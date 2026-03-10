`timescale 1ns / 1ps

module tbC;
    reg t, clk;
    wire q;

    t_from_jk dut(.t(t), .clk(clk), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; t = 0;

        #10.1 t = 1; //q=1 --> Toggle
        #10 t = 0; //q=1 --> Hold
        #10 t = 1; //q=0 --> Toggle
        #10 t = 1; //q=1 --> Toggle
        #10 $finish;
    end
endmodule