`timescale 1ps/1ps

module tb1;
    reg A, B, CIN;
    wire SUM, COUT;

    fadder dut (
        .A(A), 
        .B(B), 
        .CIN(CIN), 
        .SUM(SUM), 
        .COUT(COUT)
    );

    initial begin
        A = 0; B = 0; CIN = 0;
        #10;
        $display("A=%b, B=%b, CIN=%b => SUM=%b, COUT=%b", A, B, CIN, SUM, COUT);

        A = 0; B = 0; CIN = 1;
        #10;
        $display("A=%b, B=%b, CIN=%b => SUM=%b, COUT=%b", A, B, CIN, SUM, COUT);

        A = 0; B = 1; CIN = 0;
        #10;
        $display("A=%b, B=%b, CIN=%b => SUM=%b, COUT=%b", A, B, CIN, SUM, COUT);

        A = 0; B = 1; CIN = 1;
        #10;
        $display("A=%b, B=%b, CIN=%b => SUM=%b, COUT=%b", A, B, CIN, SUM, COUT);

        A = 1; B = 0; CIN = 0;
        #10;
        $display("A=%b, B=%b, CIN=%b => SUM=%b, COUT=%b", A, B, CIN, SUM, COUT);

        A = 1; B = 0; CIN = 1;
        #10;
        $display("A=%b, B=%b, CIN=%b => SUM=%b, COUT=%b", A, B, CIN, SUM, COUT);

        A = 1; B = 1; CIN = 0;
        #10;
        $display("A=%b, B=%b, CIN=%b => SUM=%b, COUT=%b", A, B, CIN, SUM, COUT);
        
        A = 1; B = 1; CIN = 1;
        #10;
        $display("A=%b, B=%b, CIN=%b => SUM=%b, COUT=%b", A, B, CIN, SUM, COUT);

        $finish;
    end
endmodule