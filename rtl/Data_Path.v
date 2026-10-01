`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:40:24
// Design Name: 
// Module Name: Data_Path
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

`include "ALU.v"
`include "ALU_Src_Mux.v"
`include "Data_Memory.v"
`include "Extend.v"
`include "Instruction_Memory.v"
`include "PC_Target.v"
`include "PCMux.v"
`include "PCPlus_4.v"
`include "Program_Counter.v"
`include "Register_File.v"
`include "Write_Back_Mux.v"

module Data_Path(
    input       CLK,
    input       rst,
    input       PCSrc,
    input       ResultSrc,
    input       MemWrite,
    input [2:0] ALUControl,
    input       ALUSrc,
    input [1:0] ImmSrc,
    input       RegWrite,

    output  [6:0] op,
    output  [2:0] funct3,
    output        funct7,
    output        Zero);

  wire [31:0] ALUResult;
  wire [31:0] WriteData;
  wire [31:0] ReadData;
  wire [31:0] Instr;
  wire [31:0] ImmExt;
  wire [31:0] PC;
  wire [31:0] PCNext;
  wire [31:0] PCTarget;
  wire [31:0] PCPlus4;
  wire [31:0] Result;
  wire [31:0] SrcA;
  wire [31:0] SrcB;
  wire [31:0] RD2;

  Data_Memory Data_Memory_inst (
    .WE(MemWrite),
    .CLK(CLK),
    .rst(rst),
    .A(ALUResult),
    .WD(RD2),
    .RD(ReadData)
  );
  
  Extend Extend_inst(
    .Instr(Instr[31:7]),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
  );

  Instruction_Memory Instruction_Memory_inst(
    .A(PC),
    .RD(Instr)
  );

  Program_Counter Program_Counter_inst(
    .CLK(CLK),
    .rst(rst),
    .PCNext(PCNext),
    .PC(PC)
  );

  PCMux PCMux_inst(
    .PCTarget(PCTarget),
    .PCPlus4(PCPlus4),
    .PCSrc(PCSrc),
    .PCNext(PCNext)
  );

  PCPlus_4 PCPlus_4_inst(
    .PC(PC),
    .PCPlus4(PCPlus4)
  );

  PC_Target PC_Target_inst (
    .PC(PC),
    .ImmExt(ImmExt),
    .PCTarget(PCTarget)
  );

  Register_File Register_File_inst(
    .CLK(CLK),
    .rst(rst),
    .A1(Instr[19:15]),
    .A2(Instr[24:20]),
    .A3(Instr[11:7]),
    .WD3(Result), //result of write back mux;
    .WE3(RegWrite),
    .RD1(SrcA),
    .RD2(RD2)
  );

  ALU ALU_inst (
    .SrcA(SrcA),
    .SrcB(SrcB),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult),
    .Zero(Zero)
  );

  ALU_Src_Mux ALU_Src_Mux(
    .RD2(RD2),
    .ImmExt(ImmExt),
    .ALUSrc(ALUSrc),
    .SrcB(SrcB)
  );
  
  Write_Back_Mux Write_Back_Mux_inst(
    .ResultSrc(ResultSrc),
    .ALUResult(ALUResult),
    .ReadData(ReadData),
    .Result(Result)
  );

  assign op = Instr[6:0];
  assign funct3 = Instr[14:12];
  assign funct7 = Instr[30]; 

endmodule

