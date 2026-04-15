// 4x4 Vedic Multiplier
module vedic4x4(input [3:0] a, b, output [7:0] p);

    wire [3:0] p0, p1, p2, p3;
    wire [5:0] temp1;
    wire [7:0] temp2;

    // Split inputs
    wire [1:0] a_low  = a[1:0];
    wire [1:0] a_high = a[3:2];
    wire [1:0] b_low  = b[1:0];
    wire [1:0] b_high = b[3:2];

    // 2x2 multipliers
    vedic2x2 v0(a_low,  b_low,  p0);
    vedic2x2 v1(a_high, b_low,  p1);
    vedic2x2 v2(a_low,  b_high, p2);
    vedic2x2 v3(a_high, b_high, p3);

    // Combine
    assign temp1 = p1 + p2;
    assign temp2 = {p3, 4'b0000};

    assign p = p0 + (temp1 << 2) + temp2;

endmodule
