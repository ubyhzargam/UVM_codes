// Simple System verilog code to use UVM field macros 

`include "uvm_macros.svh"
import uvm_pkg::*;

class obj extends uvm_object;
  
  function new(string path="obj");
    
super.new(path);
  
endfunction
  
rand bit [3:0] a;
  
  `uvm_object_utils_begin(obj)
  `uvm_field_int(a,UVM_DEFAULT);
  `uvm_object_utils_end
  
endclass
  
module tb;
  
obj o;
  
initial
begin

  o=new("obj");
  o.randomize();
  o.print();
  
end
endmodule
