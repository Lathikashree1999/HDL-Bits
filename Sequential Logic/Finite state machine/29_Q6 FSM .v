module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
    parameter a = 3'b000,
    		  b = 3'b001,
    		  c = 3'b010,
    		  d = 3'b011,
    		  e = 3'b100,
    		  f = 3'b101;
    
    reg [2:0] state, next;
    
    always @(posedge clk) begin
        if(reset)
            state <= a;
        else
            state <= next;
    end
    
    always @(*) begin
        case({state, w})
            {a,1'b0} : next = b;
            {a,1'b1} : next = a;
            {b,1'b0} : next = c;
            {b,1'b1} : next = d;
            {c,1'b0} : next = e;
            {c,1'b1} : next = d;
            {d,1'b0} : next = f;
            {d,1'b1} : next = a;
            {e,1'b0} : next = e;
            {e,1'b1} : next = d;
            {f,1'b0} : next = c;
            {f,1'b1} : next = d;
        endcase
    end
    
    assign z = (state == e || state == f);

endmodule
