module ALU_AND(
    input wire [6:0] a,
    input wire [6:0] b,
    output reg [6:0] result
);

   
    always @(*) 
    begin
        result = a & b; 
        
    end

endmodule