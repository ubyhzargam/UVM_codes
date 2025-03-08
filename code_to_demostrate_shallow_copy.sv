`include "uvm_macros.svh"
import uvm_pkg::*;

class first extends uvm_object;
  
  randc bit [3:0] a;
  
  function new(string path="first");
    super.new(path);
  endfunction
  
  `uvm_object_utils_begin(first)
  `uvm_field_int(a,UVM_DEFAULT | UVM_DEC);
  `uvm_object_utils_end
  
endclass


class second extends uvm_object;
  
  first f;
  
  function new(string path="second");
    super.new(path);
    f=new("first");
  endfunction
  
  `uvm_object_utils_begin(second)
  `uvm_field_object(f,UVM_DEFAULT | UVM_DEC);
  `uvm_object_utils_end
  
endclass


module tb;
  
  second s1,s2;
  
  initial
    begin
      s1=new("s1");
      s2=new("s2");
      s1.f.randomize();
      s1.print();
      s2=s1;
      s2.print();
      s2.f.a=10;
      s2.print();
      s1.print();
    end
endmodule
      
      
