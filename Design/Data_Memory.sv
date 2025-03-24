`timescale 1ns / 1ps


module DM(
  
   input               clk,
   input        [63:0] address,
   input        [63:0] write_data,
   input               mem_write,
   input               mem_read,
   output logic [63:0] read_data
   );
   
   logic [255:0][63:0] memory ;  
    
    integer i;
       initial begin
           for(i=0;i<256;i=i+1)
            begin
              memory[i]=i;
            end
       end
      
   always_ff @(posedge clk) begin
      if (mem_write) 
         begin
         memory[address] <= write_data;  
       end
   end
   
   always_comb  begin
       if (mem_read) begin
       read_data = memory[address]; 
       end 
       else begin
         read_data = 64'b0;  
       end
   end
endmodule

