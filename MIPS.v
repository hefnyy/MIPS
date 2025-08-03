module MIPS(input clk,input reset);	


/******************** Wires ********************/

wire [9:0]PC_In,PC_Out,PC_plus_1;
wire [31:0] Instruction,PC_plus_1_Extended;
wire [31:0] WriteData,ReadData_1,ReadData_2;
wire [4:0] WriteReg;
wire RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
wire [1:0]ALUop;
wire [31:0]SignExtOut,ALUInput_2,ALUResult;
wire ZeroFlag;
wire [3:0]ALUControlOutput;
wire [31:0]MemReadData;
wire AndBranch;
wire [31:0]BranchAdderResult;

/******************** Modules ********************/

PC PC_MIPS(PC_In,PC_Out,reset,clk);

AdderPC PC_Adder(PC_plus_1,PC_Out,10'b000000001);

instructionMemory InstructionMemory(PC_Out,clk,Instruction);

ControlUnit ControlUnitMIPS(Instruction[31:26],reset,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,ALUop,RegDst);

Mux2x1_5Bits MUX_Write_Register(WriteReg,Instruction[20:16],Instruction[15:11],RegDst);

RegisterFile MIPS_RegisterFile(Instruction[25:21],Instruction[20:16],WriteReg,WriteData,RegWrite,clk,reset,ReadData_1,ReadData_2);

SignExtend SignExtend_32(Instruction[15:0],SignExtOut);

ALUControl MIPS_ALUControl(clk,ALUop,Instruction[5:0],ALUControlOutput);

Mux2x1_32Bits ALU_Mux2x1_32Bits(ALUInput_2,ReadData_2,SignExtOut,ALUSrc);

ALU32Bit MIPS_ALU32Bit(ReadData_1,ALUInput_2,ALUControlOutput,ZeroFlag,ALUResult,reset);

DataMemory MIPS_DataMemory(MemWrite,MemRead,ALUResult[11:0],ReadData_2,clk,MemReadData);

Mux2x1_32Bits MemoryOut_Mux2x1_32Bits(WriteData,ALUResult,MemReadData,MemtoReg);

SignExtend10to32 SignForPCplus1(PC_plus_1,PC_plus_1_Extended);

Adder Branch_Adder(BranchAdderResult,SignExtOut,PC_plus_1_Extended);

AndGate BranchANDGate(AndBranch,ZeroFlag,Branch);
  
Mux2x1_10Bits Mux2x1_10Bits_BranchandPC(PC_In,PC_plus_1,BranchAdderResult[9:0],AndBranch);
  
endmodule