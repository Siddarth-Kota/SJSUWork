`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2025 01:22:07 PM
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(
    input wire A,
    input wire B,
    input wire sel,
    output wire out
    );
    
    wire nsel, a_term, b_term;
    
    not u_inv(nsel, sel);
    and u_and_a(a_term, sel, A);
    and u_and_b(b_term, sel, B);
    or u_or(out, a_term, b_term);    
endmodule


