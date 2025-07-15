// Outputs a constant frequency of 500Hz to pin IOB15B when the btn1 is pressed
// The frequency (which controlls the buzzer sound) can be changed
module buzzer_KY006 (
    input clk,
    input btn1,
    output reg IOB15B,
    output wire [5:0] led
);
    // Clock Freq = 27MHz
    parameter DELAY_CYCLES = 27000;
    reg [15:0] counter = 0;

    // button and leds are active low
    assign led[4:0] = 5'b11111;
    assign led[5] = btn1; // check that button is working
    
    
    always @(posedge clk) begin
        if (btn1) begin
            counter <= 0;
            IOB15B <= 1'b0;
        end else begin
            if (counter == DELAY_CYCLES) begin
                IOB15B <= ~IOB15B;
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule