`timescale 1ns / 1ps

module MIPS_Testbench;

    // Inputs to the MIPS module
    reg clk;
    reg reset;

    // Instantiate the MIPS module
    MIPS uut (
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;

        // Wait for a few clock cycles
        #20;

        // Release reset
        reset = 0;

        // Allow the simulation to run for some time
        #150;

        // End the simulation
        $stop;
    end

    // Monitor internal signals
    initial begin
        // Monitor PC, instruction, and key registers
      $monitor("Time: %0dns, PC: %d, Instruction: %h, Reg[8]: %d, Reg[9]: %d, Reg[10]: %d mmemory[0]: %d  ,memory[1]: %d,memory[2]: %d,memory[3]: %d,memory[4]: %d,memory[5]: %d" ,
            $time, uut.PC_Out, uut.Instruction, uut.MIPS_RegisterFile.Reg[8], 
               uut.MIPS_RegisterFile.Reg[9], uut.MIPS_RegisterFile.Reg[10],uut.MIPS_DataMemory.memory[0],uut.MIPS_DataMemory.memory[1],uut.MIPS_DataMemory.memory[2],uut.MIPS_DataMemory.memory[3],uut.MIPS_DataMemory.memory[4],uut.MIPS_DataMemory.memory[5]);
    end

endmodule