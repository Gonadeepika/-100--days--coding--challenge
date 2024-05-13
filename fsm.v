module fsm(din,clk,rst,dout);
input din,clk,rst;
output dout;
parameter s0=2'b00, s1=2'b01, s2=2'b10,s3=2'b11;
reg[1:0]ns,ps;
always@(posedge clk)
begin
	if(rst)
		ps<=s0;
	else
		ps<=ns;
end
always@(*)
begin
	case(ps)
		s0:if(din)
		ns=s1;
	s1:if(~din)
	ns=s1;
else
	ns=s0;
s1:if(~din)
ns=s2;
else
	ns=s1;
s2:if(din)
ns=s3;
else
	ns=s0;
s3:if(din)
ns=s1;
else
	ns=s2;
default:ns=s0;
endcase
end
assign dout=(ps==s3)?1'b1:1'b0;
endmodule

