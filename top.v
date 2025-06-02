`include "controller.v"

module Top (
    input wire clk,
    input wire rst,
    output wire [6:0] res,
    output wire CF,
    output wire GZ 
);

Controller uut0(
    .clk(clk),
    .rst(rst),
    .res(res),
    .CF(CF),
    .GZ(GZ)
);

    
endmodule