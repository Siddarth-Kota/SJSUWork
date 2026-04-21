module TrueDualPortRam (
    input wire clk,
    
    //Port A
    input wire we_a,
    input wire [6:0] addr_a,
    input wire [7:0] d_a,
    output reg [7:0] q_a,

    //Port B
    input wire we_b,
    input wire [6:0] addr_b,
    input wire [7:0] d_b,
    output reg [7:0] q_b
    );

    reg [7:0] mem [127:0];

    always @(posedge clk) begin
        if (we_a)
            mem[addr_a] <= d_a;
        if (we_b)
            mem[addr_b] <= d_b;
        q_a <= mem[addr_a];
        q_b <= mem[addr_b];
    end
endmodule