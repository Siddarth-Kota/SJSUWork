`timescale 1ns / 1ps
module dff(
    input wire CLK, RST,
    input wire D,
    output reg Q
    );
    
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            Q <= 0;
        end
        else begin
            Q <= D;
        end
    end
endmodule
