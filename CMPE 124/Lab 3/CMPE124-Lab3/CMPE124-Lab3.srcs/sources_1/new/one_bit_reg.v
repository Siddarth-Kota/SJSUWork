`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 09:50:07 PM
// Design Name: 
// Module Name: one_bit_reg
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


module one_bit_reg(
    input wire D,
    input wire EN,
    input wire RST,
    input wire CLK,
    output wire Q
    );
    
    wire out_mux;
    assign out_mux = EN ? D : Q;
    dff_gate_behav uut(out_mux, RST, CLK, Q);
endmodule
