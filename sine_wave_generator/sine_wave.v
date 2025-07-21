module sine_wave #(
    PRECISION = 4, // PRECISION should be a multiple of 4 because the look up table is read as hex values (and 1 hex = 4 bits)
    LUT_ENTRIES = 256 // LUT_ENTRIES needs to be a power of 2, else the counter will not restart at index zero after all entries are traversed
) (
    input clk,
    input rst,
    output reg [PRECISION-1:0] usine // unsigned
    // output signed wire [PRECISION-1:0] isine // signed
);
    localparam LUT_BITS = $clog2(LUT_ENTRIES);

    reg [PRECISION-1:0] sine_lut [0:LUT_ENTRIES-1];
    reg [LUT_BITS-1:0] counter;

    initial begin
        $readmemh("sine_lut.mem", sine_lut);
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            usine <= {PRECISION{1'b0}};
            counter <= {LUT_BITS{1'b0}};
        end else begin
            usine <= sine_lut[counter];
            counter <= counter + 1;
        end
    end  
endmodule