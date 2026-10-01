`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:47:12
// Design Name: 
// Module Name: PCPlus_4
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


module PCPlus_4(
    input [31:0] PC,
    output reg [31:0] PCPlus4);

  always @(*) begin
    PCPlus4=PC+32'd4;
  end
endmodule

