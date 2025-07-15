// Shifts light on the 6 LEDs every 0.5 seconds
module counter (
    input wire clk,
    output wire [5:0] led
);
    wire [23:0] WAIT_TIME = 24'd13500000; // .5 sec for a clk frequency of 27MHz
    reg [23:0] counter = 24'd0;

    reg [5:0] led_count = 6'b000001;

    assign led = ~led_count;

    always @(posedge clk) begin
        if (counter < WAIT_TIME) begin
            counter <= counter + 1;
        end else begin
            counter <= 24'd0;
            led_count <= led_count << 1;
            if (led_count == 6'd0) led_count <= 6'b000001;
        end
    end
endmodule
