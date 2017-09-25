FLAGS=--ieee=synopsys
CLEAN=*.o *.cf *.swo *.swp adder4_test mux4_2_1_test
all: basics adder1.o adder4.o adder_test.o alu_4.o alu4_test_cmd.o
	ghdl -e ${FLAGS} adder4_test
	ghdl -e ${FLAGS} alu4_test_cmd
alu4_test_cmd.o: alu_4.o
	ghdl -a ${FLAGS} alu4_test_cmd.vhd
adder_test.o: adder4.o
	ghdl -a ${FLAGS} adder4_test.vhd
alu_4.o: adder4.o weird_mux.o
	ghdl -a ${FLAGS} alu_4.vhd
adder4.o: adder1.o basics
	ghdl -a ${FLAGS} adder4.vhd
weird_mux.o: mux4_2_1.o
	ghdl -a ${FLAGS} weird_mux.vhd
mux4_2_1.o: basics
	ghdl -a ${FLAGS} mux4_2_1.vhd
adder1.o: basics
	ghdl -a ${FLAGS} adder1.vhd
basics: xor2.vhd and2.vhd or3.vhd or2.vhd inverter.vhd
	ghdl -a ${FLAGS} xor2.vhd or3.vhd and2.vhd or2.vhd inverter.vhd
clean:	
	rm -rf ${CLEAN}
