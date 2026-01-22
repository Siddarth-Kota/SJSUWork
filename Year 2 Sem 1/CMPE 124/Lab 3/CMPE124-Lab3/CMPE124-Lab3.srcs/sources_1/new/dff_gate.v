`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 12:59:20 AM
// Design Name: 
// Module Name: dff_gate
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


module dff_gate(
    input wire D,
    input wire CLK,
    output wire Q,
    output wire nQ
    );
    wire nD, s, r;
    not  (nD, D);
    nand (s, D, CLK);
    nand (r, nD, CLK);
    nand (Q, s, nQ);
    nand (nQ, r, Q);
endmodule
