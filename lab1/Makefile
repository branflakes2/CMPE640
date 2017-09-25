FLAGS=--ieee=synopsys
all: basics adder1.o adder4.o adder_test.o
	ghdl -e ${FLAGS} adder4_test
adder_test.o:
	ghdl -a ${FLAGS} adder4_test.vhd
adder4.o: adder1.o basics
	ghdl -a ${FLAGS} adder4.vhd
adder1.o: basics
	ghdl -a ${FLAGS} adder1.vhd
basics: xor2.vhd and2.vhd or3.vhd
	ghdl -a ${FLAGS} xor2.vhd or3.vhd and2.vhd
