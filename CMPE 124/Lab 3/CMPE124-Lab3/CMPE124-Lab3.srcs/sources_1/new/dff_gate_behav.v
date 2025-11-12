`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 09:37:38 PM
// Design Name: 
// Module Name: dff_gate_behav
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


module dff_gate_behav(
    input wire D,
    input wire CLK,
    input wire RSTn,
    output reg Q
    );
    
    always @(posedge CLK or negedge RSTn) begin
        if(!RSTn) begin
            Q <= 0;
        end
        else begin
            Q <= D;
        end
    end
endmodule
