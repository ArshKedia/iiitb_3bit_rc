module iiitb_3bit_rc(clk, ori, count);
	input clk;
	input ori;
	output[2:0] count;
	reg[2:0] temp;
	always @(posedge clk or posedge ori)
	begin
		if(ori == 1)
		begin 
			temp <= 3'b100;
		end
		else
			temp <= {temp[0], temp[2:1]};
	end
	assign count = temp;
endmodule
