`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:37:13
// Design Name: 
// Module Name: ALU_Src_Mux
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



module ALU_Src_Mux (
    input  [31:0] RD2,      // Register value
    input  [31:0] ImmExt,      // Immediate value
    input         ALUSrc,   // Control signal
    output [31:0] SrcB      // Output to ALU
);

    assign SrcB = (ALUSrc) ? ImmExt : RD2;

endmodule


