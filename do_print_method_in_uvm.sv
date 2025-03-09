`include "uvm_macros.svh"
import uvm_pkg::*;

class obj extends uvm_object;
  `uvm_object_utils(obj)
  
  function new(string path="obj");
    super.new(path);
  endfunction
  
  bit [4:0] a=5;
  string s="Uby H";
  real c=3.1415;
  
  virtual function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field_int("a",a,$bits(a),UVM_DEC);
    printer.print_string("s",s);
    printer.print_real("c",c);
  endfunction
endclass

module tb;
  obj o;
  initial begin
  o=obj::type_id::create("o");
  o.print();
  end
endmodule
