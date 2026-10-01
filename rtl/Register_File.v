`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:49:01
// Design Name: 
// Module Name: Register_File
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

module Register_File(
    input CLK,
    input rst,
    input [4:0] A1,   //instr [19:15];
    input [4:0] A2,   //instr [24:20];
    input [4:0] A3,   //instr [11:7];
    input [31:0] WD3, //result of write back mux;
    input WE3,
    output  [31:0] RD1,
    output  [31:0] RD2);

  reg [31:0] mem [31:0];
  integer i;

  assign RD1=mem[A1];
  assign RD2=mem[A2];

  always @(posedge CLK) begin 
    if(rst) begin
      for(i=0;i<32;i=i+1)
        mem[i]<=0;
    end
    else begin
      if(WE3) begin
        if(A3>0)
          mem[A3]<=WD3;
        else
          mem[A3]<=32'b0;
      end
    end
  end

endmodule
