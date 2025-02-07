module top_module (
    input clk,
    input reset,     // synchronous active high reset
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
            {a, 1'b0}:  next = a;
            {a, 1'b1}:  next = b;
            {b, 1'b0}:  next = d;
            {b, 1'b1}:  next = c;
            {c, 1'b0}:  next = d;
            {c, 1'b1}:  next = e;
            {d, 1'b0}:  next = a;
            {d, 1'b1}:  next = f;
            {e, 1'b0}:  next = d;
            {e, 1'b1}:  next = e;
            {f, 1'b0}:  next = d;
            {f, 1'b1}:  next = c;
            default : next = a;
        endcase
    end
    
    assign z = (state == e || state == f);

endmodule
