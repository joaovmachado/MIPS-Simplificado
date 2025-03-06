module instr_memory #(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32 
)(
  input wire clk,
  input logic [ADDR_WIDTH-1 : 0] Read_address,
  output logic [DATA_WIDTH-1 : 0] Instruction
);

  localparam MEM_SIZE = 2**12; // 4 kiB

  logic [DATA_WIDTH-1 : 0] mem [0 : MEM_SIZE];

  // Inicializa a memória com o conteúdo de um arquivo
  initial begin
    $readmemh("instr_mem.hex", mem, 0, 2); // Carrega o arquivo no intervalo [0, 2]
  end

  // Lógica Sequencial de atribuição das saídas
  always_ff @(posedge clk) begin // reset não implementado
    Instruction <= mem[Read_address];
  end

endmodule