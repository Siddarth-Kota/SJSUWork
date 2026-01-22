`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2025 03:58:10 PM
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

    reg        clk;
    reg        reset_n;
    reg        in;
    wire [2:0] out;

    moore dut (
        .clk     (clk),
        .reset_n (reset_n),
        .in      (in),
        .out     (out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset_n = 0;
        in      = 0;

        @(posedge clk);

        reset_n = 1;

        in = 1;
        repeat (4) @(posedge clk);

        in = 0;
        repeat (4) @(posedge clk);

        $finish;
    end

    always @(posedge clk) begin
        $display("T=%0t ns | reset_n=%b in=%b | out=%0d",
                  $time, reset_n, in, out);
    end
endmodule
