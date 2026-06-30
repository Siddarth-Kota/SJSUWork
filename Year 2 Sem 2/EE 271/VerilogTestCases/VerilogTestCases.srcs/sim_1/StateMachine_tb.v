`timescale 1ns / 1ps

module StateMachine_tb;
    reg clk, rst;
    wire [1:0] Q;

    StateMachine uut (
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    initial begin
        $display("SJSU ID: 017833894");
        
        clk = 0;
        rst = 1; #10;
        rst = 0; #10;
        #60;
        $finish;
    end

    initial begin
        forever #10 clk = ~clk;
    end
endmodule