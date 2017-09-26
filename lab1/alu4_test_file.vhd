library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity alu4_test_file is

end alu4_test_file;

architecture test of alu4_test_file is

    signal s_A, s_B, s_G                :   std_logic_vector(3 downto 0);
    signal s_Cin, s_S0, s_S1, s_Cout    :   std_logic;

    component alu_4 is
        port(
            A       :   in  std_logic_vector(3 downto 0);
            B       :   in  std_logic_vector(3 downto 0);
            Cin     :   in  std_logic;
            S0      :   in  std_logic;
            S1      :   in  std_logic;
            G       :   out std_logic_vector(3 downto 0);
            Cout    :   out std_logic
        );
    end component;

begin
    
    alu :   alu_4 port map(s_A, s_B, s_Cin, s_S0, s_S1, s_G, s_Cout);

    t   :   process

        file infile                         :   text is in "input.txt";
        file outfile                        :   text is out "out.txt";
        variable v_A, v_B, v_G              :   std_logic_vector(3 downto 0);
        variable v_Cin, v_S0, v_S1, v_Cout  :   std_logic;
        variable buf                        :   line; 

    begin

        while not (endfile(infile)) loop
    
            readline(infile, buf);
            read(buf, v_A);
            readline(infile, buf);
            read(buf, v_B);
            readline(infile, buf);
            read(buf, v_S0);
            read(buf, v_S1);
            readline(infile, buf);
            read(buf, v_Cin);

            s_A <= v_A;
            s_B <= v_B;
            s_S0 <= v_S0;
            s_S1 <= v_S1;
            s_Cin <= v_Cin;

            wait for 1 fs;

            v_G := s_G;
            v_Cout := s_Cout;

            write(buf, v_G);
            writeline(outfile, buf);
            write(buf, v_Cout);
            writeline(outfile, buf);
        end loop;
        wait;
    end process;
end test;    
