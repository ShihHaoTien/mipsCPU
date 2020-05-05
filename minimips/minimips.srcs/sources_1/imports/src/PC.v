//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Annotation:      SPC
// Module Name:     PC
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
module PC
(
    input  wire         clk,
    input  wire         rst,
    input  wire         br_flag,    // branch flags
    input  wire [31: 0] br_addr,    // branch address
    output reg  [31: 0] pc,
    
    input   [5:0]   stall//stall command
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            pc   <= 32'b0;
        end
        else begin
            if(br_flag) pc <= br_addr;
            //else pc <= pc + 32'd4;
            //no stall signal then add 4
            else if(!stall[0]) begin
                pc  <= pc + 32'd4;
            end
        end
    end

endmodule