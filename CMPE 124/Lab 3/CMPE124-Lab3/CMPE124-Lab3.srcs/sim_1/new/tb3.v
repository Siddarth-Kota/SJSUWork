`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 09:52:45 PM
// Design Name: 
// Module Name: tb3
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


module tb3;
    reg D, CLK, EN, RST;
    wire Q;
    one_bit_reg uut(D, EN, RST, CLK, Q);
    initial begin
        CLK = 0;
        forever #5 CLK=~CLK;
    end
    initial begin
        $monitor("time=%0t, D=%b, EN=%b, RST=%b, CLK=%b, Q=%b", $time, D, EN, RST, CLK, Q);
        D=1; EN=1; RST=1;
        #10 EN=0;
        #10; RST=0;
        #10 D=0; RST=1;
        #10 EN=1; D=1;
        #10
        $finish;
    end
endmodule
