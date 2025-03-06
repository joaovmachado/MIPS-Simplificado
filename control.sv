module control(
  input logic [31:0] Instruction,
  output logic [31:0] Control_Word
);

ALU_control ALU_control (.ALU_OP({Instruction[7], Instruction[6]}));
main_control main_control(Instruction[5:0]);
ula ula(.*);

endmodule