module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter s0 = 2'b00, s1 = 2'b01;
    
    reg [1:0] state, next;
    
    always @(posedge clk or posedge areset) begin
        if(areset)
            state <= s0;
        else
            state <= next;
    end
    
    always @(*) begin
        case(state)
            s0 : begin
                if(x==1) begin
                    next = s1;
                    z = 1;
                end
                else begin
                    next = s0;
                    z = 0;
                end
            end
            
            s1 : begin
                if(x==1) begin
                    next = s1;
                    z = 0;
                end
                else begin
                    next = s1;
                    z = 1;
                end
            end
        endcase
    end
    
endmodule
