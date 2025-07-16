/*
Using the KY-032 obstacle avoidance sensor to count the number of items that is passing a point in a production line.
The count is being incremented when the sensor goes from not detecting to detecting.
btn1 is being used as a reset for the counter.

This example is not using the enable (EN) pin on the sensor. Although it should be used since the sensor can overheat if on for a long period of time.
*/
module avoidance_KY032 (
    input clk,
    input btn1,
    input IOB15B,
    output wire [5:0] led
);
    // localparam DETECTING = 0;
    // localparam NOT_DETECTING = 1;

    reg last_state = 1'b1;
    reg [5:0] counter_d = 6'd0;

    // LEDs are active low
    assign led = ~counter_d;
    
    always @(posedge clk) begin
        if (!btn1) begin 
            counter_d <= 6'd0;
        end else begin
            last_state <= IOB15B;
            if (last_state && !IOB15B) begin
                counter_d <= counter_d + 1;
            end
        end
    end
endmodule