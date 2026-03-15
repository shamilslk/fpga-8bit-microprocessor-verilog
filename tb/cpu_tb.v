`timescale 1ns/1ps

module cpu_tb;

reg clk;
reg reset;

cpu_top uut(
    .clk(clk),
    .reset(reset)
);

// clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #20;
    reset = 0;

    #1000;
    $finish;
end

endmodule
