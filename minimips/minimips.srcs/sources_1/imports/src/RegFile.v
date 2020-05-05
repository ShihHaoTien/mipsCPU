//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Module Name:     RegFile
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
module RegFile
(
    input  wire         clk,
    input  wire         rst,
    // read section
    input  wire [ 4: 0] r1addr,
    output reg [31:0] r1data,
    //output wire [31: 0] r1data,
    input  wire [ 4: 0] r2addr,
    output reg [31:0] r2data,
   // output wire [31: 0] r2data,
    // write section
    input  wire         wreg,       // write enable
    input  wire [ 4: 0] wraddr,     // write address
    input  wire [31: 0] wrdata      // write data
);

    reg  [31: 0] GPR [31: 0]; // General-Purpose Registers

    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1)
            GPR[i] = 32'b0;
    end

    //write
    always @(posedge clk) begin
        if(!rst) begin
            if(wreg) GPR[wraddr] <= wrdata;
        end
    end

    /*assign r1data = r1addr == 5'b0 ? 32'b0 : GPR[r1addr];
    assign r2data = r2addr == 5'b0 ? 32'b0 : GPR[r2addr];*/
    
    //read port1
    always @(*) begin
        if(!rst) begin
            r1data  <= 32'b0;
        end
        //When read addr equals write addr and both write enabled, data hazard happens
        //send the written data to read port
        else if((r1addr==wraddr) && (wreg)) begin
            r1data  <= wrdata;
        end
        else begin
            r1data = r1addr == 5'b0 ? 32'b0 : GPR[r1addr];
        end
    end
    
    //read port2 same as port1
    always @(*) begin
        if(!rst) begin
            r2data  <= 32'b0;
        end
        //When read addr equals write addr and both write enabled, data hazard happens
        //send the written data to read port
        else if((r2addr==wraddr) && (wreg)) begin
            r2data  <= wrdata;
        end
        else begin
            r2data = r2addr == 5'b0 ? 32'b0 : GPR[r2addr];
        end
    end

endmodule

