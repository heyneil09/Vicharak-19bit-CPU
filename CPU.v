module CPU(input clk,reset);

wire [19:0] proCount, proCount_next,proCount_update, writeData,instruction, alu_result,memoryData,data_in;
wire[4:0]opcode;
wire[3:0]rs1,rs2,rd;
wire[9:0]immediate;
wire[18:0] data1,data2,address;
wire regWrite,memoryRead,memoryWrite,branch,jump,call,ret;

ProgCounter pc (.clk(clk),.reset(reset),.update(proCount_update),.branch(branch),.jump(jump),.call(call),.ret(ret),.proCount_in(progCount_next),.jumpAddress(address),.proCount_out(proCount));

InstFetch ife (.clk(clk),.reset(reset),.proCount_in(proCount),.proCount_next(proCount_next),.instruction(instruction));

InstDec id (.instruction(instruction),.opcode(opcode),.rs1(rs1),.rs2(rs2),.rd(rd),.immediate(immediate));

RegisterFile rf (.clk(clk),.regWrite(regWrite),.rs1(rs1),.rs2(rs2),.rd(rd));

ALU alu(.op1(data1),.op2(data2),.opcode(opcode),.alu_result(alu_result),.immediate(immediate));

ControlUnit cu (.opcode(opcode),.regWrite(regWrite),.memoryRead(memoryRead),.memoryWrite(memoryWrite),.branch(branch),.jump(jump),.call(call),.ret(ret));

DataMemory dmme (.clk(clk),.memoryRead(memoryRead),.memoryWrite(memoryWrite),.address(alu_result),.data_in(data2),.data_out(memoryData));

endmodule
