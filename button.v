module button (
    input btn1,
    input btn2,
    output wire [5:0] led
);
    assign led[4:1] = 4'b1111;
    assign led[0] = btn1;
    assign led[5] = btn2;
endmodule