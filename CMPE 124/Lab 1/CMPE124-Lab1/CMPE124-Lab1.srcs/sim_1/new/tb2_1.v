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
    
        //Add test stuff
        
        $display("sel A B | out");
        for (i = 0; i < 8; i = i + 1) begin
            {sel, A, B} = i[2:0];
            #1;
            $display(" %0d  %0d %0d |  %0d", sel, A, B, out);
        end
        $finish;
    end
endmodule