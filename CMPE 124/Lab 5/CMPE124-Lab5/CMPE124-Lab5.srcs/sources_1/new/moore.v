`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2025 03:46:53 PM
// Design Name: 
// Module Name: moore
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


module moore (
    input  wire       clk,
    input  wire       reset_n,   // active-low synchronous reset
    input  wire       in,
    output reg  [2:0] out
);

    localparam S0 = 0;
    localparam S1 = 1;
    localparam S2 = 3;
    localparam S3 = 2;

    reg [1:0] state, next_state;

    always @(posedge clk) begin
        if (!reset_n)
            state <= S0;
        else
            state <= next_state;
    end

    always @* begin
        next_state = state;
        case (state)
            S0:  next_state = (in ? S1 : S0);
            S1:  next_state = (in ? S2 : S1);
            S2:  next_state = (in ? S3 : S2);
            S3:  next_state = (in ? S1 : S3);
            default: next_state = S0;
        endcase
    end

    always @* begin
        case (state)
            S0:      out = 3'd1;
            S1:      out = 3'd2;
            S2:      out = 3'd3;
            S3:      out = 3'd4;
            default: out = 3'd0;
        endcase
    end
endmodule
