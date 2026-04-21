`timescale 1ns / 1ps

module TrueDualPortRam_tb();

    reg clk;

    reg we_a, we_b;
    reg [6:0] addr_a, addr_b;
    reg [7:0] d_a, d_b;
    wire [7:0] q_a, q_b;

    TrueDualPortRam dut (
        .clk(clk),
        .we_a(we_a), .addr_a(addr_a), .d_a(d_a), .q_a(q_a),
        .we_b(we_b), .addr_b(addr_b), .d_b(d_b), .q_b(q_b)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        we_a = 0; addr_a = 0; d_a = 0;
        we_b = 0; addr_b = 0; d_b = 0;

        #10;

        @(negedge clk);
        we_a = 1; addr_a = 7'd10; d_a = 8'hAA;
        we_b = 1; addr_b = 7'd20; d_b = 8'hBB;

        @(negedge clk);
        we_a = 0; addr_a = 7'd10;
        we_b = 0; addr_b = 7'd20;

        @(posedge clk);
        #1;
        if(q_a == 8'hAA && q_b == 8'hBB)
            $display("Test Passed: Read values at addresses 10 and 20 are correct.");
        else
            $display("Test Failed: Read values at addresses 10 and/or 20 are incorrect. Expected: 0xAA and 0xBB, Got: %h and %h", q_a, q_b);

        @(negedge clk);
        we_a = 1; addr_a = 7'd30; d_a = 8'hCC;
        we_b = 0; addr_b = 7'd10;

        @(posedge clk);
        #1;
        if(q_b == 8'hAA)
            $display("Test Passed: Read value at address 10 is correct after Port A write.");
        else
            $display("Test Failed: Read value at address 10 is incorrect after Port A write. Expected: 0xAA, Got: %h", q_b);

        #20; $finish;
    end
endmodule