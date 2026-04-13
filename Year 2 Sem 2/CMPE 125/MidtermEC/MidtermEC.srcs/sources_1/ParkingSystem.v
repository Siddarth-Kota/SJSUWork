module ParkingSystem(
    input wire clk, rst,
    input wire sensor_in, sensor_out,
    input wire [3:0] passcode_in,
    
    output reg gate_in, gate_out
    );

    localparam [3:0] passcode_default = 4'b1010;

    localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] cs, ns;
    reg [2:0] counter;

    always @(posedge clk or negedge rst) begin : CSLogic
        if (!rst) begin
            cs <= S0;
            counter <= 3'd0;
        end
        else begin
            cs <= ns;
            if(cs == S1)
                counter <= counter + 1;
            else
                counter <= 3'd0;
        end
    end

    always @(*) begin : NSLogic
        case (cs)
            S0: begin
                if(sensor_in ^ sensor_out) begin
                    ns = S1;
                end
                else begin
                    ns = S0;
                end
            end
            S1: begin
                if(counter == 3'd5) begin
                    if(passcode_in == passcode_default) begin
                        if(sensor_in) begin
                            ns = S2;
                        end
                        else if(sensor_out) begin
                            ns = S3;
                        end
                        else begin
                            ns = S0;
                        end
                    end
                    else begin
                        ns = S0;
                    end
                end
                else begin
                    ns = S1;
                end
            end
            S2: begin
                if(!sensor_in) begin
                    ns = S0;
                end
                else begin
                    ns = S2;
                end
            end
            S3: begin
                if(!sensor_out) begin
                    ns = S0;
                end
                else begin
                    ns = S3;
                end
            end
            default: ns = S0;
        endcase
    end

    always @(*) begin : OutputLogic
        gate_in = 1'b0;
        gate_out = 1'b0;
        if(cs == S2) gate_in = 1'b1;
        if(cs == S3) gate_out = 1'b1;
    end
endmodule