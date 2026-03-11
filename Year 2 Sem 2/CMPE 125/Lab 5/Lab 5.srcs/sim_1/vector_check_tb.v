`timescale 1ns / 1ps

module vector_check_tb;
    reg [3:0] A, B;
    reg Ci;

    wire [3:0] S;
    wire Co, PG, GG;

    reg [3:0] expected_S;
    reg expected_Co, expected_PG, expected_GG;

    reg [15:0] test_vector [10000:0];
    integer errors = 0;
    integer i = 0;

    CLA4 uut (.A(A), .B(B), .Ci(Ci), .S(S), .Co(Co), .PG(PG), .GG(GG));

    initial begin
        $display("\n--> Starting Vector Check Testbench");
        $readmemb("test_vector.tv", test_vector);

        {A, B, Ci, expected_S, expected_Co, expected_PG, expected_GG} = test_vector[i];
        #0.1;

        while(test_vector[i] !== 16'bx) begin
            if(S !== expected_S || Co !== expected_Co || PG !== expected_PG || GG !== expected_GG) begin
                $display("Test %0d Failed: A=%b, B=%b, Ci=%b | Expected S=%b, Co=%b, PG=%b, GG=%b | Got S=%b, Co=%b, PG=%b, GG=%b", i+1, A, B, Ci, expected_S, expected_Co, expected_PG, expected_GG, S, Co, PG, GG);
                errors = errors + 1;
            end
            #10;
            i = i + 1;
            {A, B, Ci, expected_S, expected_Co, expected_PG, expected_GG} = test_vector[i];
            #0.1;
        end

        if(errors == 0) $display("--> All Vector Check Tests Passed!\n");
        else $display("--> Vector Check Testbench Completed with %0d Errors\n", errors);

        $finish;
    end
endmodule