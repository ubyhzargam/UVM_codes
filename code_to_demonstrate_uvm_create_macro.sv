`include "uvm_macros.svh"
import uvm_pkg::*;

class first extends uvm_object;
  
  randc bit [1:0] data;
  
  function new(string path="first");
    super.new(path);
  endfunction
  
  `uvm_object_utils_begin(first)
  `uvm_field_int(data,UVM_DEFAULT|UVM_BIN);
  `uvm_object_utils_end
  
endclass


module tb;
  
  first f;
  
  initial
    begin
      f=first::type_id::create("f");
      f.randomize();
      f.print();
    end
endmodule
