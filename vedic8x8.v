// 8x8 Vedic Multiplier
module vedic8x8(input [7:0] a, b, output [15:0] p);

    wire [7:0] p0, p1, p2, p3;
    wire [11:0] temp1;
    wire [15:0] temp2;

    // Split inputs
    wire [3:0] a_low  = a[3:0];
    wire [3:0] a_high = a[7:4];
    wire [3:0] b_low  = b[3:0];
    wire [3:0] b_high = b[7:4];

    // 4x4 multipliers
    vedic4x4 v0(a_low,  b_low,  p0);
    vedic4x4 v1(a_high, b_low,  p1);
    vedic4x4 v2(a_low,  b_high, p2);
    vedic4x4 v3(a_high, b_high, p3);

    // Combine
    assign temp1 = p1 + p2;
    assign temp2 = {p3, 8'b00000000};

    assign p = p0 + (temp1 << 4) + temp2;

endmodule
