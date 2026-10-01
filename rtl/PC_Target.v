`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:44:02
// Design Name: 
// Module Name: PC_Target
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


module PC_Target (
    input [31:0] PC,
    input [31:0] ImmExt,
    output reg [31:0] PCTarget);

  always @(*) begin
    PCTarget=PC+ImmExt;
  end
endmodule

