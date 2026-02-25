`timescale 1ns / 1ps

module priority (
    input  wire [7:0] a,
    output wire [2:0] y,
    output wire valid
    );
    
    assign y = a[7] ? 3'd7 :
               a[6] ? 3'd6 :
               a[5] ? 3'd5 :
               a[4] ? 3'd4 :
               a[3] ? 3'd3 :
               a[2] ? 3'd2 :
               a[1] ? 3'd1 : 3'd0;
    assign valid = |a; 
endmodule