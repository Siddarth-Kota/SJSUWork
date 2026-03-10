`timescale 1ns / 1ps

module Q4(
    input A, clk, rst,
    output reg out
    );

    reg [1:0] cs;
    reg [1:0] ns;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            cs <= 2'b00;
        end
        else begin
            cs <= ns;
        end
    end

    always @(*) begin
        case(cs)
            2'b00: begin
                ns = 2'b01;
                out = 0;
            end

            2'b01: begin
                case(A)
                    1'b0: begin
                        ns = 2'b00;
                        out = 0;
                    end
                    1'b1: begin
                        ns = 2'b10;
                        out = 1;
                    end
                endcase
            end

            2'b10: begin
                ns = 2'b00;
                out = 0;
            end

        endcase
    end
endmodule