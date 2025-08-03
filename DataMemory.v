module DataMemory (MemWrite,Memread,address,writeData,clk,readData);
  reg[31:0] memory [0:4095];
  input MemWrite,Memread,clk;
  input [11:0] address;
  input [31:0] writeData;
  output reg [31:0] readData;
  
  always@(posedge clk) 
    begin
      if(MemWrite==1)
        memory[address]=writeData;
    end
  
  always@(*)
    begin
      
      if(Memread==1)
        readData=memory[address];
      
    end
    initial begin
      memory[0]=32'b00000000000000000000000000000000;	
      memory[1]=32'b00000000000000000000000000000001;	
      memory[2]=32'b00000000000000000000000000000010;	//for test bench intialize some  Memory Locations with random values
      memory[3]=32'b00000000000000000000000000000111;	
      memory[4]=32'b00000000000000000000000000010011;
      memory[5]=32'b00000000000000000000000000010011;

  end
endmodule