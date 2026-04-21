`timescale 1ns / 1ps

module DualPortRam_tb();

    reg clk_a, clk_b;
    reg we_a, we_b;
    reg [6:0] addr_a, addr_b;
    reg [7:0] d_a, d_b;
    wire [7:0] q_a, q_b;

    DualPortRam dut (
        .clk_a(clk_a), .clk_b(clk_b),
        .we_a(we_a), .addr_a(addr_a), .d_a(d_a), .q_a(q_a),
        .we_b(we_b), .addr_b(addr_b), .d_b(d_b), .q_b(q_b)
    );

    always #5 clk_a = ~clk_a;
    always #7 clk_b = ~clk_b;

    initial begin
        clk_a = 0; clk_b = 0;
        we_a = 0; addr_a = 0; d_a = 0;
        we_b = 0; addr_b = 0; d_b = 0;

        #20;

        @(negedge clk_a);
        we_a = 1; addr_a = 7'd55; d_a = 8'hF0;

        @(negedge clk_a);
        we_a = 0;

        @(negedge clk_b);
        addr_b = 7'd55;

        @(posedge clk_b);
        #1;
        if(q_b == 8'hF0)
            $display("Test Passed: Read value at address 55 is correct.");
        else
            $display("Test Failed: Read value at address 55 is incorrect. Expected: 0xF0, Got: %h", q_b);
        
        #20; $finish;
    end
endmodule