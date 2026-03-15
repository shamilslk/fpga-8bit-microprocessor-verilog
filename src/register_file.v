module register_file(
    input clk,
    input reset,
    input reg_write,
    input [2:0] rs1,
    input [2:0] rs2,
    input [2:0] rd,
    input [7:0] write_data,
    output [7:0] read_data1,
    output [7:0] read_data2
);

reg [7:0] registers [0:7];
integer i;

always @(posedge clk or posedge reset) begin
    if(reset) begin
        registers[0] <= 8'd5;
        registers[1] <= 8'd3;
        registers[2] <= 8'd2;
        registers[3] <= 8'd1;
        registers[4] <= 8'd0;
        registers[5] <= 8'd0;
        registers[6] <= 8'd0;
        registers[7] <= 8'd0;
    end
    else if(reg_write)
        registers[rd] <= write_data;
end

assign read_data1 = registers[rs1];
assign read_data2 = registers[rs2];

endmodule
