//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Annotation:      SPC
// Module Name:     MEM_WB
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
module MEM_WB
(
    input  wire         clk,
    input  wire         rst,

    input  wire [ 3: 0] mem_aluop, 
    input  wire [31: 0] mem_alures,
    input  wire [31: 0] mem_m_din,
    input  wire         mem_wreg,
    input  wire [ 4: 0] mem_wraddr,

    output reg  [ 3: 0] wb_aluop, 
    output reg  [31: 0] wb_alures,
    output reg  [31: 0] wb_m_din,   // data read from mem, to WB seg
    output reg          wb_wreg,    // reg write enable, to WB seg
    output reg  [ 4: 0] wb_wraddr,   // seg write address, to WB seg
    
    input   [5:0]   stall
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            wb_aluop  <= 4'h0;
            wb_alures <= 32'b0;
            wb_m_din  <= 32'b0;
            wb_wreg   <= 1'b0;
            wb_wraddr <= 5'b0;
        end
        //MEM stall, WB's next is NOP
        else if(stall[4] && (!stall[5])) begin
            wb_aluop  <= 4'h0;
            wb_alures <= 32'b0;
            wb_m_din  <= 32'b0;
            wb_wreg   <= 1'b0;
            wb_wraddr <= 5'b0;
        end
        else if(!stall[5]) begin
            wb_aluop  <= mem_aluop;
            wb_alures <= mem_alures;
            wb_m_din  <= mem_m_din;
            wb_wreg   <= mem_wreg;
            wb_wraddr <= mem_wraddr;
        end
        /*
        else begin
            wb_aluop  <= mem_aluop;
            wb_alures <= mem_alures;
            wb_m_din  <= mem_m_din;
            wb_wreg   <= mem_wreg;
            wb_wraddr <= mem_wraddr;
        end*/
    end

endmodule