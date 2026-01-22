`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 09:57:28 PM
// Design Name: 
// Module Name: one_bit_reg_behav
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


module one_bit_reg_behav(
    input wire D,
    input wire EN,
    input wire RST,
    input wire CLK,
    output reg Q
    );
    
    always @(posedge CLK or negedge RST) begin
        if (!RST) 
            Q <= 0;
        else if (EN)
            Q <= D;
    end
endmodule
