library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity weird_mux is
    port(
        B       :   in  std_logic_vector(3 downto 0);
        s0, s1  :   in  std_logic;
        oput    :   out std_logic_vector(3 downto 0)
    );
end weird_mux;

architecture structural of weird_mux is

    signal s_xor    :   std_logic;
    signal mux_out  :   std_logic_vector(3 downto 0);
    signal nmux_out :   std_logic_vector(3 downto 0);

    constant gnd_4  :   std_logic_vector(3 downto 0) := ('0', '0', '0', '0');

    component mux4_2_1
        port(
            input1  :   in  std_logic_vector(3 downto 0);
            input2  :   in  std_logic_vector(3 downto 0);
            sel     :   in  std_logic;
            output  :   out std_logic_vector(3 downto 0)
        );
    end component;

    component inverter
        port(
            input   :   in  std_logic;
            output  :   out std_logic
        );
    end component;

    component xor2
        port(
            in1     :   in  std_logic;
            in2     :   in  std_logic;
            out1    :   out std_logic
        );
    end component;

begin
    
    xor1    :   xor2        port map(s0, s1, s_xor);    
    mux1    :   mux4_2_1    port map(gnd_4, B, s_xor, mux_out);
    
    inverters:   
    for I in 0 to 3 generate 
        inv :   inverter    port map(mux_out(I), nmux_out(I));
    end generate;

    mux2    :   mux4_2_1    port map(mux_out, nmux_out, s1, oput);

end architecture structural; 
        
