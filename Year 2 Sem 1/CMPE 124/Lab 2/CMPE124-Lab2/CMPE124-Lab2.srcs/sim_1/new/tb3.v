`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 01:40:50 PM
// Design Name: 
// Module Name: tb3
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


module tb3;

reg  [3:0] a, b;
reg        cin;
wire [3:0] sum;
wire       carry;

wire [3:0] b_inv;
not n0(b_inv[0], b[0]);
not n1(b_inv[1], b[1]);
not n2(b_inv[2], b[2]);
not n3(b_inv[3], b[3]);

rca4bit dut (.a(a), .b(b_inv), .cin(cin), .sum(sum), .carry(carry));
 
integer i, j;
integer total  = 0;
integer errors = 0;
reg [4:0] expected;
initial begin
    a   = 4'b0000;
    b   = 4'b0000;
    cin = 1'b1;
    
    $display("\n=== Subtractor mode (Cin=1, B inverted) : A - B (256 cases) ===");

    for (j = 0; j < 16; j = j + 1) begin
      b = j[3:0];
      for (i = 0; i < 16; i = i + 1) begin
        a = i[3:0];
        #1;

        expected = {1'b0, a} + {1'b0, (~b)} + 5'b00001;
        total    = total + 1;

        if (sum !== expected[3:0] || carry !== expected[4]) begin
          errors = errors + 1;
          $display("SUB  A=%b B=%b Cin=%b -> DUT{%b,%b}  EXP{%b,%b}  **FAIL**",
                   a, b, cin, carry, sum, expected[4], expected[3:0]);
        end else begin
          $display("SUB  A=%b B=%b Cin=%b -> DUT{%b,%b}  EXP{%b,%b}  PASS",
                   a, b, cin, carry, sum, expected[4], expected[3:0]);
        end
      end
    end
$finish();
end
endmodule
