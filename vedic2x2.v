// 2x2 Vedic Multiplier
module vedic2x2(input [1:0] a, b, output [3:0] p);

    wire p0, p1, p2, p3;
    wire c1, c2;

    assign p0 = a[0] & b[0];

    assign p1 = (a[1] & b[0]) ^ (a[0] & b[1]);
    assign c1 = (a[1] & b[0]) & (a[0] & b[1]);

    assign p2 = (a[1] & b[1]) ^ c1;
    assign c2 = (a[1] & b[1]) & c1;

    assign p3 = c2;

    assign p = {p3, p2, p1, p0};

endmodule
