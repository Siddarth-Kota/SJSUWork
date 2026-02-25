`timescale 1ps/1ps

module fadder (
        input A, 
        input B, 
        input CIN, 
        output SUM, 
        output COUT
    );

  assign SUM = A ^ B ^ CIN;
  assign COUT = (A & B) | (CIN & (A ^ B));
endmodule