module FullAdderSub_8bit(A, B, Cin, Sum, Cout);
input  [7:0]A, B;
input  Cin; // if Cin=0 "add" , if Cin=1 "subtracte"
output [7:0]Sum ;
output Cout; // determine whether +ve or -ve
wire [7:0]C;
wire [7:0]Bin;

assign Bin[0]=B[0]^Cin;
assign Bin[1]=B[1]^Cin;
assign Bin[2]=B[2]^Cin;
assign Bin[3]=B[3]^Cin;
assign Bin[4]=B[4]^Cin;
assign Bin[5]=B[5]^Cin;
assign Bin[6]=B[6]^Cin;
assign Bin[7]=B[7]^Cin;

FullAdder_1bit UUT1(A[0], Bin[0], Cin , Sum[0], C[0]);
FullAdder_1bit UUT2(A[1], Bin[1], C[0], Sum[1], C[1]);
FullAdder_1bit UUT3(A[2], Bin[2], C[1], Sum[2], C[2]);
FullAdder_1bit UUT4(A[3], Bin[3], C[2], Sum[3], C[3]);
FullAdder_1bit UUT5(A[4], Bin[4], C[3], Sum[4], C[4]);
FullAdder_1bit UUT6(A[5], Bin[5], C[4], Sum[5], C[5]);
FullAdder_1bit UUT7(A[6], Bin[6], C[5], Sum[6], C[6]);
FullAdder_1bit UUT8(A[7], Bin[7], C[6], Sum[7], C[7]);

assign Cout=C[7]^Cin; // MSB bit must be 0

endmodule

