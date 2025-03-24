`timescale 1ns / 1ps


module Top1_tb(

    );
    logic  [511:0][7:0]  mem;
    logic reset,clk,start;
    logic  [63:0]readData1,readData2,ALUOut,writeData;
    logic  [31:0]inst;
    
    logic  [3:0] ALUControl;
    logic  [63:0]ALUIn2,imm_out,DM_out;
    logic  Branch,cout,zero,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite; 
    
    Top1 dut(.reset(reset),.clk(clk),.start(start),
   . readData1(readData1),.readData2(readData2),
   . ALUOut(ALUOut),
   . inst(inst),
   . writeData(writeData),
    .ALUIn2(ALUIn2),
    .imm_out(imm_out),
    .DM_out(DM_out),
    .ALUControl(ALUControl),
    .Branch(Branch),
    .cout(cout),
    .zero(zero),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
        );
        
      always #10  clk=~clk;
        
        initial
        begin
        clk=1;start=1;reset=0;
        #5 start=0;
        
        #2000 $finish;
        end
           
   initial
   begin
           mem[0] = 8'b0;
           mem[1] = 8'b0;
           mem[2] = 8'b0;
           mem[3] = 8'b0;
           mem[4] = 8'b10000011;;
           mem[5] = 8'b00000000;
           mem[6] = 8'b00000001;
           mem[7] = 8'b00000000;//load RF[1]=DM[RF[2]]
           mem[8] = 8'b00000011;
           mem[9] = 8'b10000010;
           mem[10]= 8'b00000001;
           mem[11]= 8'b00000000;//load RF[4]=DM[RF[3]]
           mem[12]= 8'b10110011;
           mem[13]= 8'b10001111;
           mem[14]= 8'b01000000;
           mem[15]= 8'b00000000;//add RF[1]+RF[4]=RF[31]
           mem[16]= 8'b00100011;
           mem[17]= 8'b0;
           mem[18]= 8'b11110000;
     	     mem[19]= 8'b00000001;//store DM[RF[0]+offset] = RF[31]	
   	     mem[20]= 8'b01100011;	//20                
           mem[21]= 8'b10000101;  //21        
           mem[22]= 8'b00100000;  //         
           mem[23]= 8'b0;      //branch    
           mem[24]= 8'b0;
           mem[25]= 8'b0;
          
           mem[40]=  8'b00000011;                      
           mem[41]=  8'b10000010;                      
           mem[42]=  8'b00000001;                      
           mem[43]=  8'b00000000;//load RF[4]=DM[RF[3]]
   end
        
endmodule
