`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:52:04
// Design Name: 
// Module Name: Write_Back_Mux
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


//writre back mux
module Write_Back_Mux(
    input ResultSrc,
    input [31:0] ALUResult,
    input [31:0] ReadData,
    output reg [31:0] Result);

  always @(*) begin
    case(ResultSrc)
      1'b0: Result=ALUResult;
      1'b1: Result=ReadData;
    endcase
  end
endmodule


