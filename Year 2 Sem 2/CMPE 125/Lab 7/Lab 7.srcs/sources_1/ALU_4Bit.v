module ALU_4Bit (
    input [3:0] A,
    input [3:0] B,
    input [2:0]  F,
    output reg [3:0] Y,
    output reg Cout,
    output reg overflow,
    output wire zero
);

    assign zero = (Y == 4'b0) ? 1'b1 : 1'b0;

    always @(*) begin
        Cout = 1'b0;
        overflow = 1'b0;
        
        case(F)
            3'b000: Y = A & B; // AND
            3'b001: Y = A | B; // OR
            
            3'b010: begin // ADD
                {Cout, Y} = A + B;
                overflow = (A[3] == B[3]) && (Y[3] != A[3]);
            end
            
            3'b110: begin // SUB
                {Cout, Y} = A + ~B + 1'b1; 
                overflow = (A[3] == ~B[3]) && (Y[3] != A[3]);
            end
            
            3'b111: begin // SLT
                Y = {3'b0, $signed(A) < $signed(B)};
                Cout = 1'b0;
            end

            default: Y = 4'b0;
        endcase
    end
    
endmodule