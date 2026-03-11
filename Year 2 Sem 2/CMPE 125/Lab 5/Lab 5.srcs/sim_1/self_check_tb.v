`timescale 1ns / 1ps

module self_check_tb;
    reg [3:0] A, B;
    reg Ci;

    wire [3:0] S;
    wire Co, PG, GG;

    CLA4 uut (.A(A), .B(B), .Ci(Ci), .S(S), .Co(Co), .PG(PG), .GG(GG));

    initial begin
        $display("\n--> Starting Self-Check Testbench");

        //0 Test + Error Check (PG should be 0)
        A = 4'b0000; B = 4'b0000; Ci = 1'b0; #0.1;
        if(S != 4'b0000 || Co != 1'b0 || PG != 1'b1 || GG != 1'b0) $display("Test 1 Failed, Expected S=0000, Co=0, PG=1, GG=0 | Got S=%b, Co=%b, PG=%b, GG=%b", S, Co, PG, GG);
        #10;

        //PG Test
        A = 4'b1010; B = 4'b0101; Ci = 1'b0; #0.1;
        if(S != 4'b1111 || Co != 1'b0 || PG != 1'b1 || GG != 1'b0) $display("Test 2 Failed, Expected S=1111, Co=0, PG=1, GG=0 | Got S=%b, Co=%b, PG=%b, GG=%b", S, Co, PG, GG);
        #10;

        //GG + Co Test
        A = 4'b0111; B = 4'b1001; Ci = 1'b0; #0.1;
        if(S != 4'b0000 || Co != 1'b1 || PG != 1'b0 || GG != 1'b1) $display("Test 3 Failed, Expected S=0000, Co=1, PG=0, GG=1 | Got S=%b, Co=%b, PG=%b, GG=%b", S, Co, PG, GG);
        #10;

        //Ci + PG Test
        A = 4'b1111; B = 4'b0000; Ci = 1'b1; #0.1;
        if(S != 4'b0000 || Co != 1'b1 || PG != 1'b1 || GG != 1'b0) $display("Test 4 Failed, Expected S=0000, Co=1, PG=1, GG=0 | Got S=%b, Co=%b, PG=%b, GG=%b", S, Co, PG, GG);
        #10;

        $display("--> Self-Check Testbench Completed\n");
        $finish;
    end
endmodule