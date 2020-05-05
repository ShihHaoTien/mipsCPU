//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        SPC
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Annotation:      SPC
// Module Name:     WB
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
`include "defines.v"

module WB
(
    input  wire [ 3: 0] aluop_i,
    input  wire [31: 0] alures_i,
    input  wire [31: 0] m_din_i,    // mem data from mem seg
    input  wire         wreg_i,     // reg write enable
    input  wire [ 4: 0] wraddr_i,   // reg write address

    output reg          wreg_o,     // reg write enable
    output reg  [ 4: 0] wraddr_o,   // reg write address
    output reg  [31: 0] wrdata_o    // reg write data
);

    wire        [31: 0] wb_wrdata;

    assign wb_wrdata = (aluop_i == `ALU_LW) ? m_din_i : alures_i;

    always @ (*) begin
        wreg_o      <= wreg_i;
        wraddr_o    <= wraddr_i;
        wrdata_o    <= wb_wrdata;
    end
endmodule