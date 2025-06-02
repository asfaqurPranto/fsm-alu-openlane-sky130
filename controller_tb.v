`include "controller.v"

module controller_tb;
    reg clk;
    reg rst;

    wire [6:0] a;
    wire [6:0] b;
    wire op;
    wire GZ;
    wire CF;
    wire [6:0] res;

Controller uut(
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .res(res),
    .op(op),
    .GZ(GZ),
    .CF(CF)
);

always begin
  clk=~clk;
  #10;
end

initial begin
    $dumpfile("controller_tb.vcd");
    $dumpvars(0,controller_tb);

    clk=0;
    rst=0;
    #10;
    rst=1;
    #10;

    rst=0;
    #100;
    $finish;
end

initial begin
    $monitor("clk=%b rst=%b a=%d b=%d op=%b res=%d cf=%b gz=%b",clk,rst,a,b,op,res,CF,GZ);

end

endmodule