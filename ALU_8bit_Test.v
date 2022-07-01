`timescale 1ps/1ps
module ALU_8bit_Test();
reg [7:0]A, B;
reg [2:0]Opcode;
reg carry_in;
wire [7:0]out;
wire carry_out;
wire C_flag, Z_flag;
ALU_8bit UUT(A, B, Opcode, carry_in, out, carry_out, C_flag, Z_flag);

initial begin
    // add 
             Opcode=3'b000; A= 170; B= 108; carry_in=0;
        #50; Opcode=3'b000; A= 7;   B= 4;   carry_in=0;
    // sub 
        #50; Opcode=3'b001; A= 170; B= 108; carry_in=1;
        #50; Opcode=3'b001; A= 7;   B= 4;   carry_in=1;
    // and  
        #50; Opcode=3'b010; A= 170; B= 108;
        #50; Opcode=3'b010; A= 255; B= 0;  
        #50; Opcode=3'b010; A= 255; B= 9;
    // or  
        #50; Opcode=3'b011; A= 170; B= 85;
        #50; Opcode=3'b011; A= 255; B= 0;  
        #50; Opcode=3'b011; A= 255; B= 9;
    // xor
        #50; Opcode=3'b100; A= 170; B= 85;
        #50; Opcode=3'b100; A= 255; B= 0;  
        #50; Opcode=3'b100; A= 255; B= 9;    
    // greater than
        #50; Opcode=3'b101; A= 170; B= 85;
        #50; Opcode=3'b101; A= 85; B= 170;     
    // shift A
        #50; Opcode=3'b110; A= 170; 
        #50; Opcode=3'b110; A= 255;   
    // shift B
        #50; Opcode=3'b111; B= 170; 
        #50; Opcode=3'b111; B= 255;  

    // C_flag
        #50; Opcode=3'b101; A= 170; B= 85;
        #50; Opcode=3'b101; A= 85; B= 170;      
    // Z_flag
        #50; Opcode=3'b000; A= 0; B= 0; carry_in=0;
        #50; Opcode=3'b000; A= 7;   B= 7;   carry_in=1;
        #50; Opcode=3'b000; A= 7;   B= 0;   carry_in=0;
end
endmodule