/*
module RAM(
    input clk,
    input we,
    input [3:0] addr,
    input [3:0] din,
    output reg [3:0] dout
);

    reg [3:0] mem [0:15];
*/
 
module RAM (
    input clk,
    input we, //write enable
    input [7:0] addr, //addres
    input [7:0] din, //data in
    output reg [7:0] dout //data out
);
    reg [7:0] mem [0:255];  




    always @(posedge clk) begin
        if(we)
            mem[addr] <= din;

        dout <= mem[addr];
    end

endmodule