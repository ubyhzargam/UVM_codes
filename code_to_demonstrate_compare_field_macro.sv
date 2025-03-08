`include "uvm_macros.svh"
import uvm_pkg::*;

class first extends uvm_object;
  
  function new(string path="first");
    super.new(path);
  endfunction
  
  rand bit [2:0] data;
  
  `uvm_object_utils_begin(first)
  `uvm_field_int(data,UVM_DEFAULT|UVM_DEC);
  `uvm_object_utils_end
  
endclass


module tb;
  
  first f1,f2;
  int status;
  
  initial
    begin
      f1=new("f1");
      f2=new("f2");
      repeat(20)
        begin
          f1.randomize();
          f2.randomize();
          status=f1.compare(f2);
          $display(status);
        end
    end
endmodule
