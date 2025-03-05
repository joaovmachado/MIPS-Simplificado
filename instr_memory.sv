module instr_memory #(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32 
)(
  input wire clk,
  input logic [ADDR_WIDTH-1 : 0] Read_address,
  output logic [DATA_WIDTH-1 : 0] Instruction
);

  logic [DATA_WIDTH-1 : 0] mem [0 : 2**ADDR_WIDTH - 1];

  // Lógica Sequencial de atribuição das saídas
  always_ff @(posedge clk) begin // reset não implementado
    Instruction <= mem[Read_address];
  end

endmodule