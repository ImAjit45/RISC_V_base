module control(
  input         [31:0] inst, 
  input                reset,
  output logic         Branch,     
  output logic         MemRead,
  output logic         MemtoReg,
  output logic         MemWrite,
  output logic  [3:0]  ALUControl,
  output logic         ALUSrc,
  output logic         RegWrite
  );

   logic  [3:0] p;
   logic  [6:0] opcode;
   
   assign p = {inst[30], inst[14:12]};
   assign opcode = inst[6:0];
   
   always_comb begin
   if (reset) begin
      // Reset all signals to their default state
      ALUSrc      <= 0;
      MemtoReg    <= 0;
      RegWrite    <= 0;
      MemRead     <= 0;
      MemWrite    <= 0;
      Branch      <= 0;
      ALUControl  <= 4'bx;
   end 
   else begin
      case (opcode)
         7'b0110011: begin // R-type instructions//arithmetic operations
         case (p)
            4'b0000: begin // add
               ALUSrc     <= 0;
               MemtoReg   <= 0;
               RegWrite   <= 1;
               MemRead    <= 0;
               MemWrite   <= 0;
               Branch     <= 0;
               ALUControl <= 4'b0010;
            end
            4'b1000: begin // sub
               ALUSrc     <= 0;
               MemtoReg   <= 0;
               RegWrite   <= 1;
               MemRead    <= 0;
               MemWrite   <= 0;
               Branch     <= 0;
               ALUControl <= 4'b0110;
            end
            4'b0111: begin // and
               ALUSrc     <= 0;
               MemtoReg   <= 0;
               RegWrite   <= 1;
               MemRead    <= 0;
               MemWrite   <= 0;
               Branch     <= 0;
               ALUControl <= 4'b0000;
            end
            4'b0110: begin // or
               ALUSrc     <= 0;
               MemtoReg   <= 0;
               RegWrite   <= 1;
               MemRead    <= 0;
               MemWrite   <= 0;
               Branch     <= 0;
               ALUControl <= 4'b0001;
            end
            default: begin // default case for R-type
               ALUSrc     <= 0;
               MemtoReg   <= 0;
               RegWrite   <= 0;
               MemRead    <= 0;
               MemWrite   <= 0;
               Branch     <= 0;
               ALUControl <= 4'bx;
            end
         endcase
         end
         7'b0000011: begin // load
         ALUSrc     <= 1;
         MemtoReg   <= 1;
         RegWrite   <= 1;
         MemRead    <= 1;
         MemWrite   <= 0;
         Branch     <= 0;
         ALUControl <= 4'b0010;
         end
         7'b0100011: begin // store
         ALUSrc     <= 1;
         MemtoReg   <= 1'bx;
         RegWrite   <= 0;
         MemRead    <= 0;
         MemWrite   <= 1;
         Branch     <= 0;
         ALUControl <= 4'b0010;
         end
         7'b1100011: begin // branch
         ALUSrc     <= 0;
         MemtoReg   <= 1'bx;
         RegWrite   <= 0;
         MemRead    <= 0;
         MemWrite   <= 0;
         Branch     <= 1;
         ALUControl <= 4'b0110;
         end
         default: begin // default case for all other opcodes
         ALUSrc     <= 0;
         MemtoReg   <= 0;
         RegWrite   <= 0;
         MemRead    <= 0;
         MemWrite   <= 0;
         Branch     <= 0;
         ALUControl <= 4'bx;
         end
      endcase
   end
   end

endmodule








