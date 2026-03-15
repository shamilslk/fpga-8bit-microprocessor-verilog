module cpu_top(
    input clk,
    input reset
);

// Internal wires

wire [7:0] pc;
wire [15:0] instruction;

wire [7:0] reg_a;
wire [7:0] reg_b;
wire [7:0] alu_result;

wire zero;
wire carry;
wire sign;

wire [3:0] opcode;
wire [2:0] rd;
wire [2:0] rs1;
wire [2:0] rs2;


// Instruction decode

assign opcode = instruction[15:12];
assign rd  = instruction[11:9];
assign rs1 = instruction[8:6];
assign rs2 = instruction[5:3];


// Program counter

program_counter PC(
    .clk(clk),
    .reset(reset),
    .pc_load(1'b0),
    .pc_next(8'd0),
    .pc(pc)
);


// Instruction memory

instruction_memory IM(
    .addr(pc),
    .instruction(instruction)
);


// Register file

register_file RF(
    .clk(clk),
    .reset(reset),
    .reg_write(1'b1),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(alu_result),
    .read_data1(reg_a),
    .read_data2(reg_b)
);


// ALU

alu ALU(
    .opcode(opcode),
    .a(reg_a),
    .b(reg_b),
    .carry_in(1'b0),
    .result(alu_result),
    .zero(zero),
    .carry(carry),
    .sign(sign)
);


// Flag register

flag_register FLAGS(
    .clk(clk),
    .reset(reset),
    .zero_in(zero),
    .carry_in(carry),
    .sign_in(sign),
    .zero(),
    .carry(),
    .sign()
);

endmodule
