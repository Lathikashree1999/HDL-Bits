module top_module;
    reg clk;
    dut ck(clk);
    initial clk = 0;
    always #5 clk = ~clk;
endmodule
