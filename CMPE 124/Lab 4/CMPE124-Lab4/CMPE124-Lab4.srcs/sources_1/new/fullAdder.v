`timescale 1ns / 1ps
module fullAdder(
    input wire a, b, cin,
    output wire sum, cout
    );
    assign {cout, sum} = a + b + cin;
    
endmodule
