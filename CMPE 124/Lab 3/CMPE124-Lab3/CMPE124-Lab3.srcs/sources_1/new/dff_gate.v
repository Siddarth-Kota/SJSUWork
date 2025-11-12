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
    output wire Qbar
    );
    wire nD, nCLK;
    not G0(nD, D);
    not G1(nCLK, CLK);
    
    wire Sm, Rm, Qm, Qm_Bar;
    nand G2 (Sm, D, CLK);
    nand G3 (Rm, nD,CLK);
    nand G4 (Qm, Sm, Qm_bar);
    nand G5 (Qm_bar, Rm, Qm);
    
    wire Ss, Rs;
    nand G6 (Ss, Qm, nCLK);
    nand G7 (Rs, Qm_bar, nCLK);
    nand G8 (Q, Ss, Qbar);
    nand G9 (Qbar, Rs, Q);
    
endmodule
