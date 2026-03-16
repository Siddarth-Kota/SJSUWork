`timescale 1ns / 1ps

module HW2Q4_tb;
    reg [2:0] in;
    wire [15:0] out;

    HW2Q4 uut (
        .in(in),
        .out(out)
    );

    initial begin
        $display("SJSU ID: 017833894");
        
        in = 3; #10; $display("%0d! = %0d", in, out);
        in = 5; #10; $display("%0d! = %0d", in, out);
        in = 7; #10; $display("%0d! = %0d", in, out);

        $finish;
    end
endmodule