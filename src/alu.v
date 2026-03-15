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

always @(*) begin

    result = 8'd0;
    carry  = 0;

    case(opcode)

        4'h1: {carry,result} = a + b;
        4'h2: {carry,result} = a - b;
        4'h3: result = a + 1;
        4'h4: result = a - 1;
        4'h5: result = a - b;
        4'h6: {carry,result} = a + b + carry_in;

        4'h7: result = a & b;
        4'h8: result = a | b;
        4'h9: result = a ^ b;
        4'hA: result = ~(a | b);

        4'hB: result = a << 1;
        4'hC: result = a >> 1;

        default: result = 8'd0;

    endcase

    zero = (result == 0);
    sign = result[7];

end

endmodule
