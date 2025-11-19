`timescale 1ns / 1ps
module mux2(
    input wire a, b,
    input wire sel,
    output wire out
    );
    
    assign out = sel ? b : a;

endmodule
