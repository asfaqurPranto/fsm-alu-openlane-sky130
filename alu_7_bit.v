`include "add_7_bit.v"
`include "alu_and.v"
module ALU (
    input wire [6:0] a,
    input wire [6:0] b,
    input wire op,

    output reg [6:0] res,
    output wire GZ, //grater than zero flag
    output wire CF // Carry flag
);

wire [6:0] and_res,add_res;
wire carry;

ALU_AND uut0(
    .a(a),
    .b(b),
    .result(and_res)
);

ADD_7_bit uut1(
    .a(a),
    .b(b),
    .sum(add_res),
    .carry(carry)
);


always @(*) 
begin
    case (op)
        1'b0:
        //Operation 0 for AND
        begin
            res=and_res;

        end

        default: 
        begin
            res=add_res;

        end
    endcase
end

assign CF =(op==1'b1) ? carry : 1'b0;
assign GZ =(res>7'b0000000) ? 1'b1 :1'b0;


    
endmodule