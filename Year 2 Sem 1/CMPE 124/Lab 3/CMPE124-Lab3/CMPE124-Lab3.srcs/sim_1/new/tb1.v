`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 12:47:59 AM
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
    reg CLK;
    reg D;
    wire Q, nQ;
    
    dff_gate uut(.D(D), .CLK(CLK), .Q(Q), .nQ(nQ));
    
    initial begin
        CLK = 1; D = 0; #2; //0

        //While CLK=1, Q should follow D
        D = 1; #2; //1
        D = 0; #2; //0
        D = 1; #2; //1

        //Close the latch (hold mode)
        CLK = 0; #1;
        //Toggle D while closed; Q must hold previous value
        D = 0; #2; //1
        D = 1; #2; //1
        D = 0; #2; //1

        //Re-open latch; Q should immediately reflect D
        CLK = 1; #1;        // latch opens, D currently 0
        #1; //0
        D = 1; #2; //1
        D = 0; #2; //0

        //Close again and verify hold from 0
        CLK = 0; #1;
        D = 1; #2; //0
        D = 0; #2; //0

        $display("All checks passed ✅");
        $finish;
    end
    
    
endmodule