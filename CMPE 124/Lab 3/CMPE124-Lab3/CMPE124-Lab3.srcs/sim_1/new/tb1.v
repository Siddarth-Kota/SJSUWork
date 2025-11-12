`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 12:47:59 AM
// Design Name: 
// Module Name: tb1
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


module tb1;
    reg clk, d;
    wire q_gate, qb_gate;
    
    dff_gate DFF_GATE(.D(d), .CLK(clk), .Q(q_gate), .Qbar(qb_gate));
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    
endmodule
