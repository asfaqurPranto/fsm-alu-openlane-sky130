`include "alu_and.v"
`timescale 1ns/1ps

module alu_and_tb;
    reg [6:0] a;
    reg [6:0] b;
    wire [6:0] result;

    ALU_AND uut(
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin

        $dumpfile("alu_and_tb.vcd");
        $dumpvars(0, alu_and_tb);

        //test case 1
        a=7'b0000000;
        b=7'b1111111;
        #10;

        //Test case 2;
        a=7'b1111111;
        #10;
        b=7'b1010101;//=85
        #10;
        //Test case 3
        a=7'b1010111;//87
        $finish;


    end

    initial begin
        $monitor("a=%d b=%d result=%d ",a, b, result);
    end
endmodule