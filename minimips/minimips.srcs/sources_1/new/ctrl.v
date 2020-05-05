`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/25 12:08:51
// Design Name: 
// Module Name: ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ctrl(
    input clk,
    input rst,
    input stallreq_ID,//HIGH valid
    input stallreq_EX,//HIGH valid
    output reg[5:0] stall
    );
    
    always @(*) begin
        if(rst) begin
            stall   <= 6'b000000;//erase stall signal

        end
        else if(stallreq_ID) begin
            stall   <= 6'b000011;//stall  the stages before ID
            
        end
        else if(stallreq_EX) begin
            stall   <= 6'b001111;//stall the stages before EX: 
            
        end
        else begin//don't need stall any stage
            stall   <= 6'b000000;
        end //end if
    end
endmodule
