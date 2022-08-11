`timescale 1ns/1ps
module iiitb_3bit_rc_tb;
	reg clk;
	reg ori;
	wire [2:0] count;
	iiitb_3bit_rc rc(clk, ori, count);
	initial
	begin
		clk = 0;
		ori = 1;
		#1000 $finish;
	end
	always
	begin
		#10;
		clk = ~clk;
	end
	initial
	begin
		$dumpfile("iiitb_3bit_rr_out.vcd");
		$dumpvars(0, iiitb_3bit_rc_tb);
		#20
		ori = 0;
		#200;
		ori = 1;
		#20
		ori = 0;
	end
endmodule
