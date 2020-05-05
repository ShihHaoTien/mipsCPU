//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Annotation:      SPC
// Module Name:     ID_EX
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
module ID_EX
(
    input  wire         clk,
    input  wire         rst,

    input  wire [31: 0] id_pc,
    input  wire [ 3: 0] id_aluop,
    input  wire [31: 0] id_opr1,
    input  wire [31: 0] id_opr2,
    input  wire [31: 0] id_offset,
    input  wire         id_wreg,
    input  wire [ 4: 0] id_wraddr,

    output reg  [31: 0] ex_pc,
    output reg  [ 3: 0] ex_aluop,   // alu type, to EX seg
    output reg  [31: 0] ex_opr1,    // operator 1, to EX seg
    output reg  [31: 0] ex_opr2,    // operator 2, to EX seg
    output reg  [31: 0] ex_offset,
    output reg          ex_wreg,    // reg write enable signal, to EX seg
    output reg  [ 4: 0] ex_wraddr
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            ex_pc      <= 32'b0;
            ex_aluop   <= 4'h0;
            ex_opr1    <= 32'b0;
            ex_opr2    <= 32'b0;
            ex_offset  <= 32'b0;
            ex_wreg    <= 1'b0;
            ex_wraddr  <= 5'b0;
        end
        else begin
            ex_pc      <= id_pc;
            ex_aluop   <= id_aluop;
            ex_opr1    <= id_opr1;
            ex_opr2    <= id_opr2;
            ex_offset  <= id_offset;
            ex_wreg    <= id_wreg;
            ex_wraddr  <= id_wraddr;
        end
    end

endmodule