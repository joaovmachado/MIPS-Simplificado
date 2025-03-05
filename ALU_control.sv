module ALU_control (
  input  logic ALUOp0,
  input  logic ALUOp1,
  input  logic [5:0] funct,
  output logic [3:0] Operation  
);

// Lógica combinacional decodificadora
always_comb begin  
  casez ({ALUOp1, ALUOp0, funct})
    8'b00_zzz_zzz, // lw | sw | R-type add
    8'b1z_zz0_000:
      Operation = 4'b0010; // add

    8'bz1_zzz_zzz, // beq | R-type sub
    8'b10_zzz_zzz: 
      Operation = 4'b0110; // sub

    default:
      Operation = 4'b0000; // NOP
  endcase
end


endmodule