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
  wire       carry;

  rca4bit dut (.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));
 
integer i, j;
integer total  = 0;
integer errors = 0;
reg [4:0] expected;
initial begin
    a   = 4'b0000;
    b   = 4'b0000;
    cin = 1'b0;
    
    $display("\n=== B=0000, Cin=0, A=0000..1111 (16 cases) ===");

    for (i = 0; i < 16; i = i + 1) begin
      a = i[3:0];
      #1;

      expected = a + b + cin;
      total    = total + 1;

      if (sum !== expected[3:0] || carry !== expected[4]) begin
        errors = errors + 1;
        $display("A=%b B=%b Cin=%b -> DUT{%b,%b}  EXP{%b,%b}  **FAIL**",
                 a, b, cin, carry, sum, expected[4], expected[3:0]);
      end else begin
        $display("A=%b B=%b Cin=%b -> DUT{%b,%b}  EXP{%b,%b}  PASS",
                 a, b, cin, carry, sum, expected[4], expected[3:0]);
      end
    end

    $display("\n=== Cin=0, For each B=0001..1111, A=0000..1111 (240 cases) ===");
    cin = 1'b0;

    for (j = 1; j < 16; j = j + 1) begin
      b = j[3:0];
      for (i = 0; i < 16; i = i + 1) begin
        a = i[3:0];
        #1;

        expected = a + b + cin;
        total    = total + 1;

        if (sum !== expected[3:0] || carry !== expected[4]) begin
          errors = errors + 1;
          $display("A=%b B=%b Cin=%b -> DUT{%b,%b}  EXP{%b,%b}  **FAIL**",
                   a, b, cin, carry, sum, expected[4], expected[3:0]);
        end else begin
          $display("A=%b B=%b Cin=%b -> DUT{%b,%b}  EXP{%b,%b}  PASS",
                   a, b, cin, carry, sum, expected[4], expected[3:0]);
        end
      end
    end
$finish();
end
endmodule