`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2025 02:36:28 PM
// Design Name: 
// Module Name: fadder1bit
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


module fadder1bit(
    input a, b, cin,
    output sum, carry
    );
    
    wire w1, w2, w3;
    wire notA, notB;
    wire anotb,abnot;
    wire abterm;
    wire notabterm, notcin;
    wire x1, x2;
    
    //sum output
    not(notA, a);
    and(anotb,notA,b);
    not(notB, b);
    and(abnot,a,notB);
    or(abterm, anotb, abnot);
    
    not(notabterm, abterm);
    and(x1,notabterm,cin);
    not(notcin, cin);
    and(x2,notcin,abterm);
    or(sum, x1, x2);
    
    //carry output
    and(w1, a, b);
    and(w2, a, cin);
    and(w3, b, cin);
    or(carry,w1,w2,w3);
    
endmodule
