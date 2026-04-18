module PA_16bit (
    input [15:0] A, B,
    input Cin,

    output [15:0] Sum,
    output Cout
    );

    wire [15:0] P0, G0;
    wire [15:0] P1, G1;
    wire [15:0] P2, G2;
    wire [15:0] P3, G3;
    wire [15:0] P4, G4;

    or (P0[0], A[0], B[0]); and (G0[0], A[0], B[0]);
    or (P0[1], A[1], B[1]); and (G0[1], A[1], B[1]);
    or (P0[2], A[2], B[2]); and (G0[2], A[2], B[2]);
    or (P0[3], A[3], B[3]); and (G0[3], A[3], B[3]);
    or (P0[4], A[4], B[4]); and (G0[4], A[4], B[4]);
    or (P0[5], A[5], B[5]); and (G0[5], A[5], B[5]);
    or (P0[6], A[6], B[6]); and (G0[6], A[6], B[6]);
    or (P0[7], A[7], B[7]); and (G0[7], A[7], B[7]);
    or (P0[8], A[8], B[8]); and (G0[8], A[8], B[8]);
    or (P0[9], A[9], B[9]); and (G0[9], A[9], B[9]);
    or (P0[10], A[10], B[10]); and (G0[10], A[10], B[10]);
    or (P0[11], A[11], B[11]); and (G0[11], A[11], B[11]);
    or (P0[12], A[12], B[12]); and (G0[12], A[12], B[12]);
    or (P0[13], A[13], B[13]); and (G0[13], A[13], B[13]);
    or (P0[14], A[14], B[14]); and (G0[14], A[14], B[14]);
    or (P0[15], A[15], B[15]); and (G0[15], A[15], B[15]);


    black_box bb1_0  (.pik(P0[0]),  .gik(G0[0]),  .pkj(1'b0),  .gkj(Cin),   .pij(P1[0]),  .gij(G1[0]));
    assign P1[1] = P0[1]; assign G1[1] = G0[1];
    black_box bb1_2  (.pik(P0[2]),  .gik(G0[2]),  .pkj(P0[1]), .gkj(G0[1]), .pij(P1[2]),  .gij(G1[2]));
    assign P1[3] = P0[3]; assign G1[3] = G0[3];
    black_box bb1_4  (.pik(P0[4]),  .gik(G0[4]),  .pkj(P0[3]), .gkj(G0[3]), .pij(P1[4]),  .gij(G1[4]));
    assign P1[5] = P0[5]; assign G1[5] = G0[5];
    black_box bb1_6  (.pik(P0[6]),  .gik(G0[6]),  .pkj(P0[5]), .gkj(G0[5]), .pij(P1[6]),  .gij(G1[6]));
    assign P1[7] = P0[7]; assign G1[7] = G0[7];
    black_box bb1_8  (.pik(P0[8]),  .gik(G0[8]),  .pkj(P0[7]), .gkj(G0[7]), .pij(P1[8]),  .gij(G1[8]));
    assign P1[9] = P0[9]; assign G1[9] = G0[9];
    black_box bb1_10 (.pik(P0[10]), .gik(G0[10]), .pkj(P0[9]), .gkj(G0[9]), .pij(P1[10]), .gij(G1[10]));
    assign P1[11] = P0[11]; assign G1[11] = G0[11];
    black_box bb1_12 (.pik(P0[12]), .gik(G0[12]), .pkj(P0[11]),.gkj(G0[11]),.pij(P1[12]), .gij(G1[12]));
    assign P1[13] = P0[13]; assign G1[13] = G0[13];
    black_box bb1_14 (.pik(P0[14]), .gik(G0[14]), .pkj(P0[13]),.gkj(G0[13]),.pij(P1[14]), .gij(G1[14]));
    assign P1[15] = P0[15]; assign G1[15] = G0[15];


    assign P2[0] = P1[0]; assign G2[0] = G1[0];
    black_box bb2_1  (.pik(P1[1]),  .gik(G1[1]),  .pkj(P1[0]), .gkj(G1[0]), .pij(P2[1]),  .gij(G2[1]));
    black_box bb2_2  (.pik(P1[2]),  .gik(G1[2]),  .pkj(P1[0]), .gkj(G1[0]), .pij(P2[2]),  .gij(G2[2]));
    assign P2[3] = P1[3]; assign G2[3] = G1[3];
    assign P2[4] = P1[4]; assign G2[4] = G1[4];
    black_box bb2_5  (.pik(P1[5]),  .gik(G1[5]),  .pkj(P1[4]), .gkj(G1[4]), .pij(P2[5]),  .gij(G2[5]));
    black_box bb2_6  (.pik(P1[6]),  .gik(G1[6]),  .pkj(P1[4]), .gkj(G1[4]), .pij(P2[6]),  .gij(G2[6]));
    assign P2[7] = P1[7]; assign G2[7] = G1[7];
    assign P2[8] = P1[8]; assign G2[8] = G1[8];
    black_box bb2_9  (.pik(P1[9]),  .gik(G1[9]),  .pkj(P1[8]), .gkj(G1[8]), .pij(P2[9]),  .gij(G2[9]));
    black_box bb2_10 (.pik(P1[10]), .gik(G1[10]), .pkj(P1[8]), .gkj(G1[8]), .pij(P2[10]), .gij(G2[10]));
    assign P2[11] = P1[11]; assign G2[11] = G1[11];
    assign P2[12] = P1[12]; assign G2[12] = G1[12];
    black_box bb2_13 (.pik(P1[13]), .gik(G1[13]), .pkj(P1[12]),.gkj(G1[12]),.pij(P2[13]), .gij(G2[13]));
    black_box bb2_14 (.pik(P1[14]), .gik(G1[14]), .pkj(P1[12]),.gkj(G1[12]),.pij(P2[14]), .gij(G2[14]));
    assign P2[15] = P1[15]; assign G2[15] = G1[15];

    
    assign P3[0] = P2[0]; assign G3[0] = G2[0];
    assign P3[1] = P2[1]; assign G3[1] = G2[1];
    assign P3[2] = P2[2]; assign G3[2] = G2[2];
    black_box bb3_3  (.pik(P2[3]),  .gik(G2[3]),  .pkj(P2[2]), .gkj(G2[2]),  .pij(P3[3]),  .gij(G3[3]));
    black_box bb3_4  (.pik(P2[4]),  .gik(G2[4]),  .pkj(P2[2]), .gkj(G2[2]),  .pij(P3[4]),  .gij(G3[4]));
    black_box bb3_5  (.pik(P2[5]),  .gik(G2[5]),  .pkj(P2[2]), .gkj(G2[2]),  .pij(P3[5]),  .gij(G3[5]));
    black_box bb3_6  (.pik(P2[6]),  .gik(G2[6]),  .pkj(P2[2]), .gkj(G2[2]),  .pij(P3[6]),  .gij(G3[6]));
    assign P3[7] = P2[7]; assign G3[7] = G2[7];
    assign P3[8] = P2[8]; assign G3[8] = G2[8];
    assign P3[9] = P2[9]; assign G3[9] = G2[9];
    assign P3[10] = P2[10]; assign G3[10] = G2[10];
    black_box bb3_11 (.pik(P2[11]), .gik(G2[11]), .pkj(P2[10]),.gkj(G2[10]), .pij(P3[11]), .gij(G3[11]));
    black_box bb3_12 (.pik(P2[12]), .gik(G2[12]), .pkj(P2[10]),.gkj(G2[10]), .pij(P3[12]), .gij(G3[12]));
    black_box bb3_13 (.pik(P2[13]), .gik(G2[13]), .pkj(P2[10]),.gkj(G2[10]), .pij(P3[13]), .gij(G3[13]));
    black_box bb3_14 (.pik(P2[14]), .gik(G2[14]), .pkj(P2[10]),.gkj(G2[10]), .pij(P3[14]), .gij(G3[14]));
    assign P3[15] = P2[15]; assign G3[15] = G2[15];

   
    assign P4[0] = P3[0]; assign G4[0] = G3[0];
    assign P4[1] = P3[1]; assign G4[1] = G3[1];
    assign P4[2] = P3[2]; assign G4[2] = G3[2];
    assign P4[3] = P3[3]; assign G4[3] = G3[3];
    assign P4[4] = P3[4]; assign G4[4] = G3[4];
    assign P4[5] = P3[5]; assign G4[5] = G3[5];
    assign P4[6] = P3[6]; assign G4[6] = G3[6];
    black_box bb4_7  (.pik(P3[7]),  .gik(G3[7]),  .pkj(P3[6]), .gkj(G3[6]),  .pij(P4[7]),  .gij(G4[7]));
    black_box bb4_8  (.pik(P3[8]),  .gik(G3[8]),  .pkj(P3[6]), .gkj(G3[6]),  .pij(P4[8]),  .gij(G4[8]));
    black_box bb4_9  (.pik(P3[9]),  .gik(G3[9]),  .pkj(P3[6]), .gkj(G3[6]),  .pij(P4[9]),  .gij(G4[9]));
    black_box bb4_10 (.pik(P3[10]), .gik(G3[10]), .pkj(P3[6]), .gkj(G3[6]),  .pij(P4[10]), .gij(G4[10]));
    black_box bb4_11 (.pik(P3[11]), .gik(G3[11]), .pkj(P3[6]), .gkj(G3[6]),  .pij(P4[11]), .gij(G4[11]));
    black_box bb4_12 (.pik(P3[12]), .gik(G3[12]), .pkj(P3[6]), .gkj(G3[6]),  .pij(P4[12]), .gij(G4[12]));
    black_box bb4_13 (.pik(P3[13]), .gik(G3[13]), .pkj(P3[6]), .gkj(G3[6]),  .pij(P4[13]), .gij(G4[13]));
    black_box bb4_14 (.pik(P3[14]), .gik(G3[14]), .pkj(P3[6]), .gkj(G3[6]),  .pij(P4[14]), .gij(G4[14]));
    assign P4[15] = P3[15]; assign G4[15] = G3[15];


    wire [15:0] a_xor_b;
    
    xor (a_xor_b[0], A[0], B[0]);
    xor (a_xor_b[1], A[1], B[1]);
    xor (a_xor_b[2], A[2], B[2]);
    xor (a_xor_b[3], A[3], B[3]);
    xor (a_xor_b[4], A[4], B[4]);
    xor (a_xor_b[5], A[5], B[5]);
    xor (a_xor_b[6], A[6], B[6]);
    xor (a_xor_b[7], A[7], B[7]);
    xor (a_xor_b[8], A[8], B[8]);
    xor (a_xor_b[9], A[9], B[9]);
    xor (a_xor_b[10], A[10], B[10]);
    xor (a_xor_b[11], A[11], B[11]);
    xor (a_xor_b[12], A[12], B[12]);
    xor (a_xor_b[13], A[13], B[13]);
    xor (a_xor_b[14], A[14], B[14]);
    xor (a_xor_b[15], A[15], B[15]);

    xor (Sum[0],  a_xor_b[0],  Cin);
    xor (Sum[1],  a_xor_b[1],  G4[0]);
    xor (Sum[2],  a_xor_b[2],  G4[1]);
    xor (Sum[3],  a_xor_b[3],  G4[2]);
    xor (Sum[4],  a_xor_b[4],  G4[3]);
    xor (Sum[5],  a_xor_b[5],  G4[4]);
    xor (Sum[6],  a_xor_b[6],  G4[5]);
    xor (Sum[7],  a_xor_b[7],  G4[6]);
    xor (Sum[8],  a_xor_b[8],  G4[7]);
    xor (Sum[9],  a_xor_b[9],  G4[8]);
    xor (Sum[10], a_xor_b[10], G4[9]);
    xor (Sum[11], a_xor_b[11], G4[10]);
    xor (Sum[12], a_xor_b[12], G4[11]);
    xor (Sum[13], a_xor_b[13], G4[12]);
    xor (Sum[14], a_xor_b[14], G4[13]);
    xor (Sum[15], a_xor_b[15], G4[14]);


    wire p15_and_c14;
    and (p15_and_c14, P4[15], G4[14]);
    or  (Cout, G4[15], p15_and_c14);

endmodule

    