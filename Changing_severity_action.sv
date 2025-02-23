// This code changes the default severity action of UVM_Warning and makes the simulation end once 4 warnings have occured

`include "uvm_macros.svh"
import uvm_pkg::*;

class a extends uvm_component;
  
`uvm_component_utils(a)
  
function new(string path, uvm_component parent);
super.new(path,parent);
  
endfunction
  
task run();

`uvm_warning("a", "Warning 1");
#10;
`uvm_warning("a", "Warning 2");
#10;
`uvm_warning("a", "Warning 3");
#10;
`uvm_warning("a", "Warning 4");

endtask
endclass

module tb;

a a1;

initial 
begin
a1=new("TOP",null);
a1.set_report_severity_action(UVM_WARNING, UVM_DISPLAY | UVM_COUNT );
a1.set_report_max_quit_count(4);
a1.run();

end
endmodule
