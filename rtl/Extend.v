`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:41:42
// Design Name: 
// Module Name: Extend
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


module Extend(
    input [31:7] Instr,
    input [1:0] ImmSrc,
    output reg [31:0] ImmExt);

  always @(*) begin
    case(ImmSrc) 
      // for I-type
      2'b00: ImmExt ={{20{Instr[31]}},Instr[31:20]};
      //for S-type
      2'b01: ImmExt ={{20{Instr[31]}},Instr[31:25],Instr[11:7]};
      //for B-type            
      // imm[12:1] = {inst[31], inst[7], inst[30:25], inst[11:8]} since in
      // b-type bits are reordered like this for forming 12 bit immediate and having a bit 0 to make sure words are aligned
      // imm[0] = 0 (branches are word aligned)
      2'b10: ImmExt ={{19{Instr[31]}},Instr[31],Instr[7],Instr[30:25],Instr[11:8],1'b0};
      //ther is no imm for R-type..
      default: ImmExt =32'b0;
    endcase
  end
endmodule

