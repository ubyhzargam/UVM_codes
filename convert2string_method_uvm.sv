// Simple code to demonstrate the creation of user defined methods.

`include "uvm_macros.svh"
import uvm_pkg::*;

class obj extends uvm_object();
  `uvm_object_utils(obj)
  
  function new(string path="obj");
    super.new(path);
  endfunction
    
    string a="Uby H";
    real b=1.234;
    integer c=45;
    
    virtual function string convert2string();
      string s=super.convert2string();
      s={s,$sformatf("a = %0s",a)};
      s={s,$sformatf("b = %0f",b)};
      s={s,$sformatf("c = %0d",c)};
      return s;
    endfunction
    endclass
    
    module tb;
      obj o;
      initial
        begin
          o=obj::type_id::create("o");
          $display("%0s",o.convert2string());
          
        end
    endmodule
