
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4a1 is
    Port ( 
        IA : in STD_LOGIC;
        IB : in STD_LOGIC;
        IC : in STD_LOGIC;
        ID : in STD_LOGIC;
        S : in STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC
    );
 end mux4a1;

architecture arch_mux41 of mux4a1 is
    begin
        
    Y <= IA WHEN S="00" 
    ELSE IB WHEN S="01" 
    ELSE IC WHEN S="10" 
    ELSE ID; 

end arch_mux41;