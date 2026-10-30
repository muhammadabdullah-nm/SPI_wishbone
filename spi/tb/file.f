// 64 bit option for AWS labs
-64

-uvmhome /home/cc/mnt/XCELIUM2309/tools/methodology/UVM/CDNS-1.1d

// include directories

// include directory for sv files
-incdir ../sv 
//*** add incdir include directories here

// compile files
//*** add compile files here
// compile YAPP package
../sv/spi_pkg.sv 
../sv/spi_if.sv

// compile top level module
top.sv 
spi_no_dut.sv

-timescale 1ns/1ns
+SVSEED=random
+UVM_VERBOSITY=UVM_HIGH
+UVM_TESTNAME=base_test



