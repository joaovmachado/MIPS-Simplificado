module datapath(
  input logic clk, rstn,
  input logic wr_en,
  input logic [4:0] rd_addr1, rd_addr2,
  input logic [4:0] wr_addr,
  input logic [31:0] wr_data,
  output logic [31:0] rd_data1, rd_data2

  // Controle
  input logic RegDst, ALUSrc, Brench, MemtoReg, RegWrite,
  input logic [3:0] ALU_op

  // Memória de Instrução

  // Memória de dados
  input logic [31:0] dmem_data;
);

logic [11:0] PC;
logic [25:0] Instruction;


// Sinais internos
logic [31:0] alu_out;
logic [31:0] sig_ext_out;
logic [15:0] sig_ext_in;

// Definição dos registradores e somadores
logic PC_adder;
logic Branch_adder;

// Definição dos multiplexadores
logic [4:0] RegDst_mux;
logic [31:0] ALUSrc_mux;
logic [11:0] Branch_mux;
logic [31:0] MemtoReg_mux;

assign PC_adder = PC + 4;
assign Branch_adder = PC_adder + sig_ext_out;


assign RegDst_mux = (RegDst) ? Instruction[15:11] : Instruction[20:16];
assign ALUSrc_mux = (ALUSrc) ? sig_ext_out : rd_data2;
assign Branch_mux = (Brench) ? Branch_adder : PC_adder;
assign MemtoReg_mux = (MemtoReg) ? dmem_data : alu_out;

// Atribuição dos circuitos sequenciais
always @(posedge clk or negedge rstn) begin
  if (!rstn) begin
    PC <= 0;
  end else begin
    PC <= Branch_mux;
  end
end

instr_memory im (
  .Read_address(PC),
  .Instruction()
)

registerFile registerFile (
  .clk(clk),
  .rstn(rstn),
  .wr_en(RegWrite),
  .rd_addr1(Instruction[25:21]),
  .rd_addr2(Instruction[20:16]),
  .wr_addr(RegDst_mux),
  .wr_data(MemtoReg_mux),
  .rd_data1(rd_data1),
  .rd_data2(rd_data2)
);

signalExtension sig_ext (
  .in(Instruction[15:0]),
  .out(sig_ext_out)
);

alu alu (
  .in1(rd_data1), 
  .in2(ALUSrc_mux),
  .Operation(ALU_op),
  .out(alu_out),
  .z_flag(alu_z)
);

data_memory dm (
  .clkn(clk),
  .Address(),
  .Write_data(),
  .MemWrite(),
  .MemRead(),
  .Read_data()

)
endmodule