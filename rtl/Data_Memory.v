`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:39:27
// Design Name: 
// Module Name: Data_Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//data memory
module Data_Memory(
    input WE,
    input CLK,
    input rst,
    input [31:0]A,  //aluresult
    input [31:0] WD,  //write data
    output [31:0] RD);
  
  integer i;
  reg [7:0] mem [0:1023];
  
  assign RD={mem[A+3],mem[A+2],mem[A+1],mem[A]};

  always @(posedge CLK) begin
    if(rst) begin
      for(i=0;i<1023;i=i+1)
        mem[i]<=0;
    end
    else begin
      if(WE)
        {mem[A+3],mem[A+2],mem[A+1],mem[A]}<=WD;
    end
  end

endmodule
