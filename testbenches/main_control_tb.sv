module main_control_tb;

logic [5:0] Op;
logic RegDst;
logic ALUSrc;
logic MemtoReg;
logic RegWrite;
logic MemRead;
logic MemWrite;
logic Branch;
logic ALUOp1;
logic ALUOp0;

logic [8:0] Control_WR;

assign Control_WR = { RegDst, ALUSrc, MemtoReg, RegWrite,
                             MemRead, MemWrite, Branch, ALUOp1, ALUOp0};

main_control main_control_inst0 (.*);

// Executa impulsos sequencialmente e finaliza tb
initial begin
  // Atualiza sinal de entrada e verifica saída
  $display("\n%-6s | %-9s\n", "Input", "Output");

  Op = 6'bxxx_xxx; // Ciclo inicial de estabilização
  #2 $display("%6b | %9b", Op, Control_WR);

  Op = 6'b000_000; // R-format
  #2 $display("%6b | %9b", Op, Control_WR);

  Op = 6'b100_011; // lw instr
  #2 $display("%6b | %9b", Op, Control_WR);

  Op = 6'b101_011; // sw instr
  #2 $display("%6b | %9b", Op, Control_WR);

  Op = 6'b000_100; // beq instr
  #2 $display("%6b | %9b", Op, Control_WR);
end

endmodule