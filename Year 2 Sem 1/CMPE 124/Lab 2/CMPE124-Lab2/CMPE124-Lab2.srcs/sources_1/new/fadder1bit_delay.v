`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 02:06:18 PM
// Design Name: 
// Module Name: fadder1bit_delay
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


module fadder1bit_delay #(
    parameter integer TINV  = 10,   // ps
    parameter integer TAND2 = 50,   // ps
    parameter integer TOR2  = 50    // ps
)(
    input a, b, cin,
    output sum, carry
  );
  
    wire w1, w2, w3;
    wire notA, notB;
    wire anotb, abnot;
    wire abterm;
    wire notabterm;
    wire notcin;
    wire x1, x2;
    wire carry_w12;

    not #(TINV)  u_notA  (notA, a);
    and #(TAND2) u_anotb (anotb, notA, b);    
    not #(TINV)  u_notB  (notB, b);
    and #(TAND2) u_abnot (abnot, a, notB);
    or  #(TOR2)  u_ab    (abterm, anotb, abnot);

    not #(TINV)  u_notab (notabterm, abterm);
    and #(TAND2) u_x1    (x1, notabterm, cin);
    not #(TINV)  u_notcin(notcin, cin);
    and #(TAND2) u_x2    (x2, notcin, abterm);
    or  #(TOR2)  u_sum   (sum, x1, x2);

    and #(TAND2) u_w1 (w1, a, b);
    and #(TAND2) u_w2 (w2, a, cin);
    and #(TAND2) u_w3 (w3, b, cin);
    or  #(TOR2)  u_o1 (carry_w12, w1, w2);
    or  #(TOR2)  u_o2 (carry,     carry_w12, w3);

endmodule