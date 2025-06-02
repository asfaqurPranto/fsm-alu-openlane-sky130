`include "alu_7_bit.v"

module Controller (
    input clk,rst,
    output reg [6:0] a,
    output reg [6:0] b,
    output reg op,

    output wire [6:0] res,
    output wire GZ, //grater than zero flag
    output wire CF
);

ALU uut0(

    .a(a),
    .b(b),
    .op(op),
    .res(res),
    .GZ(GZ),
    .CF(CF)
);


localparam start =3'b000,
           one=3'b001,
           two=3'b010,
           three=3'b011,
           finish=3'b100;

reg [2:0] current_state, next_state;



always @(posedge clk) 
begin
    if(rst)
    begin
        current_state<=start;
    end
    else
    begin
        current_state<=next_state;
    end  
end
    
always @(*) 
begin
    case (current_state)
        start:
        begin
            a=7'b0000000;
            b=7'b0000000;
            op=0; 
            next_state=one;
        end
        one:
        begin
            a=7'b0000000;
            b=7'b1111111;
            op=0;
            next_state=two;
        end
        two:
        begin
            a=7'b1101101;
            b=7'b1111111;
            op=1;
            next_state=three;
        end

        three:
        begin
            a=7'b1101101;
            b=7'b0100110;
            op=0;
            next_state=finish;
        end

        finish:
        begin
            a=7'b0000000;
            b=7'b0000000;
            op=0; 
            next_state=finish;
        end 
        default:
        begin
            a=7'b0000000;
            b=7'b0000000;
            op=0; 
            next_state=start;
        end
    endcase
    
end
endmodule