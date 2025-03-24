`timescale 1ns / 1ps
module pc(
   input         [63:0] pcin,
   input                clk,
   input                rst,
   output logic  [63:0] pcout
   );
   
   always_ff @(posedge clk) begin
      if(rst) begin
         pcout<=0;
      end
      else begin
         pcout<=pcin;
      end
   end


endmodule