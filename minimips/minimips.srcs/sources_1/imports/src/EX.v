//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Annotation:      SPC
// Module Name:     EX
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
`include "defines.v"

module EX 
(
    input  wire [31: 0] pc,
    input  wire [ 3: 0] aluop,
    input  wire [31: 0] opr1,
    input  wire [31: 0] opr2,
    input  wire [31: 0] offset,
    output reg  [31: 0] alures,

    output reg          m_wen,      // data write to mem enable
    output reg  [31: 0] m_addr,     // data write to mem address
    output reg  [31: 0] m_dout,      // data out to mem
    
    output reg  stallreq_EX
);

    wire [31: 0] abs_opr1 = opr1[31] ? ~opr1 + 32'd1 : opr1;
    wire [31: 0] abs_opr2 = opr2[31] ? ~opr2 + 32'd1 : opr2;

    always @(*) begin
        case (aluop)
            `ALU_SLL:  alures <= opr2 << opr1[4:0];
            `ALU_SRL:  alures <= opr2 >> opr1[4:0];
            `ALU_SRA:  alures <= ($signed(opr2)) >>> opr1[4:0];
            `ALU_ADD:  alures <= opr1 + opr2;
            `ALU_SUB:  alures <= opr1 - opr2;
            `ALU_AND:  alures <= opr1 & opr2;
            `ALU_OR:   alures <= opr1 | opr2;
            `ALU_XOR:  alures <= opr1 ^ opr2;
            `ALU_NOR:  alures <= ~(opr1 | opr2);
            `ALU_SLT:  alures <= $signed(opr1) < $signed(opr2);
            `ALU_SLTU: alures <= opr1 < opr2;
            `ALU_JAL:  alures <= pc + 32'd8;
            default:   alures <= 32'b0;
        endcase
    end
    // Memory Data Prepare
    wire [31: 0] sl_addr = opr1 + offset;

    always @(*) begin
        m_wen   <= 1'b0;
        m_addr  <= 32'b0;
        m_dout  <= 32'b0;
        stallreq_EX <=1'b0;

        case (aluop)
            `ALU_LW: begin
                m_addr  <= sl_addr;
            end

            `ALU_SW:  begin
                m_addr  <= sl_addr;
                m_dout  <= opr2;
                m_wen   <= 1'b1;
            end
        endcase
    end
    
endmodule