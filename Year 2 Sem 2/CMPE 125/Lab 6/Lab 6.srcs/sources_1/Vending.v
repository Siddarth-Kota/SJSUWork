module Vending(
    input wire clk, rst_n,
    input wire nickel,
    input wire dime,
    input wire quarter,

    output reg returnNickel,
    output reg returnDime,
    output reg returnTwoDimes,
    output reg dispense
);

    localparam S0  = 3'b000; //0 cents
    localparam S1  = 3'b001; //5 cents
    localparam S2 = 3'b010; //10 cents
    localparam S3 = 3'b011; //15 cents
    localparam S4 = 3'b100; //20 cents

    reg [2:0] cs, ns;

    always @(posedge clk or negedge rst_n) begin : CSLogic
        if (!rst_n) 
            cs <= S0;
        else 
            cs <= ns;
    end

    always @(*) begin : NS_Out_Logic
        ns = cs;
        dispense = 1'b0;
        returnNickel = 1'b0;
        returnDime = 1'b0;
        returnTwoDimes = 1'b0;

        case(cs)
            S0: begin
                if(nickel) begin
                    ns = S1;
                end
                else if(dime) begin
                    ns = S2;
                end 
                else if(quarter) begin
                    ns = S0;
                    dispense = 1'b1;
                end 
            end
            
            S1: begin
                if(nickel) begin
                    ns = S2;
                end
                else if(dime) begin
                    ns = S3;
                end 
                else if(quarter) begin
                    ns = S0;
                    returnNickel = 1'b1;
                    dispense = 1'b1;
                end 
            end
            
            S2: begin
                if(nickel) begin
                    ns = S3;
                end
                else if(dime) begin
                    ns = S4;
                end 
                else if(quarter) begin
                    ns = S0;
                    returnDime = 1'b1;
                    dispense = 1'b1;
                end 
            end
            
            S3: begin
                if(nickel) begin
                    ns = S4;
                end
                else if(dime) begin
                    ns = S0;
                    dispense = 1'b1;
                end 
                else if(quarter) begin
                    ns = S0;
                    returnNickel = 1'b1;
                    returnDime = 1'b1;
                    dispense = 1'b1;
                end 
            end
            
            S4: begin
                if(nickel) begin
                    ns = S0;
                    dispense = 1'b1;
                end
                else if(dime) begin
                    ns = S0;
                    returnNickel = 1'b1;
                    dispense = 1'b1;
                end 
                else if(quarter) begin
                    ns = S0;
                    returnTwoDimes = 1'b1;
                    dispense = 1'b1;
                end 
            end
            
            default: begin
                ns = S0;
            end
        endcase
    end
endmodule