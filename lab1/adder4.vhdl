library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity adder4 is

port(
    input1  : in    std_logic_vector(3 downto 0);
    input2  : in    std_logic_vector(3 downto 0);
    cin     : in    std_logic;
    sum     : out   std_logic_vector(3 downto 0);
    cout    : out   std_logic);
end adder4;

architecture structural of adder4 is

component adder1
port(
    input1  : in    std_logic;
    input2  : in    std_logic;
    cin     : in    std_logic;
    sum     : out   std_logic;
    cout    : out   std_logic);
end component;

for adder1_1, adder1_2, adder1_3, adder1_4: adder1 use entity work.adder1(structural);

signal carry1, carry2, carry3: std_logic;

begin

adder1_1: adder1 port map (input1(0), input2(0), cin, sum(0), carry1);
adder1_2: adder1 port map (input1(1), input2(1), carry1, sum(1), carry2);
adder1_3: adder1 port map (input1(2), input2(2), carry2, sum(2), carry3);
adder1_4: adder1 port map (input1(3), input2(3, carry3, sum(3), cout); 

end structural;
