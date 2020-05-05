//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        SPC
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Annotation:      SPC
// Module Name:     MEM
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
module MEM
(
    input wire  [ 3: 0] aluop_i,        // aluop from ex_mem seg
    input wire  [31: 0] alures_i,       // alures, may be used as reg write data
    input wire          m_wen_i,        // write enable signal to mem
    input wire  [31: 0] m_addr_i,       // write/read address to/from mem
    input wire  [31: 0] m_dout_i,       // write data to mem
    input wire          wreg_i,         // reg write enable
    input wire  [ 4: 0] wraddr_i,       // reg write address
    input wire  [31: 0] m_din_i,        // read data from mem


    output reg  [ 3: 0] aluop_o,        // send aluop signal to wb seg
    output reg  [31: 0] alures_o,       // alures, may be used as reg write data
    output reg          wreg_o,         // reg write enable
    output reg  [ 4: 0] wraddr_o,       // reg write address

    output reg          data_wen_o,     // mem write enable
    output reg  [31: 0] data_addr_o,    // send mem address
    output reg  [31: 0] data_dout_o,    // data send to mem
    output reg  [31: 0] m_din_o         // data read from mem


);

    always @ (*) begin
        aluop_o     <= aluop_i;
        alures_o    <= alures_i;
        wreg_o      <= wreg_i;
        wraddr_o    <= wraddr_i;

        data_wen_o  <= m_wen_i;
        data_addr_o <= m_addr_i;
        data_dout_o <= m_dout_i;

        m_din_o     <= m_din_i;
    end

endmodule