module registerFile (
  input clk, rstn, 
  input wr_en,       // RegWrite
  input [4:0] rd_addr1, rd_addr2,   // Read Register 1, 2
  input [4:0] wr_addr,              // Write Register
  input [31:0] wr_data,             // Write Data
  output [31:0] rd_data1, rd_data2  // Read Data 1, 2
);
  
  // 32 registradores de 32 bits
  logic [31:0] register [31:0];

  // Lógica combinacional de atribuição das saídas
  assign rd_data1 = register[rd_addr1];
  assign rd_data2 = register[rd_addr2];

  
  // Lógica sequencial de escrita nos registradores
  always @(posedge clk) begin
    if (rstn == 0) begin
      for (int i = 0; i < 32; i++) begin
        register[i] = 0;
      end 
    end else begin
      register[wr_addr] <= (wr_en) ? wr_data : register[wr_addr];
    end

  end

endmodule