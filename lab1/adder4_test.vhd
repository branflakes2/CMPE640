library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity adder4_test is

end adder4_test;

architecture test of adder4_test is 

component adder4
port(
    input1  :   in  std_logic_vector(3 downto 0);
    input2  :   in  std_logic_vector(3 downto 0);
    cin     :   in  std_logic;
    sum     :   out std_logic_vector(3 downto 0);
    cout    :   out std_logic);
end component adder4;

for t_add4  :   adder4 use entity work.adder4(structural);

signal s_input1, s_input2, s_sum    :   std_logic_vector(3 downto 0);
signal s_cin, s_cout                :   std_logic;

begin
    
    t_add4  :   adder4 port map (s_input1, s_input2, s_cin, s_sum, s_cout);

    process
    
        file infile                         :   text is in "input.txt";
        file outfile                        :   text is out "out.txt";
        variable v_input1, v_input2, v_sum  :   std_logic_vector(3 downto 0);
        variable v_cin, v_cout              :   std_logic;
        variable buf                        :   line;

    begin

        while not (endfile(infile)) loop

            readline(infile, buf);
            read(buf, v_input1);
            readline(infile, buf);
            read(buf, v_input2);
            readline(infile, buf);
            read(buf, v_cin);
            s_input1 <= v_input1;
            s_input2 <= v_input2;
            s_cin    <= v_cin;
            wait for 1 ns;
            v_sum    := s_sum;
            v_cout   := s_cout;

            write(buf, v_sum);
            writeline(outfile, buf);
            write(buf, v_cout);
            writeline(outfile, buf); 
        end loop;
        wait;
    end process;
end test;
