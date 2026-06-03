module StateMachine(
	input clk, rst,
	output reg [1:0] Q
	);

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			Q <= 2'b01;
		end
		else begin
			case(Q)
				2'b01: Q <= 2'b10;
				2'b10: Q <= 2'b11;
				2'b11: Q <= 2'b01;
				default: Q <= 2'b01;
			endcase
		end
	end
endmodule