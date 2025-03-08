`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  task run();
    `uvm_fatal("DRV","FATAL ISSUE");
  endtask
  
endclass


module tb;
  driver drv;
  
  initial
    begin
      drv=new("DRV",null);
      drv.set_report_severity_action(UVM_FATAL,UVM_ERROR);
      drv.run();
      #10;
      $finish;
    end
endmodule
