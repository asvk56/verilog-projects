
// HDLBits: Alwaysblock1
// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    assign out_assign = a & b;
    
    always @(*) out_alwaysblock = a & b;

endmodule

// HDLBits: Alwaysblock2
// synthesis verilog_input_version verilog_2001
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );
    
    assign out_assign = a ^ b;
    always @(*)
        begin
            out_always_comb = a ^ b;
        end
    always @(posedge clk)
        begin
            out_always_ff = a ^ b;
        end

endmodule

// HDLBits: Always if
// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    
    assign out_assign = (sel_b1 & sel_b2) ? b : a;
    
    always @(*)
        begin
            if (sel_b1 & sel_b2) begin
                out_always = b;
            end
            else begin
                out_always = a;
            end
        end

endmodule

// HDLBits: Always if2
// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated) begin
           shut_off_computer = 1'b1;
        end    
        else begin
            shut_off_computer = 1'b0;
        end
    end

    always @(*) begin
        if (~arrived) begin
           keep_driving = ~gas_tank_empty;
        end
        else begin
            keep_driving = 1'b0;
        end
    end

endmodule

// HDLBits: Always case
// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
            3'd0: out = data0;
            3'd1: out = data1;
            3'd2: out = data2;
            3'd3: out = data3;
            3'd4: out = data4;
            3'd5: out = data5;
            default: out = 4'b0000;
        endcase
            
    end

endmodule

// HDLBits: Always case2
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    
    always @(*) begin
        case (in)
            4'b0001: pos = 2'd0;
            4'b0011: pos = 2'd0;
            4'b0101: pos = 2'd0;
            4'b0111: pos = 2'd0;
            4'b1001: pos = 2'd0;
            4'b1011: pos = 2'd0;
            4'b1101: pos = 2'd0;
            4'b1111: pos = 2'd0;
            4'b0010: pos = 2'd1;
            4'b0110: pos = 2'd1;
            4'b1010: pos = 2'd1;
            4'b1110: pos = 2'd1;
            4'b0100: pos = 2'd2;
            4'b1100: pos = 2'd2;
            4'b1000: pos = 2'd3;
            default: pos = 2'd0;
        endcase
    end

endmodule

// HDLBits: Always casez
// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos );
    
    always @ (*)
        begin
            casez (in[7:0])
                8'bzzzzzzz1: pos = 3'd0;
                8'bzzzzzz1z: pos = 3'd1;
                8'bzzzzz1zz: pos = 3'd2;
                8'bzzzz1zzz: pos = 3'd3;
                8'bzzz1zzzz: pos = 3'd4;
                8'bzz1zzzzz: pos = 3'd5;
                8'bz1zzzzzz: pos = 3'd6;
                8'b1zzzzzzz: pos = 3'd7;
                default: pos = 3'd0;
            endcase
        end
endmodule

// HDLBits: Always nolatches
// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    
    always @ (*)
        begin
            up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
            case(scancode)
                16'he06b: left  = 1'b1;
                16'he072: down  = 1'b1;
                16'he074: right = 1'b1;
                16'he075: up    = 1'b1;
            endcase
        end
endmodule

