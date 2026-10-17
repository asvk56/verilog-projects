// HDLBits: Simple wire
module top_module( input in, output out );
   assign out = in;

endmodule

// HDLBits: Four wires
module top_module( 
    input a,b,c,
    output w,x,y,z );

endmodule

// HDLBits: Inverter
module top_module( input in, output out );
    assign out = !in;

endmodule

// HDLBits: AND gate
module top_module( 
    input a, 
    input b, 
    output out );
    
    assign out = a & b;

endmodule

// HDLBits: NOR gate
module top_module( 
    input a, 
    input b, 
    output out );
    
    assign out = ~(a | b);

endmodule

// HDLBits: XNOR gate
module top_module( 
    input a, 
    input b, 
    output out );
    
    assign out = ~(a^b);

endmodule

// HDLBits: Declaring wires
`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire a_b;
    wire c_d;
    assign out = (a&b | c&d);
    assign out_n = !out;

endmodule

// HDLBits: 7458 chip
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    assign p2y = (p2a & p2b)|(p2c & p2d);
    assign p1y = (p1a & p1c & p1b)|(p1f & p1e & p1d);
    
endmodule

