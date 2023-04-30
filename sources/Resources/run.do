ghdl -i contador.vhd ./Test/testbench-CONT.vhd && ghdl -m testbench_CONT && ghdl -r testbench_CONT --vcd=./Dumps/CONT-dump.vcd

ghdl -i contador.vhd mux4a1.vhd main2.vhd ./Test/testbench-main.vhd && ghdl -m testbench_MAIN && ghdl -r testbench_MAIN --vcd=./Dumps/MAIN-dump.vcd