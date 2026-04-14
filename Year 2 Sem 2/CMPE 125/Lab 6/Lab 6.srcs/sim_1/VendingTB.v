`timescale 1ns / 1ps

module VendingTB;

    // Inputs
    reg clk, rst_n;
    reg nickel;
    reg dime;
    reg quarter;

    // Outputs
    wire dispense;
    wire returnNickel;
    wire returnDime;
    wire returnTwoDimes;

    reg [6:0] test_vector [0:31]; 
    reg [3:0] expected_out;
    
    integer i = 0;
    integer errors = 0;

    Vending dut (
        .clk(clk),
        .rst_n(rst_n),
        .nickel(nickel),
        .dime(dime),
        .quarter(quarter),
        .dispense(dispense),
        .returnNickel(returnNickel),
        .returnDime(returnDime),
        .returnTwoDimes(returnTwoDimes)
    );

    always #5 clk = ~clk;

    initial begin        
        clk = 0;
        errors = 0;
        nickel = 0; 
        dime = 0; 
        quarter = 0;
        
        rst_n = 0; 
        #15;
        rst_n = 1;
        #10;

        $readmemb("test_vector.tv", test_vector);
        $display("\n--- Starting Vending Machine Testbench ---");

        while (test_vector[i] !== 7'bx) begin            
            {nickel, dime, quarter, expected_out} = test_vector[i];
            
            #5;

            if ({dispense, returnNickel, returnDime, returnTwoDimes} !== expected_out) begin
                $display("\n--> ERROR at Vector %0d:", i);
                $display("Inputs: rst_n=%b, N=%b, D=%b, Q=%b", rst_n, nickel, dime, quarter);
                $display("Expected: disp=%b, retN=%b, retD=%b, ret2D=%b", expected_out[3], expected_out[2], expected_out[1], expected_out[0]);
                $display("Got: disp=%b, retN=%b, retD=%b, ret2D=%b\n", dispense, returnNickel, returnDime, returnTwoDimes);
                errors = errors + 1;
            end
            
            @(posedge clk);
            i = i + 1;
        end

        if (errors == 0)
            $display("All tests passed successfully!");
        else
            $display("FAILED: %0d errors found.", errors);
        $finish;
    end
endmodule