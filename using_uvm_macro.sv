// Simple code to demonstrate use of uvm macros 

`include "uvm_macros.svh"
import uvm_pkg::*;

module tb;
  
  initial
  `uvm_info("TB_TOP","Uby here",UVM_LOW);
  
endmodule
