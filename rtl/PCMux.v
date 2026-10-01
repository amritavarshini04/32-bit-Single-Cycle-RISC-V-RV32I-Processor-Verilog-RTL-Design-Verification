`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:46:01
// Design Name: 
// Module Name: PCMux
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

module PCMux(
    input [31:0] PCTarget,
    input [31:0] PCPlus4,
    input PCSrc,
    output reg [31:0] PCNext);

  always @(*) begin
    case(PCSrc)
      1'b1: PCNext=PCTarget;
      1'b0: PCNext=PCPlus4;
    endcase
  end
endmodule

