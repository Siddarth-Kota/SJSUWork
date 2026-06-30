`timescale 1ns / 1ps

module ALU_tb;
    reg [31:0] A;
    reg [31:0] B;
    reg [2:0] F;
    wire [31:0] Y;
    wire overflow;
    wire Cout;
    wire zero;

    reg [66:0] test_vectors [0:99]; 
    integer i;

    ALU dut (
        .A(A),
        .B(B),
        .F(F),
        .Y(Y),
        .overflow(overflow),
        .zero(zero),
        .Cout(Cout)
    );

    initial begin
        $readmemh("tests.tv", test_vectors);

        i = 0;
        
        while (test_vectors[i] !== 67'bx) begin
            {F, A, B} = test_vectors[i];
            
            #10;
            
            $display("Vector %0d | F=%b A=%h B=%h || Y=%h Z=%b", i, F, A, B, Y, zero);
            
            i = i + 1;
        end

        $display("Simulation complete. Ran %0d test vectors.", i);
        $finish;
    end
endmodule