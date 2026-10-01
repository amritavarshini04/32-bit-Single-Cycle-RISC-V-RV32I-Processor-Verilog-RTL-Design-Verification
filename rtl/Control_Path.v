`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2026 22:38:41
// Design Name: 
// Module Name: Control_Path
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


module Control_Path (
    input  [6:0] op,
    input  [2:0] funct3,
    input        funct7,
    input        Zero,

    output reg PCSrc,
    output reg ResultSrc,
    output reg MemWrite,
    output reg [2:0] ALUControl,
    output reg ALUSrc,
    output reg [1:0] ImmSrc,
    output reg RegWrite
);

    always @(*) begin
        // Default values
        PCSrc      = 0;
        ResultSrc  = 1'b0;
        MemWrite   = 0;
        ALUControl = 3'b000;
        ALUSrc     = 0;
        ImmSrc     = 2'b00;
        RegWrite   = 0;

        case (op)

            // ================= R-TYPE =================
            7'b0110011: begin
                RegWrite = 1;
                ALUSrc   = 0;
                ResultSrc= 1'b0;

                case (funct3)
                    3'b000: ALUControl = (funct7) ? 3'b001 : 3'b000; // SUB / ADD
                    3'b111: ALUControl = 3'b010; // AND
                    3'b110: ALUControl = 3'b011; // OR
                    default: ALUControl = 3'b000;
                endcase
            end

            // ================= LW =================
            7'b0000011: begin
                RegWrite  = 1;
                ALUSrc    = 1;
                ResultSrc = 1'b1;   // from memory
                MemWrite  = 0;
                ALUControl= 3'b000;  // ADD
                ImmSrc    = 2'b00;   // I-type
            end

            // ================= SW =================
            7'b0100011: begin
                RegWrite  = 0;
                ALUSrc    = 1;
                MemWrite  = 1;
                ALUControl= 3'b000;  // ADD
                ImmSrc    = 2'b01;   // S-type
            end

            // ================= BEQ =================
            7'b1100011: begin
                RegWrite  = 0;
                ALUSrc    = 0;
                MemWrite  = 0;
                ALUControl= 3'b001;  // SUB
                ImmSrc    = 2'b10;   // B-type

                PCSrc = Zero;        // branch decision
            end
            
            // ================ IMM =================
            7'b0010011: begin
                RegWrite   = 1;
                ALUSrc     = 1;
                ResultSrc  = 0;
                MemWrite   = 0;
                ALUControl = 3'b000; // ADD
                ImmSrc     = 2'b00;  // I-type
            end

        endcase
    end

endmodule

