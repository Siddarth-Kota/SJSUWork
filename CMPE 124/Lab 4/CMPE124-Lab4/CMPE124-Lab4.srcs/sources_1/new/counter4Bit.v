`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 03:11:51 PM
// Design Name: 
// Module Name: counter4Bit.v
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

module counter4Bit(
    input wire RST, CLK, count,
    output wire [3:0] Q
    );
    
    wire [3:0] inc;
    wire cout_ignored;
    wire [3:0] D;
    
    rca4 Adder (.a(Q), .b(1), .cin(0), .sum(inc), .cout(cout_ignored));
    
    mux2 m0 (.a(Q[0]), .b(inc[0]), .sel(count), .out(D[0]));
    mux2 m1 (.a(Q[1]), .b(inc[1]), .sel(count), .out(D[1]));
    mux2 m2 (.a(Q[2]), .b(inc[2]), .sel(count), .out(D[2]));
    mux2 m3 (.a(Q[3]), .b(inc[3]), .sel(count), .out(D[3]));
    
    dff d0 (.CLK(CLK), .RST(RST), .D(D[0]), .Q(Q[0]));
    dff d1 (.CLK(CLK), .RST(RST), .D(D[1]), .Q(Q[1]));
    dff d2 (.CLK(CLK), .RST(RST), .D(D[2]), .Q(Q[2]));
    dff d3 (.CLK(CLK), .RST(RST), .D(D[3]), .Q(Q[3]));    
endmodule
