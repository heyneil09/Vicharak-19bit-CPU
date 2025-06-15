module ProgCounter(
input clk,reset,update,branch,call,ret,jump,
input [18:0] proCount_in,jumpAddress,
output reg [18:0] proCount_out);
// stack for return val
reg [18:0] stack[0:15];
reg [3:0] stackPointer;

always@(posedge clk or posedge reset)

begin 
if(reset)
begin

proCount_out<=0;
stackPointer<=0;
end

else if (ret)
begin 
stackPointer<=stackPointer+1;
proCount_out<=stack[stackPointer];
end 

else if (call)
begin
stack[stackPointer]<=proCount_out+1;
stackPointer<=stackPointer-1;
proCount_out<=jumpAddress;
end

else if (branch)
begin 
proCount_out<=jumpAddress;
end 

else if (jump)
begin 
proCount_out<=jumpAddress;
end 

else 
begin 
proCount_out<=proCount_in;
end

end 
endmodule