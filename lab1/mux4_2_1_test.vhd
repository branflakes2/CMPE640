library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity mux4_2_1_test is

end mux4_2_1_test;

architecture test of mux4_2_1_test is 

signal s_in1, s_in2, s_op   :   std_logic_vector(3 downto 0);
signal s_sel                :   std_logic;

component mux4_2_1
port(
    input1  :   in  std_logic_vector(3 downto 0);
    input2  :   in  std_logic_vector(3 downto 0);
    sel     :   in  std_logic;
    output  :   out std_logic_vector(3 downto 0));
end component mux4_2_1;

begin
    
    t_add4  :   mux4_2_1 port map (s_in1, s_in2, s_sel, s_op);

    process
    
        file infile                 :   text is in "input.txt";
        file outfile                :   text is out "out.txt";
        variable v_in1, v_in2, v_op :   std_logic_vector(3 downto 0);
        variable v_sel              :   std_logic;
        variable buf                :   line;

    begin

        while not (endfile(infile)) loop

            readline(infile, buf);
            read(buf, v_in1);
            readline(infile, buf);
            read(buf, v_in2);
            readline(infile, buf);
            read(buf, v_sel);
            s_in1 <= v_in1;
            s_in2 <= v_in2;
            s_sel    <= v_sel;
            wait for 1 ns;
            v_op    := s_op;

            write(buf, v_op);
            writeline(outfile, buf);
        end loop;
        wait;
    end process;
end test;
