module PC (nextPC ,outPC ,Reset,clk);

input wire [9:0] nextPC;
input Reset , clk;
output reg [9:0] outPC;

  always@(posedge clk or posedge Reset) begin
  if (Reset)
    outPC <= 10'b0000000000;  // Reset PC to 0
  else
    outPC <= nextPC;  // Update PC on clock
end
endmodule