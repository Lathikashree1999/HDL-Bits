module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter s0 = 3'b000,
    		  s1 = 3'b001,
    		  s2 = 3'b010,
    		  s3 = 3'b011,
    		  s4 = 3'b100;
    
    reg [2:0] state, next;
    
    always @(posedge clk) begin
        if(reset)
            state <= s0;
        else
            state <= next;
    end
    
    always @(*) begin
        case(state)
            s0 : begin
                if(x==1)
                    next = s1;
                else 
                    next = s0;
            end
            
            s1 : begin
                if(x==1)
                    next = s4;
                else
                    next = s1;
            end
            
            s2 : begin
                if(x==1)
                    next = s1;
                else
                    next = s2;
            end
            
            s3 : begin
                if(x==1)
                    next = s2;
                else 
                    next = s1;
            end
            
            s4 : begin
                if(x==1)
                    next = s4;
                else
                    next = s3;
            end
        endcase
    end
    
    always @(*) begin
        case(state)
            s0 : z = 0;
            s1 : z = 0;
            s2 : z = 0;
            s3 : z = 1;
            s4 : z = 1;
        endcase
    end

endmodule
