module main_control (
  input  logic [5:0] Op,
  output logic RegDst,
  output logic ALUSrc,
  output logic MemtoReg,
  output logic RegWrite,
  output logic MemRead,
  output logic MemWrite,
  output logic Branch,
  output logic ALUOp1,
  output logic ALUOp0
);

// Lógica combinacional decodificadora
always_comb begin
  RegDst = 0;
  ALUSrc = 0;
  MemtoReg = 0;
  RegWrite = 0;
  MemRead = 0;
  MemWrite = 0;
  Branch = 0;
  ALUOp1 = 0;
  ALUOp0 = 0;  
  
  case (Op)
    // __R-format__
    6'b000_000: begin
      RegDst = 1;
      RegWrite = 1;
      ALUOp1 = 1;
    end

    // __Operação lw__
    6'b100_011: begin
      ALUSrc = 1;
      MemtoReg = 1;
      RegWrite = 1;
      MemRead = 1;
    end

    // __Operação sw__
    6'b101_011: begin
      RegDst = 1'bx; // don't care
      ALUSrc = 1;
      MemtoReg  = 1'bx;
      MemWrite = 1;
    end
    
    // __Operação beq__
    6'b000_100: begin 
      RegDst = 1'bx; // don't care
      MemtoReg  = 1'bx;
      Branch = 1;
      ALUOp0 = 1;
    end
  endcase
end

endmodule