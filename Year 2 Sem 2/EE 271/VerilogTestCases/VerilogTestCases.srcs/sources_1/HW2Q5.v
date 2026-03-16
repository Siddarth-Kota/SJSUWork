`timescale 1ns / 1ps

module HW2Q5 (
    input [31:0] total_mins,
    output reg [31:0] days,
    output reg [4:0] hours,
    output reg [5:0] mins
    );

    task convert_time;
        input [31:0] total_mins;
        output reg [31:0] d;
        output reg [4:0] h;
        output reg [5:0] m;
        begin
            d = total_mins / (24 * 60);
            h = (total_mins % (24 * 60)) / 60;
            m = total_mins % 60;
        end
    endtask

    always @(*) begin
        convert_time(total_mins, days, hours, mins);
    end
endmodule