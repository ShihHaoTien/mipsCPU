`timescale 1ns / 1ps

module simu();

    reg          clk;
    reg          reset;
    reg  [15: 0] switch;
    reg  [ 3: 0] keys;
    wire [15: 0] led;
    wire [ 7: 0] ca;
    wire [ 3: 0] an;

    Basys3_Top test
    (
        .clk    ( clk       ),
        .reset  ( reset     ),
        .switch ( switch    ),
        .keys   ( keys      ),
        .led    ( led       ),
        .ca     ( ca        ),
        .an     ( an        )
    );

    initial begin
        clk    = 0;
        reset  = 1;
        switch = 0;
        keys   = 0;

        #100
        reset  = 0;
        switch = 16'd3;
        #100
        switch  =16'hf;
        #100
        switch = 16'b0000_0000_0011_0000;
    end

    always #5 clk = ~clk;

endmodule
