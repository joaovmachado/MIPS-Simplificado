module datapath(
  input logic clk, rstn, 
  input logic wr_en,       // RegWrite
  input logic [4:0] rd_addr1, rd_addr2,   // Read Register 1, 2
  input logic [4:0] wr_addr,              // Write Register
  input logic [31:0] wr_data,             // Write Data
  input logic [15:0] sig_ext_in,
  output logic [31:0] sig_ext_out,
  output logic [31:0] rd_data1, rd_data2  // Read Data 1, 2
);

logic [31:0] Instruction;
logic [31:0] PC;

logic ALUSrc_mux;
logic RegDst_mux;
logic Branch_mux;

logic PC_adder;
logic Branch_adder;

assign PC_adder = PC + 4;
assign Branch_adder = PC_adder + sig_ext_out;

always @(posedge clk or negedge rstn) begin
  if (!rstn) begin
    PC <= 0;
  end else begin
    PC <= Branch_mux;
  end
end

registerFile registerFile (
  .clk(clk),
  .rstn(rstn),
  .wr_en(wr_en),
  .rd_addr1(rd_addr1),
  .rd_addr2(rd_addr2),
  .wr_addr(wr_addr),
  .wr_data(wr_data),
  .rd_data1(rd_data1),
  .rd_data2(rd_data2)
);

signalExtension signalExtension (
  .in(sig_ext_in),
  .out(sig_ext_out)
);

alu alu (
  .in1(rd_data1), 
  .in2(ALUSrc_mux),
  .func(),
  .out(),
  .z_flag()
)

endmodule;