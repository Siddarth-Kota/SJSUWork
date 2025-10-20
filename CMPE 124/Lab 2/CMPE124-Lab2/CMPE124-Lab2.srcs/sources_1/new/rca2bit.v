`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 02:14:20 PM
// Design Name: 
// Module Name: rca2bit
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


module rca2bit(
    input  [1:0] a, b,
    input        cin,
    output [1:0] sum,
    output       cout
);
    wire c1;
    fadder1bit u0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .carry(c1));
    fadder1bit u1 (.a(a[1]), .b(b[1]), .cin(c1),  .sum(sum[1]), .carry(cout));
endmodule
