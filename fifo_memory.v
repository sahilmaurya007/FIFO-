`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: SAHIL MAURYA (Research Schloar IIT MANDI)
// 
// Create Date: 27.02.2025 00:37:19
// Design Name: 
// Module Name: fifo_memory
// Project Name: FIFO Design 
// Target Devices: Xilinx Zybo Z7 xc7z010clg400-1 FPGA Board
// Tool Versions: Xilinx Vivado 2019.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_memory #(
    parameter DEPTH = 8,
    parameter WIDTH = 4
)(
    input wire clk,
    input wire reset,
    input wire EN,
    input wire WR,
    input wire RD,
    input wire status,
    input wire [WIDTH-1:0] Data_in,
    output reg [WIDTH-1:0] Data_out,
    output reg Full, Empty, IDLE, Half
);

 // Memory and control signals
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [2:0] wr_ptr, rd_ptr;
    reg [3:0] count;
    reg [WIDTH-1:0] data_reg;

    always @(posedge clk) begin
        if (reset) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count <= 0;
            Full <= 0;
            Empty <= 1;
            IDLE <= 1;
            Half <= 0;
            Data_out <= 0;
            data_reg <= 0;
        end 
        else if (EN) begin
            IDLE <= ~(WR | RD);

            if (WR && !Full) begin
                mem[wr_ptr] <= Data_in;
                wr_ptr <= (wr_ptr + 1) % DEPTH;
                count <= count + 1;
            end

            if (RD && !Empty) begin
                data_reg <= mem[rd_ptr];
                rd_ptr <= (rd_ptr + 1) % DEPTH;
                count <= count - 1;
            end

            Empty <= (count == 0);
            Full <= (count == DEPTH);
            Half <= (count >= DEPTH/2);

            Data_out <= status ? data_reg : {Full, Half, Empty, IDLE};
        end
    end
endmodule
