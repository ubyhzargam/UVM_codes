`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  task run();
    `uvm_info("DRV1", "DRIVER INFO", UVM_NONE);
    `uvm_info("DRV2", "DRIVER INFO", UVM_NONE);
    `uvm_info("DRV3", "DRIVER INFO", UVM_NONE);
    `uvm_info("DRV4", "DRIVER INFO", UVM_NONE);
    `uvm_warning("DRV5","DRIVER WARNING");
    `uvm_error("DRV6","DRIVER ERROR");
  endtask
  
endclass


module tb;
  
  driver drv;
  int file,file1;
  
  initial
    begin
      drv=new("DRV",null);
      file=$fopen("log.txt","w");
      file1=$fopen("log1.txt","w");
      drv.set_report_severity_file(UVM_INFO,file);
      drv.set_report_default_file(file1);
      drv.set_report_severity_action(UVM_INFO,UVM_DISPLAY | UVM_LOG);
      drv.set_report_severity_action(UVM_WARNING,UVM_DISPLAY | UVM_LOG);
      drv.set_report_severity_action(UVM_ERROR,UVM_DISPLAY | UVM_LOG);
      drv.run();
      #10;
      $fclose(file);
      $fclose(file1);
    end
endmodule
