`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2025 03:19:55 PM
// Design Name: 
// Module Name: rca4bit
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


module rca4bit(
input [3:0] a, b,
input cin,
output [3:0] sum,
output carry
    );
    
wire c1,c2,c3;

fadder1bit u0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .carry(c1));
fadder1bit u1 (.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .carry(c2));
fadder1bit u2 (.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .carry(c3));
fadder1bit u3 (.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .carry(carry));

endmodule
