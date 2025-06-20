module DataMemory(
input clk,memoryRead,memoryWrite,
input[18:0]address,data_in,
output reg [18:0] data_out);

reg[18:0] memory[0:255];

always@ (posedge clk)
begin 
if(memoryWrite)
begin 
memory[address]<=data_in;
end 
else if (memoryRead)
begin 
data_out=memory[address];
end 
else 
begin 
data_out<=0;
end 
end 
endmodule