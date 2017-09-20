FLAGS=--ieee=synopsys
TOPFILE=inverter_test
all: inverter.o inverter_test.o
	ghdl -e ${FLAGS} ${TOPFILE}
inverter_test.o: inverter_test.vhdl inverter.vhdl inverter.o
	ghdl -a ${FLAGS} inverter_test.vhdl
inverter.o: inverter.vhdl
	ghdl -a ${FLAGS} inverter.vhdl
clean:
	rm -rf *.txt *.o inverter inverter_test *.cf *.vcd
