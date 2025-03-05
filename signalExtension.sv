module signalExtension (
  input logic [15:0] in,
  output logic [31:0] out
);

always_comb begin
  if (in[15] == 0)
    out = {{16'h0000}, in};
  else
    out = {{16'hFFFF}, in};
end

endmodule