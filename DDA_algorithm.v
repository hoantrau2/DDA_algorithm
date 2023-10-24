module DDA_algorithm(clk,WR,LS, Nx,N, Pulse,Dir, flag_T); 
	input clk, WR, LS, flag_T;
	input [7:0] N, Nx;
	output Pulse, Dir;
	reg clk1 = 0;
	reg [6:0] counter_clk1;
	reg Pulse;
	reg [7:0]temp;
	assign Dir = Nx[7];

	always @(posedge WR)
		begin
		temp = Nx[6:0];
		end
	
	always @(posedge clk)
		begin
			if (LS ==1)
				Pulse =0;
			else Pulse = clk1 &pinout;
			counter_clk1 = counter_clk1 +1;
			if (counter_clk1 ==100)
				begin
					if (clk1 ==1)
						begin
			            clk1 =0;
			            counter_clk1 = 0;
			            end
			         else 
			            begin
			            clk1 =1;
			            counter_clk1 = 0;
			            end
		end
	
	always @(clk1)
		begin
			if (clk1 =1) 
				begin
				acc = acc + temp[6:0];
				if (acc>N) 
					begin
				acc = acc -N; pintout =1;
					end 
				else pinout =0;
				end
			else pinout =0;
		end

endmodule
