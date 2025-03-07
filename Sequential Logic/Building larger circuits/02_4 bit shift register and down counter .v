module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    
    reg [3:0] shift_reg;
    
    always @(posedge clk) begin
        if(shift_ena)
            shift_reg <= {shift_reg[2:0],data};
        else if(count_ena)
            shift_reg <= shift_reg - 1;
    end
    
    assign q = shift_reg;

endmodule
