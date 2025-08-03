module ControlUnit (
    input [5:0] opcode,
    input reset,
    output reg branch,
    output reg Memread,
    output reg MemtoReg,
    output reg MemWrite,
    output reg AluSrc,
    output reg RegWrite,
    output reg [1:0] ALUop,
    output reg RegDst
);

    // Opcode parameters
    parameter R_type = 6'b000000;
    parameter lw = 6'b100011;
    parameter sw = 6'b101011;
    parameter beq = 6'b000100;


    // Control logic block
    always @(*) begin
        if (!reset) begin
            case (opcode)
                R_type: begin
                    RegDst <= 1'b1;       // Use the destination register
                    branch <= 1'b0;       // No branching
                    Memread <= 1'b0;      // No memory read
                    MemtoReg <= 1'b0;     // Write ALU result to register
                    ALUop <= 2'b10;       // ALU operation is determined by funct
                    MemWrite <= 1'b0;     // No memory write
                    AluSrc <= 1'b0;       // Second operand is register
                    RegWrite <= 1'b1;     // Enable register write
                end

                lw: begin
                    RegDst <= 1'b0;       // Use the destination register
                    branch <= 1'b0;       // No branching
                    Memread <= 1'b1;      // memory read
                    MemtoReg <= 1'b1;     // Write ALU result to memory
                    ALUop <= 2'b00;
                    MemWrite <= 1'b0;     // No memory write
                    AluSrc <= 1'b1;       // first operand is register   
                    RegWrite <= 1'b1;     // Enable register write
                end

                sw: begin
                    RegDst <= 1'bx;       // Don't Care
                    branch <= 1'b0;       // No branching
                    Memread <= 1'b0;      // No memory read
                    MemtoReg <= 1'bx;     // Don't Care
                    ALUop <= 2'b00;
                    MemWrite <= 1'b1;     // Memory Write
                    AluSrc <= 1'b1;       // first operand is register
                    RegWrite <= 1'b0;     // Unenable register write
                end

                beq: begin
                    RegDst <= 1'bx;       // Don't Care
                    branch <= 1'b1;       // Branching
                    Memread <= 1'b0;      // No memory read
                    MemtoReg <= 1'bx;     // Don't Care
                    ALUop <= 2'b01;       // Subtraction
                    MemWrite <= 1'b0;     // No memory write
                    AluSrc <= 1'b0;       // Second operand is register
                    RegWrite <= 1'b0;     // Unenable register write
                end

                default: begin
                    RegDst <= 1'b0;
                    branch <= 1'b0;
                    Memread <= 1'b0;
                    MemtoReg <= 1'b0;
                    ALUop <= 2'b00;
                    MemWrite <= 1'b0;
                    AluSrc <= 1'b0;
                    RegWrite <= 1'b0;
                end
            endcase
        end
    end
endmodule