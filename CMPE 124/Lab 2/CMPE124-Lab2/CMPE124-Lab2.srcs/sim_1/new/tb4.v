`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 03:56:12 PM
// Design Name: 
// Module Name: tb4
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


module tb4;

reg a,b,cin;
wire sum,carry;

fadder1bit_delay #(.TINV(10), .TAND2(50), .TOR2(50)) adder(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));



initial begin
a = 0; b = 0; cin = 0;
#250;
a = 0; b = 0; cin = 1;
#250;
a = 0; b = 1; cin = 0;
#250;
a = 0; b = 1; cin = 1;
#250;
a = 1; b = 0; cin = 0;
#250;
a = 1; b = 0; cin = 1;
#250;
a = 1; b = 1; cin = 0;
#250;
a = 1; b = 1; cin = 1;
#250;
$finish();
end
endmodule
