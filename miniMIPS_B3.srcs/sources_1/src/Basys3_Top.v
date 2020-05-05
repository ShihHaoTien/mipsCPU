`timescale 1ns / 1ps
//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Module Name:     Basys3_Top
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
//
//------------------------------------------------------------------------------
module Basys3_Top
(
    input  wire  clk,
    input  wire  reset,
    input  wire [15: 0] switch,
    input  wire [ 3: 0] keys,
    output wire [15: 0] led,
    output wire [ 7: 0] ca,
    output wire [ 3: 0] an
);

    wire [31: 0] inst_addr;
    wire [31: 0] inst_data;

    wire         data_wen;
    wire [31: 0] data_addr;
    wire [31: 0] data_dout;
    wire [31: 0] data_din;

    miniMIPS_Top cpu
    (
        .clk        ( clk           ),
        .rst        ( reset         ),
        .inst_addr  ( inst_addr     ),
        .inst_data  ( inst_data     ),
        .data_wen   ( data_wen      ),
        .data_addr  ( data_addr     ),
        .data_dout  ( data_dout     ),
        .data_din   ( data_din      )
    );

    inst_rom irom
    (
        .a      ( inst_addr [11:2]  ),
        .spo    ( inst_data         )
    );

    confreg ram
    (
        .clk        ( clk           ),
        .rst        ( reset         ),
        .data_wen   ( data_wen      ),
        .data_addr  ( data_addr     ),
        .data_dout  ( data_dout     ),
        .data_din   ( data_din      ),
        .switch     ( switch        ),
        .keys       ( keys          ),
        .led        ( led           ),
        .ca         ( ca            ),
        .an         ( an            )
    );

endmodule
