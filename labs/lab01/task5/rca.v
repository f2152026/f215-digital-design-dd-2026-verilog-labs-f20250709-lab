// rca.v
// Identical structure to Task 2's ripple_adder -- reuse your wiring
// pattern directly.
//
// Required file: copy your completed FA_Gate.v from Task 2 (the version
// with delays already added, from part (a) or (b)) into this folder.
// No separate "delay" variant is needed -- Task 2's FA_Gate already has
// delays built in, and every gate/module from here on should too.
//
// TODO: instantiate four FA_Gate instances, same chaining pattern as
// Task 2 (FA0..FA3, carry chain c1,c2,c3).

module rca64(

  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout

);

  wire [64:0] c;

  assign c[0] = cin;

  genvar i;

  generate
    for (i = 0; i < 64; i = i + 1) begin : gen_fa

      FA_Gate FA (
        .a(a[i]),
        .b(b[i]),
        .cin(c[i]),
        .sum(sum[i]),
        .cout(c[i+1])
      );

    end
  endgenerate

  assign cout = c[64];

endmodule