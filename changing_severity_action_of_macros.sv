`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path, uvm_component parent);
    super.new(path, parent);
  endfunction
  
  task run();
    `uvm_info("DRV1","HELLO",UVM_NONE);
  endtask
  
endclass

module tb;
  
  driver drv;
  
  initial
    begin
      drv=new("DRV",null);
      drv.set_report_severity_action(UVM_INFO,UVM_NO_ACTION);
      drv.run();
    end
  
endmodule
