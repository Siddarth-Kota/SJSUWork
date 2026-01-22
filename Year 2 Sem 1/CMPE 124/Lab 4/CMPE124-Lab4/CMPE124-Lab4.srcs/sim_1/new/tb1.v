`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 03:32:45 PM
// Design Name: 
// Module Name: tb1
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


module tb1;
    reg RST;
    reg CLK;
    reg count;
    wire [3:0] Q;
    
    counter4Bit DUT (.RST(RST), .CLK(CLK), .count(count), .Q(Q));
    
    initial CLK = 0;
    always #5 CLK = ~CLK;
    
    always @(posedge CLK) begin
        $display("%5t |   %b    %b | %b", $time, RST, count, Q);
    end
    
    initial begin
        RST = 0; count = 0;
        repeat (3) @(posedge CLK);
        
        RST = 1; count = 1;
        repeat (20) @(posedge CLK);
        
        count = 0;
        repeat (5) @(posedge CLK);
        
        count = 1;
        repeat (4) @(posedge CLK);
        count = 0;
        repeat (3) @(posedge CLK);
        count = 1;
        repeat (6) @(posedge CLK);
        
        RST = 0;
        @(posedge CLK);
        RST = 1; count = 1;
        repeat (4) @(posedge CLK);
        
        $finish;
    end
endmodule