module control_block(input clk,reset,input [7:0] data,input [2:0] mode,
output reg [7:0] state,nextstate);
wire [7:0]a,b,c,d,e,f;



 binary_to_grey g1(data,a);
 grey_to_binary g2(data,b);
 binary_to_bcd g3(data,c);
 bcd_to_binary g4(data,d);
 binary_to_excess g5(data,e);
 excess_to_binary g6(data,f);





always@(*)begin
case(mode)
3'b000:nextstate=a;
3'b001:nextstate=b;
3'b010:nextstate=c;
3'b011:nextstate=d;
3'b100:nextstate=e;
3'b101:nextstate=f;
default:nextstate=0;
endcase
end
always@(posedge clk,posedge reset)begin
    if(reset)
    state<=0;
    else
    state<=nextstate;
    end
endmodule



module binary_to_grey(input [7:0]data,output  [7:0]out);
assign out=(data) ^ (data>>1);
endmodule


module  grey_to_binary(input [7:0]in,output reg [7:0]out);
integer i;  
always@(*)begin
out[7]=in[7];
for(i=6;i>=0;i=i-1)begin
    out[i]=in[i]^out[i+1];
    end
    end
endmodule


module binary_to_excess(input [7:0]in,output [7:0]out);
assign out=in+8'd3;
endmodule

module excess_to_binary(input [7:0]in,output [7:0]out);
assign out=in-8'd3;
endmodule
    
module binary_to_bcd(input [7:0]in,output [7:0]out);
wire [3:0]out1,out2;
 
assign out1=in%10;
assign out2=in/10;
assign out={out2,out1};
endmodule
module bcd_to_binary(input [7:0]in,output [7:0]out);
wire [3:0]out1,out2;
assign out1=in[3:0];
assign out2=in[7:4];
assign out=10*out2+out1;
endmodule


