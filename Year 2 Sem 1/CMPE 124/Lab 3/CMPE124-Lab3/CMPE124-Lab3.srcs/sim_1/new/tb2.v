`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 09:43:44 PM
// Design Name: 
// Module Name: tb2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb2;
    reg clock, reset, D;
    wire Q;
    dff_gate_behav uut (D, reset, clock, Q);
    initial begin
        clock=0;
        forever #5 clock=~clock;
    end
    initial begin
        $monitor("time=%0t, D=%b, reset=%b, clock=%b, Q=%b", $time, D, reset, clock, Q);
        reset=0;D=0;
        #5 D=1;
        #10 reset=1;
        #5 D=0;
        #10 reset=0;D=0;
        #5 D=1;
        #5 
        $finish;
    end
endmodule
