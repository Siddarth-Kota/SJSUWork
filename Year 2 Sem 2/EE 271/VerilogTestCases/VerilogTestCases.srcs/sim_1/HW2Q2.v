`timescale 1ns/1ps

module HW2Q2;
    reg a;
    
    initial begin
        $monitor ("monitor: a = %b at time %t", a, $time);
        $display ("display: a = %b at time %t", a, $time);
        #1 a = 1'b1;
    end
endmodule