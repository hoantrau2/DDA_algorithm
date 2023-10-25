module DDA_algorithm(clk,WR,LS, Nx,N, Pulse,Dir, flag_T); 
	input clk, WR, LS, flag_T;
	input [7:0] N, Nx;
	output Pulse, Dir;
	reg [7:0] acc;
	initial acc =N;
	reg clk1;
	reg pinout;
	reg [6:0] counter_clk1;
	initial counter_clk1 =0;
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
			else begin 
			Pulse = clk1 &pinout;
			end
			counter_clk1 = counter_clk1 +1;
			if (counter_clk1 ==50)
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
		end
	
	always @(clk1)
		begin
			if (clk1 == 1) 
				begin
				acc = acc + temp;
				if (acc>N) 
					begin
				acc = acc -N; pinout =1;
					end 
				else pinout =0;
				end
			else begin 
			 pinout =0;
			end
		end

endmodule
