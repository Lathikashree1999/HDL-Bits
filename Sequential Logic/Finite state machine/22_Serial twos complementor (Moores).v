module top_module (
    input clk,
    input areset,
    input x,
    output z
);
    
    parameter s0 = 2'b00,
    		  s1 = 2'b01,
    		  s2 = 2'b10;
    
    reg [1:0] state, next;
    
    always @(posedge clk or posedge areset) begin
        if(areset)
            state <= s0;
        else
            state <= next;
    end
    
    always @(*) begin
        case (state)
            s0 : begin
                if(x == 1)
                    next = s1;
                else 
                    next = s0;
            end
            
            s1 : begin
                if(x == 1)
                    next = s2;
                else 
                    next = s1;
            end
            
            s2 : begin
                if(x == 1)
                    next = s2;
                else 
                    next = s1;
            end
            
            default next = s0;
        endcase
    end
    
    assign z = (state == s1);

endmodule
