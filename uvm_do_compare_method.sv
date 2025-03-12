//simple code to deomonstrate do_compare method

`include "uvm_macros.svh"
import uvm_pkg::*;

class obj extends uvm_object();
  `uvm_object_utils(obj)
  
  function new(string path="obj");
    super.new(path);
  endfunction
  
  rand bit [3:0] a,b;
  
  virtual function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field_int("a",a,$bits(a),UVM_DEC);
    printer.print_field_int("b",b,$bits(b),UVM_DEC);
  endfunction
  
  virtual function void do_copy(uvm_object rhs);
    obj temp;
    $cast(temp,rhs);
    super.do_copy(rhs);
    this.a=temp.a;
    this.b=temp.b;
  endfunction
  
  virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    obj temp;
    int status;
    $cast(temp,rhs);
    status=super.do_compare(rhs,comparer)&&(a==temp.a)&&(b==temp.b);
    return status;
  endfunction
  
endclass

module tb;
  
  obj o1,o2;
  int status;
  
  initial 
    begin
      o1=obj::type_id::create("o1");
      o2=obj::type_id::create("o2");
      o1.randomize();
      o1.print();
      o2.copy(o1);
      o2.print();
      status=o2.compare(o1);
      `uvm_info("TB",$sformatf("status = %0d", status),UVM_NONE);
    end
endmodule
