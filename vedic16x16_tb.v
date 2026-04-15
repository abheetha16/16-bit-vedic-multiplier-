`timescale 1ns/1ps

module vedic16x16_tb;

    reg [15:0] a, b;
    wire [31:0] p;

    // Instantiate DUT
    vedic16x16 uut (a, b, p);

    initial begin
        // Waveform dump (for GTKWave)
        $dumpfile("vedic16.vcd");
        $dumpvars(0, vedic16x16_tb);

        $monitor("Time=%0t | A=%d | B=%d | Product=%d", $time, a, b, p);

        // Test cases
        a = 16'd12;   b = 16'd5;   #10;
        a = 16'd255;  b = 16'd255; #10;
        a = 16'd1234; b = 16'd4321; #10;
        a = 16'd1000; b = 16'd250;  #10;
        a = 16'hFFFF; b = 16'd2;    #10;

        $finish;
    end

endmodule
