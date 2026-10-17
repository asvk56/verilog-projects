// HDLBits: Module
module top_module ( input a, input b, output out );
    mod_a instance1 ( a, b, out );

endmodule

// HDLBits: Module pos
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a instance1 ( out1, out2, a, b, c, d );

endmodule

// HDLBits: Module name
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a instance1 (.out1(out1), .out2(out2), .in1(a), .in2(b), .in3(c), .in4(d) );

endmodule

// HDLBits: Module shift
module top_module ( input clk, input d, output q );
    wire w1, w2;
   
    my_dff instance1 (.clk(clk), .d(d), .q(w1) );
    my_dff instance2 ( .clk(clk), .d(w1), .q(w2) );
    my_dff instance3 ( .clk(clk), .d(w2), .q(q) );

endmodule

// HDLBits: Module shift8
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);
    wire [7:0] w1, w2, w3;
    
    my_dff8 instance1 (.clk(clk), .d(d), .q(w1));
    my_dff8 instance2 (.clk(clk), .d(w1), .q(w2));
    my_dff8 instance3 (.clk(clk), .d(w2), .q(w3));
    
    always @(*)
    begin
        case(sel)
            2'b00:   q = d;
            2'b01:   q = w1;
            2'b10:   q = w2;
            2'b11:   q = w3;
            default: q = 8'b0;
        endcase
    end        
endmodule

// HDLBits: Module add
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c_out;
    
    add16 lower_adder(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(c_out));
    add16 upper_adder(.a(a[31:16]), .b(b[31:16]), .cin(c_out), .sum(sum[31:16]), .cout());

endmodule

// HDLBits: Module fadd
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire c_out;

    // Lower 16 bits
    add16 lower_adder (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(c_out)
    );

    // Upper 16 bits
    add16 upper_adder (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(c_out),
        .sum(sum[31:16]),
        .cout()
    );
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule

// HDLBits: Module cseladd
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire lower_cout;
    wire [15:0] sum_upper0;
    wire [15:0] sum_upper1;
    
    add16 lower_adder(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(lower_cout)
    );
    
    add16 upper_adder0(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_upper0),
        .cout()
    );
       
    add16 upper_adder1(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_upper1),
        .cout()
    );
    
    assign sum[31:16] =  (lower_cout) ? sum_upper1 : sum_upper0;
     
endmodule

// HDLBits: Module addsub
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire lower_cout;
    wire [31:0] b_xor;
    
    assign b_xor = b ^ {32{sub}};
    
    add16 lower_adder(
        .a(a[15:0]),
        .b(b_xor[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(lower_cout)
    );
    add16 upper_adder(
        .a(a[31:16]),
        .b(b_xor[31:16]),
        .cin(lower_cout),
        .sum(sum[31:16]),
        .cout()
    );
    
endmodule
