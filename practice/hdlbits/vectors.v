// HDLBits: Vector0
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
 
    assign outv = vec[2:0];
    assign o2 = vec[2];
    assign o1 = vec[1];
    assign o0 = vec[0];
endmodule

// HDLBits: Vector1
`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    
    assign out_lo = in[7:0];
    assign out_hi = in[15:8];

endmodule

// HDLBits: Vector2
module top_module( 
    input [31:0] in,
    output [31:0] out );//

    assign out[7:0] = in[31:24];
    assign out[15:8] = in[23:16];
    assign out[23:16] = in[15:8];
    assign out[31:24] = in[7:0];
    
endmodule

// HDLBits: Vectorgates
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_bitwise = a|b;
    assign out_or_logical = a||b;
    assign out_not = {~b, ~a};

endmodule

// HDLBits: Gates4
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and = in[0]&in[1]&in[2]&in[3];
    assign out_or = in[0]|in[1]|in[2]|in[3];
    assign out_xor = in[0]^in[1]^in[2]^in[3];

endmodule

// HDLBits: Vector3
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );
    
    assign {w, x, y, z} = {a, b, c, d, e, f, 2'b11};

endmodule

// HDLBits: Vectorr
module top_module( 
    input [7:0] in,
    output [7:0] out
);

    integer i;
    always @(*)
        begin
            for(i=0;i<8;i=i+1)begin
                out[i]=in[7-i];
            end
        end
    
endmodule

// HDLBits: Vector4
module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out = {{24{in[7]}},in};

endmodule

// HDLBits: Vector5
module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    assign out = ~{{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}}^{5{a, b, c, d, e}};

endmodule
