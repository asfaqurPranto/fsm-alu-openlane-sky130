`include "add_7_bit.v"
//`timescale 1ns/1ps

module add_7_bit_tb;
    reg [6:0] a;
    reg [6:0] b;
    wire [6:0] sum;
    wire carry;

    integer i;

    ADD_7_bit uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        
        a = 0;
        b = 0;

        $dumpfile("alu_add_7_tb.vcd");
        $dumpvars(0, add_7_bit_tb);

        
        $monitor("T=%0t a=%d b=%d sum=%d carry=%b", $time, a, b, sum, carry);

        for (i = 0; i < 15; i = i + 1) begin
            #10;
            a = $random % 128;
            b = $random % 128;
        end

        #10;
        $finish;
    end
endmodule
