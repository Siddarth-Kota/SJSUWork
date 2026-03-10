`timescale 1ns / 1ps

module CLA4 (
    input [3:0] A, B,
    input Ci,
    output [3:0] S,
    output Co, PG, GG
    );

    wire [3:0] G, P;
    wire [3:1] C;

    //CLA Logic
    CLALogic cla_logic(
        .G(G),
        .P(P),
        .Ci(Ci),
        
        .C(C),
        .Co(Co),
        .PG(PG),
        .GG(GG)
    );

    //Full Adders
    FullAdder fa0(.Ai(A[0]), .Bi(B[0]), .Cin(Ci), .Sum(S[0]), .G(G[0]), .P(P[0]));
    FullAdder fa1(.Ai(A[1]), .Bi(B[1]), .Cin(C[1]), .Sum(S[1]), .G(G[1]), .P(P[1]));
    FullAdder fa2(.Ai(A[2]), .Bi(B[2]), .Cin(C[2]), .Sum(S[2]), .G(G[2]), .P(P[2]));
    FullAdder fa3(.Ai(A[3]), .Bi(B[3]), .Cin(C[3]), .Sum(S[3]), .G(G[3]), .P(P[3]));
endmodule

module CLALogic(
    input [3:0] G, P,
    input Ci,
    output [3:1] C,
    output Co, PG, GG
    );

    //bit 1
    wire w_c1_and;
    and(w_c1_and, P[0], Ci);
    or(C[1], G[0], w_c1_and);

    //bit 2
    wire w_c2_and1, w_c2_and2;
    and(w_c2_and1, P[1], G[0]);
    and(w_c2_and2, P[1], P[0], Ci);
    or(C[2], G[1], w_c2_and1, w_c2_and2);

    //bit 3
    wire w_c3_and1, w_c3_and2, w_c3_and3;
    and(w_c3_and1, P[2], G[1]);
    and(w_c3_and2, P[2], P[1], G[0]);
    and(w_c3_and3, P[2], P[1], P[0], Ci);
    or(C[3], G[2], w_c3_and1, w_c3_and2, w_c3_and3);

    //PG
    and(PG, P[0], P[1], P[2], P[3]);

    //GG
    wire w_gg_and1, w_gg_and2, w_gg_and3;
    and(w_gg_and1, P[3], G[2]);
    and(w_gg_and2, P[3], P[2], G[1]);
    and(w_gg_and3, P[3], P[2], P[1], G[0]);
    or(GG, G[3], w_gg_and1, w_gg_and2, w_gg_and3);

    //Co
    wire w_co_and;
    and(w_co_and, PG, Ci);
    or(Co, GG, w_co_and);
endmodule

module FullAdder(
    input Ai, Bi, Cin,
    output Sum, G, P
    );

    xor(P, Ai, Bi);
    and(G, Ai, Bi);
    xor(Sum, P, Cin);

endmodule