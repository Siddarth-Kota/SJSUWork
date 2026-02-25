`timescale 1ns / 1ps

module tb1;
    reg [3:0] D;
    wire [6:0] seg;

    seg7 dut (
        .D(D),
        .seg(seg)
    );

    initial begin
        for (integer i = 0; i < 16; i = i + 1) begin
            D = i;
            #10;
        end
        $finish;
    end
endmodule