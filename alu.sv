`define ADD 3'b000
`define SUB 3'b001
`define SLL 3'b010
`define SRL 3'b011
`define SRA 3'b100
`define OR  3'b101
`define AND 3'b110
`define XOR 3'b111

module alu (
  input logic [31:0] in1, in2,
  input logic [2:0] func,
  output logic [31:0] out,
  output logic z_flag
);

assign z_flag = (out == 0) ? 1 : 0;

always @(in1, in2) begin
  case (func)
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