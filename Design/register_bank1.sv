`timescale 1ns / 1ps


module RF1(
    input                clk,
    input                RegWrite,
    input        [4:0]   readReg1 ,
    input        [4:0]   readReg2 ,
    input        [4:0]   writereg , 
    input        [63:0]  writeData,
    output logic [63:0]  readData1,
    output logic [63:0]  readData2
    );
    
    logic [31:0][63:0] RF; 
    
 integer i;
   
      initial begin
            for(i=0;i<32;i=i+1)
         begin
            RF[i]=31-i;
         end
      end
    always_comb begin
      readData1 = RF[readReg1];
      readData2 = RF[readReg2];
    end
    always_ff @(posedge clk)
        if (RegWrite) begin
         RF[writereg]<=writeData;
        end     
endmodule