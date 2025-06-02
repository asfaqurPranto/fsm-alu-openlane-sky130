module ADD_7_bit (
    input wire [6:0] a,
    input wire [6:0] b,
    output reg [6:0] sum,
    output reg carry
);

always @(*) 
begin
    {carry, sum} = a + b; 

end

    
endmodule