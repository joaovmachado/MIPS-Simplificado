`define ADD 4'b0010
`define SUB 4'b0110
`define SLL 4'b0000
`define SRL 4'b0011
`define SRA 4'b0100
`define OR  4'b0001
`define AND 4'b0101
`define XOR 4'b0111

module alu (
  input logic [31:0] in1, in2,
  input logic [2:0] Operation,
  output logic [31:0] out,
  output logic z_flag
);

assign z_flag = (out == 0) ? 1 : 0;

always @(in1, in2) begin
  case (Operation)
    `ADD: out = in1 + in2;
    `SUB: out = in1 + ~in2 +1;
    `SLL: out = in1 << in2;
    `SRL: out = in1 >> in2;
    `SRA: out = in1 >>> in2;
    `OR:  out = in1 | in2;
    `AND: out = in1 & in2;
    `XOR: out = in1 ^ in2;
  endcase
end
endmodule