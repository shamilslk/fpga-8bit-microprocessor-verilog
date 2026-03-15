module instruction_memory(
    input [7:0] addr,
    output [15:0] instruction
);

reg [15:0] rom [0:255];

initial begin

    rom[0] = 16'h1298; // ADD
    rom[1] = 16'h2458; // SUB
    rom[2] = 16'h3200; // INC
    rom[3] = 16'h7650; // DEC
    rom[4] = 16'h8850; // AND
    rom[5] = 16'h9A98; // OR
    rom[6] = 16'hBD80; // XOR
    rom[7] = 16'hCD80; // NOR
    rom[8] = 16'hC540; // SHL

end

assign instruction = rom[addr];

endmodule
