module instructionMemory(
  input [9:0] outPC,
  input clk,
  output reg [31:0] instruction
);
 
  reg [31:0] memory [0:1023]; // Define memory to hold instructions
 
   // Initialize the instruction memory with some instructions for test bench
  initial begin
    memory[0]=32'b00000001000010010101000000100000;		//add $t2, $t0, $t1         # Add instruction: $t2 = $t0 + $t1
    memory[1]=32'b00000001001010000101000000100010;		//sub $t2, $t1, $t0         # Sub instruction: $t2 = $t1 - $t0
    memory[2]=32'b101011_00010_00111_0000000000000000;		//sw  $t3, 0($v0)           # Store Word: Memory[$v0 + 0] = $t3
    memory[3]=32'b100011_00000_01000_0000000000000000;		//lw  $t0, 0($a1)           # Load Word: $t0 = Memory[$a1 + 0]
    memory[4]=32'b00010000000000000000000000000101;		//beq $zero, $zero, 5       # Branch if Equal: If $zero == $zero, branch to PC + 5 (PC = 11)
    memory[5]=32'b00000001000010010101000000100000;   //add $t2, $t0, $t1         # Add instruction: $t2 = $t0 + $t1
    memory[6]=32'b00000001000010010101000000100000;   //add $t2, $t0, $t1         # Add instruction: $t2 = $t0 + $t1
    memory[9]=32'b00000000000000000000000000000000;   //nop                       # No Operation
    memory[10]=32'b00000000000000000000000000000000;  //nop                       # No Operation
    memory[11]=32'b00000000000000000000000000000000;  //nop                       # No Operation
    
  end
 
  // Read the instruction from the memory at the specified address (outPC)
  always @(posedge clk) begin
    instruction <= memory[outPC];
  end
 
endmodule 