module monociclo_top(
  input logic clk,
  input logic rstn
);

main_control control (.Op(Instruction[31:26]));

datapath dp (
  .clk(clk),
  .rstn(rstn), 
  .wr_en(),
  .rd_addr1(Instruction[25:21]), 
  .rd_addr2(Instruction[20:16]),
  .wr_addr(RegDst_mux),
  .wr_data(MemtoReg_mux),
  .sig_ext_in(),
  .sig_ext_out(),
  .rd_data1(), 
  .rd_data2()
);

instr_memory i_mem (
  .clk(),
  .Read_address(),
  .Instruction()
);
data_memory d_mem (.*);

endmodule