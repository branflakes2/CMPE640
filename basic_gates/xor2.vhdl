library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity xor2 is 

port (
    in1     : in    std_logic;
    in2     : in    std_logic;
    out1    : out   std_logic);
end xor2;

architecture structural of xor2 is

begin

    output <= in1 xor in2;

end structural;
