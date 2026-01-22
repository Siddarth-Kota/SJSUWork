`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 04:13:09 PM
// Design Name: 
// Module Name: tb5
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


module tb5;
reg [1:0] a, b;
reg cin;
wire [1:0] sum;
wire carry;


rca2bit #(.TINV(10), .TAND2(50), .TOR2(50)) DUT (.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));


integer i, j;


initial begin

cin = 1'b0;
i = 2'b00; j = 2'b00;


for (i=0; i<4; i=i+1) begin
    for (j=0; j<4; j=j+1) begin
        a = i[1:0];
        b = j[1:0];
        #250;
    end
end
$finish;
end
endmodule
