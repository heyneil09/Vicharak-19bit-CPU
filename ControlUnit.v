module ControlUnit(
input [4:0]opcode,
output reg regWrite,memoryRead,memoryWrite,branch,call,ret,jump);

always@(*)
begin 
case(opcode)
// all alu operations
5'b00000,
5'b00001,
5'b00010,
5'b00011, 
5'b00100,
5'b00101,
5'b00110,
5'b00111,
5'b01000,
5'b01001,
5'b01010,
5'b01011,
5'b01100,
5'b01101,
5'b01110,
5'b01111,
5'b10000,
5'b10001,
5'b10010,
5'b10011 : begin 
regWrite =1;
memoryRead=0;
memoryWrite=0;
branch=0;
jump=0;
call=0;
ret=0;
end

//JMP
5'b11000:begin 
regWrite =1;
memoryRead=0;
memoryWrite=0;
branch=0;
jump=1;
call=0;
ret=0;
end

//BEQ
5'b11001:begin 
regWrite =1;
memoryRead=0;
memoryWrite=0;
branch=1;
jump=0;
call=0;
ret=0;
end

//BnE
5'b11010:begin 
regWrite =1;
memoryRead=0;
memoryWrite=0;
branch=1;
jump=0;
call=0;
ret=0;
end

//call
5'b11011:begin 
regWrite =1;
memoryRead=0;
memoryWrite=0;
branch=0;
jump=0;
call=1;
ret=0;
end

//ret
5'b11100:begin 
regWrite =1;
memoryRead=0;
memoryWrite=0;
branch=0;
jump=0;
call=0;
ret=1;
end

//load
5'b11101:begin 
regWrite =0;
memoryRead=1;
memoryWrite=0;
branch=0;
jump=1;
call=0;
ret=0;
end

//store
5'b11000:begin 
regWrite =0;
memoryRead=0;
memoryWrite=1;
branch=0;
jump=1;
call=0;
ret=0;
end
endcase

end 

endmodule