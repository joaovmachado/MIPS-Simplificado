module monociclo_top(
  input logic clk,
  input logic rstn
);

main_control control (
  
));

datapath dp (
  .clk(),
  .rstn(), 
  .wr_en(),
  .rd_addr1(), 
  .rd_addr2(),
  .wr_addr(),
  .wr_data(),
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
data_memory d_mem (
  .clk(),
  .Address(),
  .Write_data(),
  .MemWrite(),
  .MemRead(),
  .Read_data()
);

endmodule