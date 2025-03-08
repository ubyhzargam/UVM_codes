`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  task run();
    `uvm_info("DRV1","Driver executed",UVM_HIGH);
    `uvm_info("DRV2","Driver executed",UVM_HIGH);
  endtask
  
endclass

class environment extends uvm_env;
  `uvm_component_utils(environment)
  
  function new(string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  task run();
    `uvm_info("ENV1","Environment executed",UVM_HIGH);
    `uvm_info("ENV2","Environment executed",UVM_HIGH);
  endtask
endclass

module tb;
  
  driver drv;
  environment env;
  
  initial
    begin
      drv=new("DRV",null);
      env=new("ENV",null);
      env.set_report_verbosity_level(UVM_HIGH);
      drv.run();
      env.run();
    end
  
endmodule
