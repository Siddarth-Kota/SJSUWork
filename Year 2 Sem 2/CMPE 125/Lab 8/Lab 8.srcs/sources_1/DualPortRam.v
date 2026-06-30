module DualPortRam (

    //Port A
    input wire clk_a,
    input wire we_a,
    input wire [6:0] addr_a,
    input wire [7:0] d_a,
    output reg [7:0] q_a,

    //Port B
    input wire clk_b,
    input wire we_b,
    input wire [6:0] addr_b,
    input wire [7:0] d_b,
    output reg [7:0] q_b
    );

    reg [7:0] mem [127:0];

    always @(posedge clk_a) begin
        if (we_a)
            mem[addr_a] <= d_a;
        q_a <= mem[addr_a];
    end

    always @(posedge clk_b) begin
        if (we_b && addr_b == addr_a)
            mem[addr_b] <= d_b;
        q_b <= mem[addr_b];
    end
endmodule