// Modify the code below no more than necessary to meet the following requirements. 
// Except for the changes specified, none of the rest of the functionality of 
// the design should change. The formatting should 
// 
// Modify the code so that the counter can count up to 72. Don't use any more bits 
// than necessary for c_out, nxt_c, and rollover_val. 
// 
// Correct any obvious errors or bad coding style in the such as inferred latches or  
// misuse of blocking/non-blocking assignments
// 
// Add an input "incr_val[2:0]" that specifies an increment value for the counter.  
// I.e., whenever the count increments, it will increment by the specified value. 
// Depending on the value of incr_val, the count might never equal rollover_val. 
// Instead, have it rollover when count is greater than or equal to rollover_val. 
// 
// Add an output "sqwave" that is 0 when count is less than rollover_val divided by 2, 
// and 1 otherwise. The output logic must use a separate always_comb block.  
// 
// Add an output "err" that outputs a 1 if there are any input values that
// make the counter or the output values useful. For example, rolloval_val=0
// would not allow the counter to ever increment. Other rollover values the
// additional output to never work. 
// 
 

module exam_counter( 
    input logic clk,
    input logic n_rst,
    input logic clear,
    input logic count_enable,
    input logic [3:0]rollover_val,
    input logic [2:0] incr_val, //new requirement
    output logic [3:0]c_out,
    output logic sqwave
);

logic [3:0]nxt_c;

always_ff @ (posedge clk, negedge n_rst)
  begin
    if(n_rst == 0) begin
      c_out <= 0;
    end
    else  begin
      c_out <= nxt_c;
    end
  end

always_comb
  begin 
    if(clear == 1) begin
      nxt_c = 0;
    end else if(count_enable == 1)
    begin
      if(c_out == rollover_val) begin
        nxt_c = 0;
      end else begin
        nxt_c = c_out + 1;
      end
    end
  end

endmodule
