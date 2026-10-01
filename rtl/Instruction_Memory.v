`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:42:35
// Design Name: 
// Module Name: Instruction_Memory
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

module Instruction_Memory(
    input [31:0] A,
    output reg [31:0] RD);

  reg [7:0]mem[0:1024];

  always @(*) begin
    RD={mem[A+3],mem[A+2],mem[A+1],mem[A]};
  end
endmodule
