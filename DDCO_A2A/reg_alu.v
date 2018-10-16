// Write code for modules you need here
module reg16(input wire clk,reset,load,input wire [15:0] i,output wire [15:0] o);
dfrl ff0(clk,reset,load,i[0],o[0]);
dfrl ff1(clk,reset,load,i[1],o[1]);
dfrl ff2(clk,reset,load,i[2],o[2]);
dfrl ff3(clk,reset,load,i[3],o[3]);
dfrl ff4(clk,reset,load,i[4],o[4]);
dfrl ff5(clk,reset,load,i[5],o[5]);
dfrl ff6(clk,reset,load,i[6],o[6]);
dfrl ff7(clk,reset,load,i[7],o[7]);
dfrl ff8(clk,reset,load,i[8],o[8]);
dfrl ff9(clk,reset,load,i[9],o[9]);
dfrl ff10(clk,reset,load,i[10],o[10]);
dfrl ff11(clk,reset,load,i[11],o[11]);
dfrl ff12(clk,reset,load,i[12],o[12]);
dfrl ff13(clk,reset,load,i[13],o[13]);
dfrl ff14(clk,reset,load,i[14],o[14]);
dfrl ff15(clk,reset,load,i[15],o[15]);
endmodule
//we have one unit now we make 8 16 bit registers
module reg16_8(input wire clk,reset,input wire [0:7] select,input wire [15:0] i ,output wire [15:0] q0,q1,q2,q3,q4,q5,q6,q7);
reg16 reg0(clk,reset,select[0],16'b0,q0);
reg16 reg1(clk,reset,select[1],i,q1);
reg16 reg2(clk,reset,select[2],i,q2);
reg16 reg3(clk,reset,select[3],i,q3);
reg16 reg4(clk,reset,select[4],i,q4);
reg16 reg5(clk,reset,select[5],i,q5);
reg16 reg6(clk,reset,select[6],i,q6);
reg16 reg7(clk,reset,select[7],i,q7);
endmodule

module mux8_16(input wire [15:0] i0,i1,i2,i3,i4,i5,i6,i7,input wire [2:0] rd_addr,output wire [15:0]o);

	mux8 m0({i0[0],i1[0],i2[0],i3[0],i4[0],i5[0],i6[0],i7[0]},rd_addr[0],rd_addr[1],rd_addr[2],o[0]);
	mux8 m1({i0[1],i1[1],i2[1],i3[1],i4[1],i5[1],i6[1],i7[1]},rd_addr[0],rd_addr[1],rd_addr[2],o[1]);
	mux8 m2({i0[2],i1[2],i2[2],i3[2],i4[2],i5[2],i6[2],i7[2]},rd_addr[0],rd_addr[1],rd_addr[2],o[2]);
	mux8 m3({i0[3],i1[3],i2[3],i3[3],i4[3],i5[3],i6[3],i7[3]},rd_addr[0],rd_addr[1],rd_addr[2],o[3]);
	mux8 m4({i0[4],i1[4],i2[4],i3[4],i4[4],i5[4],i6[4],i7[4]},rd_addr[0],rd_addr[1],rd_addr[2],o[4]);
	mux8 m5({i0[5],i1[5],i2[5],i3[5],i4[5],i5[5],i6[5],i7[5]},rd_addr[0],rd_addr[1],rd_addr[2],o[5]);
	mux8 m6({i0[6],i1[6],i2[6],i3[6],i4[6],i5[6],i6[6],i7[6]},rd_addr[0],rd_addr[1],rd_addr[2],o[6]);
	mux8 m7({i0[7],i1[7],i2[7],i3[7],i4[7],i5[7],i6[7],i7[7]},rd_addr[0],rd_addr[1],rd_addr[2],o[7]);
	mux8 m8({i0[8],i1[8],i2[8],i3[8],i4[8],i5[8],i6[8],i7[8]},rd_addr[0],rd_addr[1],rd_addr[2],o[8]);
	mux8 m9({i0[9],i1[9],i2[9],i3[9],i4[9],i5[9],i6[9],i7[9]},rd_addr[0],rd_addr[1],rd_addr[2],o[9]);
	mux8 m10({i0[10],i1[10],i2[10],i3[10],i4[10],i5[10],i6[10],i7[10]},rd_addr[0],rd_addr[1],rd_addr[2],o[10]);
	mux8 m11({i0[11],i1[11],i2[11],i3[11],i4[11],i5[11],i6[11],i7[11]},rd_addr[0],rd_addr[1],rd_addr[2],o[11]);
	mux8 m12({i0[12],i1[12],i2[12],i3[12],i4[12],i5[12],i6[12],i7[12]},rd_addr[0],rd_addr[1],rd_addr[2],o[12]);
	mux8 m13({i0[13],i1[13],i2[13],i3[13],i4[13],i5[13],i6[13],i7[13]},rd_addr[0],rd_addr[1],rd_addr[2],o[13]);
	mux8 m14({i0[14],i1[14],i2[14],i3[14],i4[14],i5[14],i6[14],i7[14]},rd_addr[0],rd_addr[1],rd_addr[2],o[14]);
	mux8 m15({i0[15],i1[15],i2[15],i3[15],i4[15],i5[15],i6[15],i7[15]},rd_addr[0],rd_addr[1],rd_addr[2],o[15]);

endmodule

module mux2_16(input wire op, input wire [15:0]i0,i1,output wire [15:0]o);//this module is needed to select between alu input and outside input
	mux2 m1(i0[15],i1[15],op,o[15]);
	mux2 m2(i0[14],i1[14],op,o[14]);
	mux2 m3(i0[13],i1[13],op,o[13]);
	mux2 m4(i0[12],i1[12],op,o[12]);
	mux2 m5(i0[11],i1[11],op,o[11]);
	mux2 m6(i0[10],i1[10],op,o[10]);
	mux2 m7(i0[9],i1[9],op,o[9]);
	mux2 m8(i0[8],i1[8],op,o[8]);
	mux2 m9(i0[7],i1[7],op,o[7]);
	mux2 m10(i0[6],i1[6],op,o[6]);
	mux2 m11(i0[5],i1[5],op,o[5]);
	mux2 m12(i0[4],i1[4],op,o[4]);
	mux2 m13(i0[3],i1[3],op,o[3]);
	mux2 m14(i0[2],i1[2],op,o[2]);
	mux2 m15(i0[1],i1[1],op,o[1]);
	mux2 m16(i0[0],i1[0],op,o[0]);
endmodule

module reg_file (input wire clk, reset, wr, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b);

// Declare wires here
wire [0:7] select;
wire [15:0] q0,q1,q2,q3,q4,q5,q6,q7;
// Instantiate modules here
demux8 mydemux(wr, wr_addr[0],wr_addr[1], wr_addr[2], select);

reg16_8 writereg(clk,reset,select,d_in,q0,q1,q2,q3,q4,q5,q6,q7);

mux8_16 mux_read_a(q0,q1,q2,q3,q4,q5,q6,q7,rd_addr_a,d_out_a);

mux8_16 mux_read_b(q0,q1,q2,q3,q4,q5,q6,q7,rd_addr_b,d_out_b);   
endmodule


module reg_alu (input wire clk, reset, sel, wr, input wire [1:0] op, input wire [2:0] rd_addr_a,
		rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b, output wire cout);

// Declare wires here
	wire [15:0] o,out;
	wire cout1;
	mux2_16 m1(sel,d_in,o,out);
	reg_file reg1(clk,reset,wr,rd_addr_a,rd_addr_b,wr_addr,out,d_out_a,d_out_b);
	alu alu1(op,d_out_a,d_out_b,o,cout1);
	dfr d1(clk,reset,cout1,cout);	
// Instantiate modules here

		
endmodule
