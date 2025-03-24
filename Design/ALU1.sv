`timescale 1ns / 1ps

module ALU(x,y,ALUControl,cout,zero,result);
   input        [63:0] x,y;
   input        [3:0] ALUControl;
   output logic       cout;
   output logic [63:0]result;
   output logic       zero;
   
   always_comb begin
      case(ALUControl)
         4'b0010:{cout,result}=x+y;
         4'b0110:{cout,result}=x-y;
         4'b0000:result=x&y;
         4'b0001:result=x|y;
         default:result='0;
      endcase
   
      zero=(result==0)?1:0;
      
      end
endmodule
