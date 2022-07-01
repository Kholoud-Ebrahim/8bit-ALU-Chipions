/*
module FullAdder_1bit(in0, in1, carry_in, sum_out, carry_out);
input in0, in1, carry_in;
output sum_out, carry_out;
wire sum_1, carry_1, carry_2;
HalfAdder_1bit UUT1(.i0(in0), .i1(in1), .sum(sum_1), .carry(carry_1));
HalfAdder_1bit UUT2(.i0(carry_in), .i1(sum_1), .sum(sum_out), .carry(carry_2));
or(carry_out, carry_1, carry_2);
endmodule
*/
module FullAdder_1bit(in0, in1, carry_in, sum_out, carry_out);
input in0, in1, carry_in;
output sum_out, carry_out;
wire sum_1;
wire c1, c2, c3;

// sum= in0 ^ in1 ^ carry_in
xor(sum_1, in0, in1);
xor(sum_out, sum_1, carry_in);

and(c1, in0, in1);
and(c2, in0, carry_in);
and(c3, in1, carry_in);
or (carry_out, c1, c2, c3);
endmodule
