module fa (input wire i0, i1, cin, output wire sum, cout);

	wire t1,t2,t3;
	xor3 x1(i0,i1,cin,sum);
	and2 a1(i0,i1,t1);
	and2 a2(i1,cin,t2);
	and2 a3(cin,i0,t3);
	or3 o3(t1,t2,t3,cout);
endmodule

module addsub (input wire addsub, i0, i1, cin, output wire sumdiff, cout);  //adds or subtracts based on the addsub wire
	wire b;

	xor2 x(addsub,i1,b);//xor -----which doesn't do anything if addsub==0,else it negates what needs to be subtacted

	fa f1(i0,b,cin,sumdiff,cout);//remember! cin needs to be 1 if we need to subtract
endmodule

module alu_slice (input wire [1:0] op, input wire i0, i1, cin, output wire o, cout);
	wire and_out,or_out,sum_or_diff,and_or_or;

	addsub a(op[0],i0,i1,cin,sum_or_diff,cout);

	and2 a1(i0,i1,and_out);

	or2 o2(i0,i1,or_out);

	mux2 and_or(and_out,or_out,op[0],and_or_or);

	mux2 final_select(sum_or_diff,and_or_or,op[1],o);
  
endmodule

module alu (input wire [1:0] op, input wire [15:0] i0, i1,
    output wire [15:0] o, output wire cout);

	wire [15:0] carry;

 	alu_slice bitno0(op,i0[0],i1[0],op[0],o[0],carry[0]);
 	alu_slice bitno1(op,i0[1],i1[1],carry[0],o[1],carry[1]);
 	alu_slice bitno2(op,i0[2],i1[2],carry[1],o[2],carry[2]);
 	alu_slice bitno3(op,i0[3],i1[3],carry[2],o[3],carry[3]);
 	alu_slice bitno4(op,i0[4],i1[4],carry[3],o[4],carry[4]);
	alu_slice bitno5(op,i0[5],i1[5],carry[4],o[5],carry[5]);
 	alu_slice bitno6(op,i0[6],i1[6],carry[5],o[6],carry[6]);
 	alu_slice bitno7(op,i0[7],i1[7],carry[6],o[7],carry[7]);
 	alu_slice bitno8(op,i0[8],i1[8],carry[7],o[8],carry[8]);
 	alu_slice bitno9(op,i0[9],i1[9],carry[8],o[9],carry[9]);
 	alu_slice bitno10(op,i0[10],i1[10],carry[9],o[10],carry[10]);
 	alu_slice bitno11(op,i0[11],i1[11],carry[10],o[11],carry[11]);
 	alu_slice bitno12(op,i0[12],i1[12],carry[11],o[12],carry[12]);
 	alu_slice bitno13(op,i0[13],i1[13],carry[12],o[13],carry[13]);
 	alu_slice bitno14(op,i0[14],i1[14],carry[13],o[14],carry[14]);
 	alu_slice bitno15(op,i0[15],i1[15],carry[14],o[15],cout);

  
endmodule
