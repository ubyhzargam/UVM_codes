`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  task run();
    `uvm_info("DRV1","HELLO",UVM_NONE);
    `uvm_info("DRV2","HELLO",UVM_NONE);
    `uvm_info("DRV3","HELLO",UVM_NONE);
    `uvm_info("DRV4","HELLO",UVM_NONE);
    `uvm_info("DRV5","HELLO",UVM_NONE);
    `uvm_info("DRV6","HELLO",UVM_NONE);
  endtask
  
endclass


module tb;
  driver drv;
  
  initial
    begin
      drv=new("DRV",null);
      drv.set_report_max_quit_count(2);
      drv.set_report_severity_action(UVM_INFO, UVM_DISPLAY | UVM_COUNT);
      drv.run();
    end
endmodule
