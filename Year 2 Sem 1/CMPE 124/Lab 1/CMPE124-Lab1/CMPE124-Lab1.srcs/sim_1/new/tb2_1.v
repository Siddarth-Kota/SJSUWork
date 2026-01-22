`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2025 01:38:08 PM
// Design Name: 
// Module Name: tb2_1
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


module tb2_1;
    reg A, B, sel;
    wire out;
    
    mux2_1 dut(.A(A), .B(B), .sel(sel), .out(out));
    
    integer i;
    initial begin  
        //Sel 0 cases -> should follow B  
        A = 0; B = 0; sel = 0; 
        #10;
        A = 0; B = 1; sel = 0;
        #10;
        A = 1; B = 0; sel = 0;
        #10;
        A = 1; B = 1; sel = 0;
        #10;
        
        //Sel 1 cases -> should follow A
        A = 0; B = 0; sel = 1; 
        #10;
        A = 0; B = 1; sel = 1;
        #10;
        A = 1; B = 0; sel = 1;
        #10;
        A = 1; B = 1; sel = 1;
        #10;
        
        $display("sel A B | out");
        for (i = 0; i < 8; i = i + 1) begin
            {sel, A, B} = i[2:0];
            #1;
            $display(" %0d  %0d %0d |  %0d", sel, A, B, out);
        end
        $finish;
    end
endmodule