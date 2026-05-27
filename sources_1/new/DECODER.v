module DECODER(opcode, carry, instr);
	input [4:0]opcode;
    input carry;
	output reg [10:0]instr;
    //==================================================
    // instr format
    //
    // [10] selectB
    // [9]  selectA
    // [8]  LOAD0
    // [7]  LOAD1
    // [6]  LOAD2
    // [5]  LOAD3
    // [4]  ALUsel
    // [3]  mem_read
    // [2]  mem_write
    // [1:0] mem_target
    //==================================================

    always@(*)begin
        case(opcode)
			5'b00011 : instr = 11'b1101110_0_0_00;  //MOV A,Im (Mem bits 0)
            5'b00111 : instr = 11'b1110110_0_0_00;  //MOV B,Im
            5'b00001 : instr = 11'b0101110_0_0_00;  //MOV A,B
            5'b00100 : instr = 11'b0010110_0_0_00;  //MOV B,A
            5'b00000 : instr = 11'b0001110_0_0_00;  //ADD A,Im
            5'b00101 : instr = 11'b0110110_0_0_00;  //ADD B,Im
            5'b01000 : instr = 11'b0001111_0_0_00;  //SUB A,Im 追加
            5'b01101 : instr = 11'b0110111_0_0_00;  //SUB B,Im 追加
            5'b00010 : instr = 11'b1001110_0_0_00;  //IN A
            5'b00110 : instr = 11'b1010110_0_0_00;  //IN B
            5'b01011 : instr = 11'b1111010_0_0_00;  //OUT Im
            5'b01010 : instr = 11'b0011010_0_0_00;  //OUT A 追加
            5'b01001 : instr = 11'b0111010_0_0_00;  //OUT B
            5'b01111 : instr = 11'b1111100_0_0_00;  //JMP Im
			5'b01110 : instr = carry ? 11'b0011110_0_0_00 : 11'b1111100_0_0_00;  //JNC Im
            5'b01100 : instr = 11'b1111110_0_0_00;  //NOP
			5'b10000 : instr = 11'b0011110_1_0_00;  //LOAD A,[Im]
			5'b10001 : instr = 11'b0111110_1_0_01;  //LOAD B,[Im]
			5'b10010 : instr = 11'b0011110_1_0_10;  //LOAD OUT,[Im]
			5'b10011 : instr = 11'b0011110_0_1_00;  //STORE A,[Im]
			5'b10100 : instr = 11'b0111110_0_1_01;  //STORE B,[Im]
			5'b10101 : instr = 11'b0011110_0_1_10;  //STORE OUT,[Im]
            default : instr = 11'b11111111111;
        endcase
    end
endmodule
