`include "top.v"
module Top_tb;
    reg clk;
    reg rst;
    
    wire [6:0] res;
    wire CF;
    wire GZ;

Top uut0(
    .clk(clk),
    .rst(rst),
    .res(res),
    .CF(CF),
    .GZ(GZ)
);

always begin
  clk=~clk;
  #10;
end

initial begin
    $dumpfile("top_tb_vcd");
    $dumpvars(0,Top_tb);

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
    $monitor("clk=%b rst=%b  res=%d cf=%b gz=%b",clk,rst,res,CF,GZ);

end
endmodule