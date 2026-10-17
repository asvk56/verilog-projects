// HDLBits: Conditional
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] min_ab, min_cd;
    assign min_ab = (a<b) ? a : b;
    assign min_cd = (c<d) ? c : d;
    assign min    = (min_ab<min_cd) ? min_ab : min_cd; 

endmodule

// HDLBits: Reduction
module top_module (
    input [7:0] in,
    output parity); 
    
    assign parity = ^ in [7:0];

endmodule

// HDLBits: Gates100
module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    
    assign out_and = & in [99:0];
    assign out_or  = | in [99:0];
    assign out_xor = ^ in [99:0];

endmodule

// HDLBits: Vector100r
module top_module( 
    input [99:0] in,
    output [99:0] out
);

    integer i;
    always @ (*)
        begin
            for (i=0; i<=99; i=i+1) begin
                out [i] = in [99-i];end
        end
endmodule

// HDLBits: Popcount255
module top_module( 
    input [254:0] in,
    output [7:0] out );

    integer i;
    always @(*) begin
        out = 8'd0;
        for(i=0; i<255; i=i+1) begin
            out = out + in[i]; end
    end
    
endmodule

