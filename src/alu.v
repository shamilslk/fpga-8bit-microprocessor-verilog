module alu(

input [3:0] opcode,
input [7:0] a,
input [7:0] b,
input carry_in,

output reg [7:0] result,
output reg zero,
output reg carry,
output reg sign
);

always @(*)
begin

case(opcode)

4'h1: {carry,result} = a + b;        // ADD
4'h2: {carry,result} = a - b;        // SUB
4'h3: result = a + 1;                // INC
4'h4: result = a - 1;                // DEC
4'h5: result = a & b;                // AND
4'h6: result = a | b;                // OR
4'h7: result = a ^ b;                // XOR
4'h8: result = ~(a | b);             // NOR
4'h9: result = a << 1;               // SHL
4'hA: result = a >> 1;               // SHR
default: result = 0;

endcase

zero = (result == 0);
sign = result[7];

end

endmodule
