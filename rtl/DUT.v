`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:40:57
// Design Name: 
// Module Name: DUT
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


`include "Data_Path.v"
`include "Control_Path.v"

module DUT(
    input CLK,
    input rst);

  wire PCSrc;
  wire ResultSrc;
  wire MemWrite;
  wire [2:0] ALUControl;
  wire ALUSrc;
  wire [1:0] ImmSrc;
  wire RegWrite;
  wire [6:0] op;
  wire [2:0] funct3;
  wire funct7;
  wire Zero;

  Data_Path Data_Path_inst(
    .CLK(CLK),
    .rst(rst),
    .PCSrc(PCSrc),
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .ALUControl(ALUControl),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc),
    .RegWrite(RegWrite),
    .op(op),
    .funct3(funct3),
    .funct7(funct7),
    .Zero(Zero)
  );

  Control_Path Control_Path_inst(
    .op(op),
    .funct3(funct3),
    .funct7(funct7),
    .Zero(Zero),
    .PCSrc(PCSrc),
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .ALUControl(ALUControl),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc),
    .RegWrite(RegWrite)
  );

endmodule



