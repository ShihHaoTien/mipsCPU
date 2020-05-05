//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Module Name:     EX_MEM
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
module EX_MEM
(
    input  wire            clk,
    input  wire            rst,

    input  wire [ 3: 0] ex_aluop, 
    input  wire [31: 0] ex_alures,
    input  wire         ex_m_wen,
    input  wire [31: 0] ex_m_addr,
    input  wire [31: 0] ex_m_dout,
    input  wire         ex_wreg,
    input  wire [ 4: 0] ex_wraddr,
    
    output reg  [ 3: 0] mem_aluop, 
    output reg  [31: 0] mem_alures,
    output reg          mem_m_wen,      // write mem enable signal, to MEM seg
    output reg  [31: 0] mem_m_addr,
    output reg  [31: 0] mem_m_dout,
    output reg          mem_wreg,
    output reg  [ 4: 0] mem_wraddr
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            mem_aluop   <= 4'h0;
            mem_alures  <= 32'b0;
            mem_m_wen   <= 1'b0;
            mem_m_addr  <= 32'b0;
            mem_m_dout  <= 32'b0;
            mem_wreg    <= 1'b0;
            mem_wraddr  <= 5'b0;
        end
        else begin
            mem_aluop   <= ex_aluop;
            mem_alures  <= ex_alures;
            mem_m_wen   <= ex_m_wen;
            mem_m_addr  <= ex_m_addr;
            mem_m_dout  <= ex_m_dout;
            mem_wreg    <= ex_wreg;
            mem_wraddr  <= ex_wraddr;
        end
    end

endmodule