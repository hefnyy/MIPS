module ALU32Bit(data1, data2, ALUControl, zero, ALUResult, reset);


input wire signed [31:0] data1,data2;
input wire [3:0] ALUControl;
output reg  zero;
output reg signed [31:0] ALUResult;
  input wire reset;

wire [31:0] neg_data2;
assign neg_data2 = -data2;

parameter ADD = 4'b0010;
parameter SUB = 4'b0110;


always @(posedge reset) zero <= 1'b0;

  always @(*)
begin

if(data1 == data2)
zero <= 1'b1;
else
zero <= 1'b0;

case(ALUControl)

ADD: 
	begin	
	ALUResult <= data1 + data2;
	end

SUB:
	begin
	ALUResult <= data1 + neg_data2;
	end
endcase
end

endmodule
