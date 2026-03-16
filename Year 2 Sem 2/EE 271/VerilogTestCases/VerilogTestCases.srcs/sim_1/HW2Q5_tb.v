`timescale 1ns / 1ps

module HW2Q5_tb;
    reg [31:0] total_mins;
    wire [31:0] days;
    wire [4:0] hours;
    wire [5:0] mins;

    HW2Q5 uut (
        .total_mins(total_mins),
        .days(days),
        .hours(hours),
        .mins(mins)
    );

    initial begin
        $display("SJSU ID: 017833894");
        
        total_mins = 2000; #10;
        $display("%0d mins = %0d day %0d hrs %0d mins", total_mins, days, hours, mins);
        
        total_mins = 4500; #10;
        $display("%0d mins = %0d day %0d hrs %0d mins", total_mins, days, hours, mins);
        
        $finish;
    end
endmodule