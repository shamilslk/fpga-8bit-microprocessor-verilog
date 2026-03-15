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

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        for(i=0;i<8;i=i+1)
            registers[i] <= 0;
    end
    else if(reg_write)
    begin
        registers[rd] <= write_data;
    end
end

assign read_data1 = registers[rs1];
assign read_data2 = registers[rs2];

endmodule
