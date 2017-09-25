library STD;
library IEEE;
use IEEE.std_logic_1164.all;

--0 for input1
--1 for input2

entity mux4_2_1 is

port(
    input1  :   in  std_logic_vector(3 downto 0);
    input2  :   in  std_logic_vector(3 downto 0);
    sel     :   in  std_logic;
    output  :   out std_logic_vector(3 downto 0));
end mux4_2_1;

architecture structural of mux4_2_1 is

    signal nsel     :   std_logic;
    signal output1  :   std_logic_vector(3 downto 0);
    signal output2  :   std_logic_vector(3 downto 0);

    component and2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic);
    end component;

    component inverter
    port(
        input   :   in  std_logic;
        output  :   out std_logic);
    end component;
    
    component or2
    port(
        in1     :   in  std_logic;
        in2     :   in  std_logic;
        out1    :   out std_logic);
    end component;

begin

    inverter1   :   inverter port map (sel, nsel); 

    gen1    :   for I in 0 to 3 generate
        and2_1   :   and2 port map(input1(I), nsel, output1(I));
        and2_2   :   and2 port map(input2(I), sel, output2(I));
        or2_1       :   or2 port map(output1(I), output2(I), output(I));
    end generate gen1;

end architecture structural;
