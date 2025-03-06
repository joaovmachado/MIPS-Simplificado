module instr_memory_tb;

  // Parâmetros do módulo
  parameter ADDR_WIDTH = 32;
  parameter DATA_WIDTH = 32;

  // Sinais de entrada/saída
  logic [ADDR_WIDTH-1 : 0] Read_address;
  logic [DATA_WIDTH-1 : 0] Instruction;

  // Instância do módulo a ser testado
  instr_memory #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) uut (
    .Read_address(Read_address),
    .Instruction(Instruction)
  );

  // // Geração do clock
  // initial begin
  //   clk = 0;
  //   forever #5 clk = ~clk; // Clock com período de 10 unidades de tempo
  // end

  // Inicialização do arquivo VCD
  // initial begin
  //   $dumpfile("../instr_memory_tb.vcd"); // Nome do arquivo VCD
  //   $dumpvars(0, instr_memory_tb);    // Salva todas as variáveis do testbench
  // end

  // Teste: Listar todo o conteúdo da memória
  initial begin
    // Aguarda a inicialização da memória
    #10;

    // Itera sobre todos os endereços da memória
    for (int i = 0; i < 32; i++) begin
      Read_address = i; // Define o endereço de leitura
      #10; // Aguarda um ciclo de clock para a leitura ser realizada
      $display("Addr: %h, Data: %h", Read_address, Instruction); // Exibe o conteúdo
    end

    // Finaliza a simulação
    $finish;
  end

endmodule