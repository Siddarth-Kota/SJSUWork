module ALU (
    input [31:0] A,
    input [31:0] B,
    input [2:0]  F,
    output reg [31:0] Y,
    output reg Cout,
    output reg overflow,
    output wire zero
);

    assign zero = (Y == 32'b0) ? 1'b1 : 1'b0;

    always @(*) begin
        Cout = 1'b0;
        overflow = 1'b0;
        
        case(F)
            3'b000: Y = A & B; // AND
            3'b001: Y = A | B; // OR
            
            3'b010: begin // ADD
                {Cout, Y} = A + B;
                overflow = (A[31] == B[31]) && (Y[31] != A[31]);
            end
            
            3'b110: begin // SUB
                {Cout, Y} = A + ~B + 1'b1; 
                overflow = (A[31] == ~B[31]) && (Y[31] != A[31]);
                //0011 - 0110 = 1010
            end
            
            3'b111: begin // SLT
                Y = {31'b0, $signed(A) < $signed(B)};
                Cout = 1'b0;
            end

            default: Y = 32'b0;
        endcase
    end
    
endmodule