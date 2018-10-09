// Write code for modules you need here

module reg16(input wire clock,reset,load,input wire [15:0]i,output wire [15:0]o);
dfrl df[15:0](clock,reset,load,i[15:0],o[15:0]);
endmodule


module reg16_8(input wire clock,reset,input wire [0:7]load,input wire [15:0]in,output wire [15:0]q0,q1,q2,q3,q4,q5,q6,q7);
reg16 regarr0(clock,reset,load[0],in,q0);
reg16 regarr1(clock,reset,load[1],in,q1);
reg16 regarr2(clock,reset,load[2],in,q2);
reg16 regarr3(clock,reset,load[3],in,q3);
reg16 regarr4(clock,reset,load[4],in,q4);
reg16 regarr5(clock,reset,load[5],in,q5);
reg16 regarr6(clock,reset,load[6],in,q6);
reg16 regarr7(clock,reset,load[7],in,q7);
endmodule


module mux8_16(input wire [2:0]op,input wire [15:0]i0,i1,i2,i3,i4,i5,i6,i7,output wire [15:0]o);
mux8 m1[15:0]({i0[15:0],i1[15:0],i2[15:0],i3[15:0],i4[15:0],i5[15:0],i6[15:0],i7[15:0]},op[2],op[1],op[0],o[15:0]);
endmodule

module reg_file (input wire clk, reset, wr, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b);
// Declare wires here
// Instantiate modules here
wire [0:7]load;
wire [15:0]intregout0,intregout1,intregout2,intregout3,intregout4,intregout5,intregout6,intregout7;
demux8 dm1(wr,wr_addr[2],wr_addr[1],wr_addr[0],load);
reg16_8 regblock(clk,reset,load,d_in,intregout0,intregout1,intregout2,intregout3,intregout4,intregout5,intregout6,intregout7);
mux8_16 m1[15:0](rd_addr_a,intregout0[15:0],intregout1[15:0],intregout2[15:0],intregout3[15:0],intregout4[15:0],intregout5[15:0],intregout6[15:0],intregout7[15:0],d_out_a[15:0]);
mux8_16 m2[15:0](rd_addr_b,intregout0[15:0],intregout1[15:0],intregout2[15:0],intregout3[15:0],intregout4[15:0],intregout5[15:0],intregout6[15:0],intregout7[15:0],d_out_b[15:0]);
endmodule


module reg_alu (input wire clk, reset, sel, wr, input wire [1:0] op, input wire [2:0] rd_addr_a,
		rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b, output wire cout);

// Declare wires here

// Instantiate modules here

endmodule
// Write code for modules you need here


module reg_file (input wire clk, reset, wr, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b);

// Declare wires here

// Instantiate modules here

endmodule


module reg_alu (input wire clk, reset, sel, wr, input wire [1:0] op, input wire [2:0] rd_addr_a,
		rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b, output wire cout);

// Declare wires here

// Instantiate modules here

endmodule
