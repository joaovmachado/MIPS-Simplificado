module data_memory #(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32 
)(
  input wire clk,
  input logic [ADDR_WIDTH-1 : 0] Address,
  input logic [ADDR_WIDTH-1 : 0] Write_data,
  input wire MemWrite, // Controle de escrita
  input wire MemRead,  // Controle de leitura
  output logic [DATA_WIDTH-1 : 0] Read_data
);

  logic [DATA_WIDTH-1 : 0] mem [0 : 2**ADDR_WIDTH - 1];

  // Lógica Sequencial de atribuição das saídas
  always_ff @(negedge clk) begin // reset não implementado
    if (MemWrite) // Prioridade para escrita
      mem[Address] <= Write_data;
    else if (MemRead)
      Read_data <= mem[Address];
  end

endmodule