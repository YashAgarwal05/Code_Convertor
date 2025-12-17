module binary_code_convertor(input clk,reset,input [2:0]mode,input [7:0] data
,output [7:0]state,nextstate);

control_block i(clk,reset,data,mode,state,nextstate);

endmodule