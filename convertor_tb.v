module convertor_tb();
reg clk,reset;
reg [7:0]data;
reg [2:0]mode;
wire [7:0] state,nextstate;
binary_code_convertor uut(.clk(clk),.data(data),.mode(mode),.state(state),.nextstate(nextstate));
initial clk=0;
always #5 clk=~clk;
initial begin
reset=1;data=8'b0;mode=3'b111;
#10 reset=0;data=8'b00111111;mode=3'b010;
#50
$finish;
end
endmodule
