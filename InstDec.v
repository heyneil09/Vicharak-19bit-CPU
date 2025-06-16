module InstDec(
input [18:0] instruction,
output reg [4:0] opcode,
output reg [3:0] rs1,rs2,rd,
output reg [9:0]immediate);

always@(*)
begin 
opcode = instruction[18:14];
rs1 = instruction[13:10];
rs2 = instruction[9:6];
rd = instruction[5:2];
immediate= instruction[9:0];
end 
endmodule
