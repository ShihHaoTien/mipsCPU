//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Annotation:      SPC
// Module Name:     confreg
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// 
//------------------------------------------------------------------------------
module confreg
(
    input  wire         clk,
    input  wire         rst,
    input  wire         data_wen,       // data send enable 
    input  wire [31: 0] data_addr,      // data address
    input  wire [31: 0] data_dout,      // data in
    output reg  [31: 0] data_din,       // data send out
    input  wire [15: 0] switch,         // switch in board
    input  wire [ 3: 0] keys,           // key in board
    output reg  [15: 0] led,            // led in board
    output reg  [ 7: 0] ca,             // dp seg select
    output reg  [ 3: 0] an              // dp seat select
);

    reg [31:0] timer;
    reg [15:0] num;

    always @(*) begin
        case (data_addr[5:2])
            4'h0: data_din <= {16'b0, switch};
            4'h1: data_din <= {28'b0, keys};
            4'h2: data_din <= {16'b0, led};
            4'h3: data_din <= {16'b0, num};
            4'h4: data_din <= timer;
        endcase
    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            led   <= 15'b0;
            num   <= 15'b0;
            timer <= 15'b0;
        end
        else begin
            timer <= timer + 32'd1;
            if(data_wen) begin
                case (data_addr[5:2])
                    4'h2: led   <= data_dout[15:0];
                    4'h3: num   <= data_dout[15:0];
                    4'h4: timer <= data_dout;
                endcase
            end
        end
    end

    // Num scanning
    reg [3:0] scan;
    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            scan <= 4'd0;  
            an   <= 4'b1111;
        end
        else begin
            case(timer[18:17])
                2'b00 : scan <= num[15:12];
                2'b01 : scan <= num[11: 8];
                2'b10 : scan <= num[7 : 4];
                2'b11 : scan <= num[3 : 0];
            endcase

            case(timer[18:17])
                2'b00 : an <= 4'b0111;
                2'b01 : an <= 4'b1011;
                2'b10 : an <= 4'b1101;
                2'b11 : an <= 4'b1110;
            endcase
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            ca <= 8'b00;
        end
        else begin
            case (scan)
                4'd0 : ca <= 8'b00000011;   //0
                4'd1 : ca <= 8'b10011111;   //1
                4'd2 : ca <= 8'b00100101;   //2
                4'd3 : ca <= 8'b00001101;   //3
                4'd4 : ca <= 8'b10011001;   //4
                4'd5 : ca <= 8'b01001001;   //5
                4'd6 : ca <= 8'b01000001;   //6
                4'd7 : ca <= 8'b00011111;   //7
                4'd8 : ca <= 8'b00000001;   //8
                4'd9 : ca <= 8'b00001001;   //9
                4'd10: ca <= 8'b00010001;   //a
                4'd11: ca <= 8'b11000001;   //b
                4'd12: ca <= 8'b01100011;   //c
                4'd13: ca <= 8'b10000101;   //d
                4'd14: ca <= 8'b01100001;   //e
                4'd15: ca <= 8'b01110001;   //f
            endcase
        end
    end

endmodule