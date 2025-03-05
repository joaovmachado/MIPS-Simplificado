module monociclo_top;

logic Instruction [31:0];

main_control control (.Op(Instruction[31:26]));
datapath dp ();
instr_memory instr_memory (.*);
data_memory data_memory (.*);

endmodule