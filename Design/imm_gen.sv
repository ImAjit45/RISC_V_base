`timescale 1ns / 1ps


module imm_gen(
   input        [31:0]A,
   output logic [63:0]B
   );
    
    
    wire [6:0]opcode=A[6:0];
    
    
    always_comb begin
         case(opcode)
                     7'b0110011:B=64'b0;//R
                     7'b0000011:B={{52{A[31]}},A[31:20]};// load
                     7'b0100011:B={{52{A[31]}},A[31:25],A[11:7]};//store
                     7'b1100011:B={{52{A[31]}},A[31],A[7],A[30:25],A[11:8]};//branch
                     default: B=0;
         endcase
    end
    
endmodule
