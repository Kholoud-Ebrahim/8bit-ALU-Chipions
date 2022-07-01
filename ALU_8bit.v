module ALU_8bit(A, B, Opcode, carry_in, out, carry_out, C_flag, Z_flag);
input [7:0]A, B;
input [2:0]Opcode;
input carry_in;
output reg [7:0]out;
output carry_out;
output reg C_flag, Z_flag;
wire [7:0]Sum;
FullAdderSub_8bit UUT1(A, B, carry_in, Sum, carry_out);

always @(*) begin
    case(Opcode) 
        3'b000:  out= Sum;  //add
        3'b001:  out= Sum;  //sub
        3'b010:  out= A&B;  //and
        3'b011:  out= A|B;  //or
        3'b100:  out= A^B;  //xor
        3'b101:  out= A>B;  //greater than
        3'b110:  out= A<<1; //shift A one bit left
        3'b111:  out= B<<1; //shift B one bit left
       default:  out= 8'bxxxxxxxx; 
    endcase
    if(A>B)
        C_flag=1;
    else
        C_flag=0;
    if (out==0)
        Z_flag=1;
    else
        Z_flag=0;    
end
endmodule