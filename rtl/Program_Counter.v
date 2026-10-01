`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:48:01
// Design Name: 
// Module Name: Program_Counter
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

module Program_Counter(
    input CLK,
    input rst,
    input [31:0] PCNext,
    output reg [31:0] PC);

  always @(posedge CLK) begin
    if(rst) 
      PC<=0;
    else
      PC<=PCNext;
  end
endmodule

