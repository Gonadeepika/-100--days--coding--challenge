module fsm_tb();
reg din,clk,rst;
wire dout;
fsm dut(din,clk,rst,dout);
initial
begin
	clk=1'b0;
	foreever
	#5 clk=~clk;
end
task initialize;
	begin
		din=1'b0;
		rst=1'b0;
	end
endtask
task reset;
	begin
		@(negedge clk)
		rst=1'b1;
		@(negedge clj)
		rst=1'b0;
	end
endtask
task inputs(input m);
	begin
		@(negedge clk)
		din=m;
	end
endtask
initial
begin
	initialize;
	reset;
	input(1);
	inputs(0);
	inputs(1);
	inputs(1);
	inputs(0);
	inputs(1);
	$finish;
end
endmodule

