`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2025 03:25:06 PM
// Design Name: 
// Module Name: tb3_1
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


module tb3_1;
    reg A, B, C, sel1, sel2;
    wire out;
    
    mux3_1 dut(.A(A), .B(B), .C(C), .sel1(sel1), .sel2(sel2), .out(out));
    
    integer i;
    initial begin
    
        //Sel 0 cases (sel1 & sel2 = 0) -> should follow A  
        A = 0; B = 0; C = 0; sel1 = 0; sel2 = 0; 
        #10;
        A = 0; B = 0; C = 1; sel1 = 0; sel2 = 0;
        #10;
        A = 0; B = 1; C = 0; sel1 = 0; sel2 = 0;
        #10;
        A = 0; B = 1; C = 1; sel1 = 0; sel2 = 0;
        #10;
        A = 1; B = 0; C = 0; sel1 = 0; sel2 = 0;
        #10;
        A = 1; B = 0; C = 1; sel1 = 0; sel2 = 0;
        #10;
        A = 1; B = 1; C = 0; sel1 = 0; sel2 = 0;
        #10;
        A = 1; B = 1; C = 1; sel1 = 0; sel2 = 0;
        #10;
        
        //Sel 1 cases (sel1 = 0, sel2 = 1) -> should follow B
        A = 0; B = 0; C = 0; sel1 = 0; sel2 = 1; 
        #10;
        A = 0; B = 0; C = 1; sel1 = 0; sel2 = 1;
        #10;
        A = 0; B = 1; C = 0; sel1 = 0; sel2 = 1;
        #10;
        A = 0; B = 1; C = 1; sel1 = 0; sel2 = 1;
        #10;
        A = 1; B = 0; C = 0; sel1 = 0; sel2 = 1;
        #10;
        A = 1; B = 0; C = 1; sel1 = 0; sel2 = 1;
        #10;
        A = 1; B = 1; C = 0; sel1 = 0; sel2 = 1;
        #10;
        A = 1; B = 1; C = 1; sel1 = 0; sel2 = 1;
        #10;
        
        //Sel 2 cases (sel1 = 1) -> should follow C
        A = 0; B = 0; C = 0; sel1 = 1; 
        #10;
        A = 0; B = 0; C = 1; sel1 = 1;
        #10;
        A = 0; B = 1; C = 0; sel1 = 1;
        #10;
        A = 0; B = 1; C = 1; sel1 = 1;
        #10;
        A = 1; B = 0; C = 0; sel1 = 1;
        #10;
        A = 1; B = 0; C = 1; sel1 = 1;
        #10;
        A = 1; B = 1; C = 0; sel1 = 1;
        #10;
        A = 1; B = 1; C = 1; sel1 = 1;
        #10;
        
        
        $display("s1 s2 A B C | out");
        for (i = 0; i < 24; i = i + 1) begin
            {sel1, sel2, A, B, C} = i[4:0];
            #1;
            $display(" %0d  %0d %0d %0d %0d |  %0d", sel1, sel2, A, B, C, out);
        end
        $finish;
    end
endmodule
