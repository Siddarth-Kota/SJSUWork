`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2025 03:26:35 PM
// Design Name: 
// Module Name: tb2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb2;

  reg  [3:0] a, b;
  reg        cin;
  wire [3:0] sum;
  wire       cout;

  // Keep your DUT name/ports
  rca4bit dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  // Loop counters and bookkeeping
  integer i, j;
  integer total = 0, mism = 0;
  reg [4:0] exp5; // {expected_cout, expected_sum}

  // Optional waves
  initial begin
    $dumpfile("rca4.vcd");
    $dumpvars(0, tb2);
  end

  initial begin
    cin = 1'b0;

    // ---- Part 1: B=0000, A=0000..1111 ----
    b = 4'b0000;
    for (i = 0; i < 16; i = i + 1) begin
      a = i[3:0];
      #1; // settle
      exp5 = a + b + cin;
      total = total + 1;
      if ({cout, sum} !== exp5) begin
        mism = mism + 1;
        $display("FAIL P1  A=%b B=%b Cin=%b  -> got {C,S}=%b%b  exp=%b",
                 a,b,cin,cout,sum,exp5);
      end
      #9; // complete 10ns step per vector
    end

    // ---- Part 2: For B=0001..1111, A=0000..1111 ----
    for (j = 1; j < 16; j = j + 1) begin
      b = j[3:0];
      for (i = 0; i < 16; i = i + 1) begin
        a = i[3:0];
        #1; // settle
        exp5 = a + b + cin;
        total = total + 1;
        if ({cout, sum} !== exp5) begin
          mism = mism + 1;
          $display("FAIL P2  A=%b B=%b Cin=%b  -> got {C,S}=%b%b  exp=%b",
                   a,b,cin,cout,sum,exp5);
        end
        #9;
      end
    end

    $display("\nRCA4 test complete: %0d cases, mismatches=%0d -> %s",
             total, mism, (mism==0) ? "PASS" : "FAIL");
    $finish;
  end
endmodule