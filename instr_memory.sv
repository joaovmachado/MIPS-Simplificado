module instr_memory #(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32 
)(
  input logic [ADDR_WIDTH-1 : 0] Read_address,
  output logic [DATA_WIDTH-1 : 0] Instruction
);

  localparam MEM_SIZE = 2**5; // 32 B

  logic [DATA_WIDTH-1 : 0] mem [0 : MEM_SIZE];

  // Inicializa a memória com o conteúdo de um arquivo
  initial begin
    $readmemh("instr_mem.hex", mem, 0, 31); // Carrega o arquivo no intervalo [0, 31]
  end

  // Lógica Sequencial de atribuição das saídas
  always @(*) begin // reset não implementado
    Instruction <= mem[Read_address];
  end

endmodule