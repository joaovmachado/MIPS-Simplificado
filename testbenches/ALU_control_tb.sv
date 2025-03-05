module ALU_control_tb;

logic ALUOp1;
logic ALUOp0;
logic [5:0] funct;
logic [3:0] Operation;

ALU_control ALU_control_inst0 (.*);

logic [7:0] input_WR;

assign {ALUOp1, ALUOp0, funct} = input_WR;

// Executa impulsos sequencialmente e finaliza tb
initial begin
  // Atualiza sinal de entrada e verifica saída
  $display("\n%-6s | %-9s\n", "Input", "Output");

  input_WR = 8'bxx_xxx_xxx; // Ciclo inicial de estabilização
  #2 $display("%8b | %4b", input_WR, Operation);

  input_WR = 8'b00_xxx_xxx; // Instrução LW
  #2 $display("%8b | %4b", input_WR, Operation);

  input_WR = 8'b00_xxx_xxx; // Instrução SW
  #2 $display("%8b | %4b", input_WR, Operation);

  input_WR = 8'b01_xxx_xxx; // Instrução Branch Equal
  #2 $display("%8b | %4b", input_WR, Operation);

  input_WR = 8'b10_100_000; // Instrução R-type add
  #2 $display("%8b | %4b", input_WR, Operation);

  input_WR = 8'b10_100_010; // Instrução R-type sub
  #2 $display("%8b | %4b", input_WR, Operation);
end

endmodule