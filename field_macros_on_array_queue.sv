// Example code on using UVM field macros on static arrays, dynamic arrays and queues

`include "uvm_macros.svh"
import uvm_pkg::*;

class obj extends uvm_object;
  int arr1[3]={1,2,3};
  int arr2[];
  int arr3[$];
  
  function new(string path="obj");
    super.new(path);
  endfunction
  
  `uvm_object_utils_begin(obj)
  `uvm_field_sarray_int(arr1,UVM_DEFAULT);
  `uvm_field_array_int(arr2,UVM_DEFAULT);
  `uvm_field_queue_int(arr3,UVM_DEFAULT);
  `uvm_object_utils_end
  
  task run();
    arr2=new[2];
    arr2[0]=1;
    arr2[1]=2;
    
    arr3.push_front(1);
    arr3.push_back(2);
    
  endtask
  
endclass

module tb;
  obj o;
  
  initial begin
    o=new("obj");
    o.run();
    o.print(uvm_default_tree_printer);
  end
  
endmodule
