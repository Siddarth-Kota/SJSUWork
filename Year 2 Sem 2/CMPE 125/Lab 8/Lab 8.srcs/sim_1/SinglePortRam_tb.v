`timescale 1ns / 1ps

module SinglePortRam_tb;

    reg [7:0] d;
    reg [6:0] a;
    reg we, clk;

    wire [7:0] q;

    SinglePortRam dut(
        .q(q), 
        .a(a), 
        .d(d), 
        .we(we), 
        .clk(clk)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        we = 1;
        a = 0;
        d = 0;

        #10;

        @(negedge clk);
        we = 1;
        a = 7'd15;
        d = 8'hAA;

        @(negedge clk);
        a = 7'd120;
        d = 8'h55;

        @(negedge clk);
        we = 0;

        @(negedge clk);
        a = 7'd15;
        #1;
        if(q == 8'hAA)
            $display("Test 1 Passed: Read value at address 15 is correct.");
        else
            $display("Test 1 Failed: Read value at address 15 is incorrect. Expected: 0xAA, Got: %h", q);

        @(negedge clk);
        a = 7'd120;
        #1;
        if(q == 8'h55)
            $display("Test 2 Passed: Read value at address 120 is correct.");
        else
            $display("Test 2 Failed: Read value at address 120 is incorrect. Expected: 0x55, Got: %h", q);

        #20; $finish;
    end
endmodule