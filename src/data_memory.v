module data_memory(

input clk,
input mem_write,
input mem_read,

input [7:0] address,
input [7:0] write_data,

output reg [7:0] read_data

);

reg [7:0] ram [0:255];

always @(posedge clk)
begin

    if(mem_write)
        ram[address] <= write_data;

    if(mem_read)
        read_data <= ram[address];

end

endmodule
