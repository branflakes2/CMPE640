library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity alu_4 is
    port(
        A       :   in  std_logic_vector(3 downto 0);
        B       :   in  std_logic_vector(3 downto 0);
        Cin     :   in  std_logic;
        S0      :   in  std_logic;
        S1      :   in  std_logic;
        G       :   out std_logic_vector(3 downto 0);
        Cout    :   out std_logic
    );
end alu_4;

architecture structural of alu_4 is

    signal wm_out   :   std_logic_vector(3 downto 0);
    
    component weird_mux is
        port(
            B       :   in  std_logic_vector(3 downto 0);
            s0, s1  :   in  std_logic;
            oput    :   out std_logic_vector(3 downto 0)
        );
    end component;

    component adder4 is
        port(
            input1  :   in  std_logic_vector(3 downto 0);
            input2  :   in  std_logic_vector(3 downto 0);
            cin     :   in  std_logic;
            sum     :   out std_logic_vector(3 downto 0);
            cout    :   out std_logic
        );
    end component;

begin
    
    mux     :   weird_mux   port map(B, S0, S1, wm_out);
    adder   :   adder4      port map(A, wm_out, Cin, G, Cout);

end structural;
