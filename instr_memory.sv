module instr_memory (
  input logic [11:0] Read_address,
  output logic [31:0] Instruction
);

  localparam MEM_SIZE = 2**12 -1; // 4MB

  logic [7:0] mem [0 : MEM_SIZE];

  // Inicializa a memória com o conteúdo de um arquivo
  initial begin
    $readmemh("instr_mem.hex", mem, 0, 7); // Carrega o arquivo no intervalo [0, 7]
  end

  // Lógica Sequencial de atribuição das saídas
  always @(*) begin // reset não implementado
    Instruction <= {mem[Read_address+3], mem[Read_address+2], mem[Read_address+1], mem[Read_address]};
  end

endmodule