`timescale 1ns / 1ps


module Top1(input reset,clk,start,
   output               [63:0] readData1,readData2,ALUOut,writeData,
   output               [31:0] inst,
   output               [63:0] ALUIn2,imm_out,DM_out,
   output               [3:0]  ALUControl,
   output                      Branch,cout,zero,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,
   output logic  [511:0][7:0]  mem
    );
    

  logic  [63:0]t3;
  logic  sel;  
  
   pc_ir_add2_mux u2(
        .start(start),
        .clk(clk),
        .sel(sel),
        .t3(t3),
        .inst(inst),
        .mem(mem)
             );
    
   cnt_op  u1(
        .A(inst),
        .reset(reset),
        .clk(clk),
        .imm(imm_out),
        .Branch(Branch),
        .cout(cout),.zero(zero),    
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ALUControl(ALUControl),
        .result(ALUOut),
        .readData1(readData1),
        .readData2(readData2),
        .writeData(writeData)
        );
        
   imm_gen u3(
         .A(inst),
         .B(imm_out)
         );
                   
   assign t3=imm_out<<2;
   and(sel,Branch,zero);
      
endmodule
