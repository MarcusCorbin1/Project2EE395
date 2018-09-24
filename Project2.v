module Project2 (taken, out, clk, reset);
	input taken, clk, reset;
	output reg [1:0] out;
	reg [1:0] curState, nxtState;
	
	localparam ST = 2'b00, T = 2'b01, NT = 2'b10, SNT= 2'b11;
	
	initial
	begin
		curState = NT;
		out = 1'b0;
	end
	
	
	always @(posedge clk)
	begin
		
		case (curState)
			ST: if(taken)  //taken
					nxtState = ST;
				 else   //not taken
					nxtState = T;
					
		   T:  if(taken)  //taken
					nxtState = ST;
				 else   //not taken
					nxtState = NT;
			
			NT: if(taken)  //taken
					nxtState = T;
				 else   //not taken
					nxtState = SNT;
					
			SNT:if(taken) //taken
					nxtState = NT;
				 else  //not taken
					nxtState = SNT;
		endcase
	end
endmodule					
			