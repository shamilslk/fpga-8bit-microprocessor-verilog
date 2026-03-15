module program_counter(
    input clk,
    input reset,
    input pc_load,
    input [7:0] pc_next,
    output reg [7:0] pc
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        pc <= 8'd0;
    else if(pc_load)
        pc <= pc_next;
    else
        pc <= pc + 1;
end

endmodule
