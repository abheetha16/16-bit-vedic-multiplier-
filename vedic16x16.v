// 16x16 Vedic Multiplier
module vedic16x16(input [15:0] a, b, output [31:0] p);

    wire [15:0] p0, p1, p2, p3;
    wire [23:0] temp1;
    wire [31:0] temp2;

    // Split inputs
    wire [7:0] a_low  = a[7:0];
    wire [7:0] a_high = a[15:8];
    wire [7:0] b_low  = b[7:0];
    wire [7:0] b_high = b[15:8];

    // 8x8 multipliers
    vedic8x8 v0(a_low,  b_low,  p0);
    vedic8x8 v1(a_high, b_low,  p1);
    vedic8x8 v2(a_low,  b_high, p2);
    vedic8x8 v3(a_high, b_high, p3);

    // Combine
    assign temp1 = p1 + p2;
    assign temp2 = {p3, 16'b0000000000000000};

    assign p = p0 + (temp1 << 8) + temp2;

endmodule
