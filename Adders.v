module Adder (out ,in1, in2);

input wire signed [31:0] in1, in2;
output wire signed [31:0] out;

assign out = in1 + in2;

endmodule


module AdderPC (out ,in1, in2);

  input wire signed [9:0] in1, in2;
  output wire signed [9:0] out;

assign out = in1 + in2;

endmodule

module AndGate (output wire out, input wire in1, input wire in2);

  assign out = in1 & in2;

endmodule