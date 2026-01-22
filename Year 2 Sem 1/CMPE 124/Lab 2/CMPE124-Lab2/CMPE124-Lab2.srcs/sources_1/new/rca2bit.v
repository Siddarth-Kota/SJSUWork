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


module rca2bit #(
    parameter integer TINV  = 10,   // ps
    parameter integer TAND2 = 50,   // ps
    parameter integer TOR2  = 50    // ps
)(
    input  [1:0] a, b,
    input        cin,
    output [1:0] sum,
    output       carry
);
    wire c1;
    fadder1bit #(.TINV(TINV), .TAND2(TAND2), .TOR2(TOR2)) u0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .carry(c1));
    fadder1bit #(.TINV(TINV), .TAND2(TAND2), .TOR2(TOR2)) u1 (.a(a[1]), .b(b[1]), .cin(c1),  .sum(sum[1]), .carry(carry));
endmodule
