`timescale 1ns / 1ps


module pc_ir_add2_mux(
   input                      start,
   input                      clk,
   input                      sel,
   input         [63:0]       t3,
   output logic  [31:0]       inst,
   output logic  [511:0][7:0] mem
      );
      
      logic [63:0]pcout;
      logic [63:0]t1;
      logic [63:0]t0;
      logic [63:0]pcin;
      logic [63:0]r1=64'd4;
      
      pc pc_dut(            
            .pcin(pcin),     
            .clk(clk),
            .rst(start),        
            .pcout(pcout));    
   
      IM IM_dut(              
            .address_in(pcout),
            .inst(inst),
            .mem(mem));
      
      // adder add1(        
            // .x(pcout),
            // .y(r1),     
            // .sum(t0),
            // . c( ) );
      
      // adder add2(        
            // .x(pcout),
            // .y(t3),     
            // .sum(t1),
            // . c( ) );    
   
      // mux mux1(
            // .sel(sel), 
            // .in0(t0),
            // .in1(t1),  
            // .out(pcin));
      assign   t0  = r1+pcout;
      assign   t1  = t3+pcout;     
      assign   pcin= sel?t1:t0;

   
endmodule
