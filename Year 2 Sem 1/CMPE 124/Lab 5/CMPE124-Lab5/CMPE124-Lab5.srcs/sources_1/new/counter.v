`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2025 04:22:04 PM
// Design Name: 
// Module Name: counter
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


module counter (
    input  wire       clk,
    input  wire       reset_n,
    input  wire       stop,
    output reg  [2:0] count_out,
    output wire       out
);

    always @(posedge clk) begin
        if (!reset_n)
            count_out <= 3'b000;
        else if (!stop)
            count_out <= count_out + 3'b001;
        else
            count_out <= count_out;
    end

    assign out = (count_out == 3'b010);
endmodule
