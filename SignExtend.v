module SignExtend(in ,out);

input  [15:0] in;
output [31:0] out;

assign out =  (in[15] == 1)? {16'hffff , in} : 
              (in[15] == 0)? {16'h0000 ,in}  : 16'hxxxxxxx;

endmodule

module SignExtend10to32(in ,out);

input  [9:0] in;
output [31:0] out;

assign out =  (in[9] == 1)? {22'b1111111111111111111111, in} : 
              (in[9] == 0)? {22'b0000000000000000000000 ,in}  : 22'bxxxxxxxxxxxxxxxxxxxxxx;

endmodule 