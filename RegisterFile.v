module RegisterFile(
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg, 
    input [31:0] WriteData,
    input RegWrite,
    input Clk,
    input reset,
    output reg [31:0] ReadData1,
    output reg [31:0] ReadData2
);
 
reg [31:0] Reg[0:31];

integer i;

always @(posedge Clk or negedge reset) begin
    if (reset) begin
        // Asynchronouns reset: initialize all registers to Value of each index
        for (i = 0; i < 32; i = i + 1) begin
          Reg[i] <= i;
        end
    end
    else begin
        if (RegWrite) begin
            // Write data into the register specified by WriteReg
            Reg[WriteReg] <= WriteData;
        end
    end
end
 always @(*) begin
    // Read data from the registers specified by ReadReg1 and ReadReg2
    ReadData1 = Reg[ReadReg1];
    ReadData2 = Reg[ReadReg2];
end
endmodule