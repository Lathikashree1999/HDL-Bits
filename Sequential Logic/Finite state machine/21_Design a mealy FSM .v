module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter s0 = 2'b00,
    		  s1 = 2'b01,
    		  s2 = 2'b10;
    
    reg [1:0] state, next;
    
    always @(posedge clk or negedge aresetn) begin
        if(!aresetn)
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
                if(x==0)
                    next = s2;
                else
                    next = s1;
            end
            
            s2 : begin
                if(x==1)
                    next = s1;
                else
                    next = s0;
            end
        endcase
    end
    
    assign z = ((state==s2) && (x==1)) ? 1 : 0;

endmodule
