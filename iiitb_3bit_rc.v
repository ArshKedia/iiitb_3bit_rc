module iiitb_3bit_rc(clk, ori, count);
	input clk;
	input ori;
	output[2:0] count;
	reg[2:0] temp;
	always @(posedge(clk), ori)
	begin
		if(ori == 1)
		begin 
			temp = 3'b100;
		end
		else if(clk == 1)
		begin
			temp = {temp[0], temp[2:1]};
		end
	end
	assign count = temp;
endmodule
