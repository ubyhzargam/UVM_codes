`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path, uvm_component parent);
    super.new(path, parent);
  endfunction
  
  task run();
    `uvm_info("DRV1","DRIVER INFO",UVM_MEDIUM);
    `uvm_fatal("DRV2","DRIVER FATAL");
     #10;
    `uvm_fatal("DRV3","DRIVER FATAL");
  endtask
  
endclass


class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  function new(string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  task run();
    `uvm_info("ENV1","ENVIRONMENT INFO",UVM_MEDIUM);
    `uvm_error("ENV2","ENVIRONMENT ERROR");
  endtask
  
endclass


module tb;
  
  driver drv;
  monitor mon;
  
  initial
    begin
      drv=new("DRV",null);
      mon=new("MON",null);
      drv.set_report_severity_id_override(UVM_FATAL,"DRV2",UVM_WARNING);
      fork
        drv.run();
        mon.run();
      join
    end
endmodule
