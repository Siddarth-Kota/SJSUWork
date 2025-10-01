`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2025 01:43:47 PM
// Design Name: 
// Module Name: mux3_1
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


module mux3_1(
    input wire A,
    input wire B,
    input wire C,
    input wire sel1,
    input wire sel2,
    output wire out
    );
    
    wire nsel1, nsel2;
    wire a_term, b_term, c_term;
    
    not u_inv1(nsel1, sel1);
    not u_inv2(nsel2, sel2);
    
    and u_and_a(a_term, nsel1, nsel2, A);
    and u_and_b(b_term, nsel1, sel2, B);
    and u_and_c(c_term, sel1, C);
    or u_or(out, a_term, b_term, c_term);
endmodule
