module black_box (
    input  pik, gik, //current position
    input  pkj, gkj, //previous position
    output pij, gij //output position
    );

    wire p_and_g;

    and(pij, pik, pkj);
    and(p_and_g, pik, gkj);
    or(gij, p_and_g, gik);
endmodule