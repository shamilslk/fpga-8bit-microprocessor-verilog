module flag_register(

input clk,
input reset,

input zero_in,
input carry_in,
input sign_in,

output reg zero,
output reg carry,
output reg sign

);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        zero <= 0;
        carry <= 0;
        sign <= 0;
    end
    else
    begin
        zero <= zero_in;
        carry <= carry_in;
        sign <= sign_in;
    end
end

endmodule
