`include "alu_7_bit.v"


module alu_tb;
    reg [6:0] a;
    reg [6:0] b;
    reg op;
    wire [6:0] res;
    wire CF;
    wire GZ;

    integer i;

    ALU uut (
        .a(a),
        .b(b),
        .op(op),

        .res(res),
        .CF(CF),
        .GZ(GZ)
    );

    initial begin
        
        a = 7'b0000000;
        b = 7'b0000000;
        op=1'b0;

        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        
        $monitor("T=%0t a=%d b=%d op=%b res=%d CF=%b ,GZ=%b", $time, a, b,op, res, CF,GZ);

        for (i = 0; i < 15; i = i + 1) begin
            #10;
            op = $random % 2;
            a = $random % 128;
            b = $random % 128;
        end

        #10;
        $finish;
    end
endmodule
