`timescale 1ns / 1ps

module tb2;
    reg a, b, c;
    wire y;

    minority dut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        // 000
        a = 0; b = 0; c = 0;
        #10;
        
        // 001
        a = 0; b = 0; c = 1;
        #10;
        
        // 010
        a = 0; b = 1; c = 0;
        #10;
        
        // 011
        a = 0; b = 1; c = 1;
        #10;
        
        // 100
        a = 1; b = 0; c = 0;
        #10;
        
        // 101
        a = 1; b = 0; c = 1;
        #10;
        
        // 110
        a = 1; b = 1; c = 0;
        #10;
        
        // 111
        a = 1; b = 1; c = 1;
        #10;

        $finish;
    end
endmodule