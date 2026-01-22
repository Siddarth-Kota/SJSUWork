`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2025 04:28:27 PM
// Design Name: 
// Module Name: tb2
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

module tb2;

    reg        clk;
    reg        reset_n;
    reg        stop;
    wire [2:0] count_out;
    wire       out;

    counter dut (
        .clk       (clk),
        .reset_n   (reset_n),
        .stop      (stop),
        .count_out (count_out),
        .out       (out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset_n = 0;
        stop    = 1;

        repeat (2) @(posedge clk);

        reset_n = 1;

        stop = 0;
        repeat (8) @(posedge clk);

        stop = 1;
        repeat (5) @(posedge clk);

        stop = 0;
        repeat (8) @(posedge clk);

        $finish;
    end

    always @(posedge clk) begin
        $display("T=%0t ns | reset_n=%b stop=%b | count_out=%0d (0x%0h) out=%b",
                 $time, reset_n, stop, count_out, count_out, out);
    end

endmodule

