module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter s0 = 0, s1 = 1;
    
    reg state, next;
    reg [1:0] count, count1;
    
    always @(posedge clk) begin
        if(reset) begin
            state <= s0;
            count = 0;
            count1 = 0;
        end
        else begin
            state <= next;
            if(state == s1) begin
                if(count1==3) begin
                    count = 0;
                    count1 = 0;
                end
                if(w==1)
                    count = count+1;
                count1 = count1+1;
            end
        end
    end
    
    always @(*) begin
        case(state)
            s0 : next = (s) ? s1 : s0;
            s1 : next = s1;
        endcase
    end
    
    assign z = ((count == 2) & (count1 == 3));

endmodule

