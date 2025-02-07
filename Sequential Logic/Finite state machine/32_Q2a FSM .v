module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

    parameter a = 2'd0, b = 2'd1, c = 2'd2, d=2'd3;
    reg [1:0] state, next;
    
    always @(posedge clk) begin
        if(!resetn)
            state <= a;
        else
            state <= next;
    end
    
    always @(*) begin
        case(state)
            a : begin
                if(r[1])
                    next = b;
                else if(~r[1] & r[2])
                    next = c;
                else if(~r[1] & ~r[2] & r[3])
                    next = d;
                else 
                    next = a;
            end
            
            b : begin
                if(r[1])
                    next = b;
                else 
                    next = a;
            end
            
            c : begin
                if(r[2])
                    next = c;
                else 
                    next = a;
            end
            
            d : begin
                if(r[3])
                    next = d;
                else
                    next = a;
            end
        endcase
    end
    
    assign g[1] = (state == b);
    assign g[2] = (state == c);
    assign g[3] = (state == d);
    
endmodule
