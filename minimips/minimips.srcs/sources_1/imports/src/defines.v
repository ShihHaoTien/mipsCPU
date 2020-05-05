/*--------------------Encoding--------------------*/
// Opcode
`define         OP_OPECIAL          6'b000000
`define         OP_J                6'b000010
`define         OP_JAL              6'b000011
`define         OP_BEQ              6'b000100
`define         OP_BNE              6'b000101
`define         OP_BLEZ             6'b000110
`define         OP_BGTZ             6'b000111
`define         OP_ADDI             6'b001000
`define         OP_ADDIU            6'b001001
`define         OP_SLTI             6'b001010
`define         OP_SLTIU            6'b001011
`define         OP_ANDI             6'b001100
`define         OP_ORI              6'b001101
`define         OP_XORI             6'b001110
`define         OP_LUI              6'b001111
`define         OP_LW               6'b100011
`define         OP_SW               6'b101011

// Function : Opcode = Special
`define         OP_SLL              6'b000000
`define         OP_SRL              6'b000010
`define         OP_SRA              6'b000011
`define         OP_SLLV             6'b000100
`define         OP_SRLV             6'b000110
`define         OP_SRAV             6'b000111
`define         OP_JR               6'b001000
`define         OP_JALR             6'b001001
`define         OP_ADD              6'b100000
`define         OP_ADDU             6'b100001
`define         OP_SUB              6'b100010
`define         OP_SUBU             6'b100011
`define         OP_AND              6'b100100
`define         OP_OR               6'b100101
`define         OP_XOR              6'b100110
`define         OP_NOR              6'b100111
`define         OP_SLT              6'b101010
`define         OP_SLTU             6'b101011

/*--------------------ALU Op--------------------*/
`define         ALU_NOP             4'h0
`define         ALU_AND             4'h1
`define         ALU_OR              4'h2
`define         ALU_XOR             4'h3
`define         ALU_NOR             4'h4
`define         ALU_SLL             4'h5
`define         ALU_SRL             4'h6
`define         ALU_SRA             4'h7
`define         ALU_SLT             4'h8
`define         ALU_SLTU            4'h9
`define         ALU_ADD             4'hA
`define         ALU_SUB             4'hB
`define         ALU_JAL             4'hC
`define         ALU_LW              4'hD
`define         ALU_SW              4'hE