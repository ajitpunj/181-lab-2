module reg32_avalon_interface(clock, resetn, write, writedata, read, readdata, byteenable, chipselect, Q);
	input clock, resetn;
	
	input read, write, chipselect;
	input[3:0] byteenable;
	input  [31:0] writedata;
	output  [31:0] readdata;
	
	output [31:0] Q;
	
	wire [3:0] local_byteenable;
	wire [31:0] to_reg, from_reg;
	assign to_reg=writedata;
	assign local_byteenable = (chipselect & write) ?byteenable : 4'd0;
	assign readdata= from_reg;
	reg32 U1(.clock(clock), .resetn(resetn), .D(to_reg), .byteenable(local_byteenable), .Q(from_reg));
endmodule
	