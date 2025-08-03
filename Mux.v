
/***************************************************** Mux2x1_32Bits *****************************************************/

module Mux2x1_32Bits(out, in1, in2, sel);

input [31:0] in1, in2; 
output [31:0] out; 
input sel;

assign out = 	(sel == 1'b0) ? in1 :in2;

endmodule

/***************************************************** Mux2x1_10Bits *****************************************************/

module Mux2x1_10Bits(out, in1, in2, sel);

input [9:0] in1, in2; 
output [9:0] out; 
input sel;

assign out = (sel == 1'b0) ? in1 :in2;

endmodule

/***************************************************** Mux2x1_5Bits *****************************************************/

module Mux2x1_5Bits(
    output [4:0] out,  // 5-bit output
    input [4:0] in1,   // 5-bit input 1
    input [4:0] in2,   // 5-bit input 2
    input sel          // Selection signal
);

    // Mux logic
    assign out = (sel) ? in2 : in1;
endmodule 