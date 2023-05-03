
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8a4 is
    Port ( 
        IA : in std_logic_vector(3 downto 0);
        IB : in std_logic_vector(3 downto 0);
        IC : in std_logic_vector(3 downto 0);
       

        IE: in std_logic_vector(3 downto 0);
        II: in std_logic_vector(3 downto 0);
        IG: in std_logic_vector(3 downto 0);
      

        S : in STD_LOGIC;
        Y0 : out std_logic_vector(3 downto 0);
        Y1 : out std_logic_vector(3 downto 0);
        Y2 : out std_logic_vector(3 downto 0)
        
    );
 end mux8a4;

architecture arch_mux81 of mux8a4 is
    begin
        
    Y0 <= IA WHEN S='0' 
    ELSE IE;
    
    Y1 <= IB WHEN S='0' 
    ELSE II;

    Y2 <= IC WHEN S='0' 
    ELSE IG;



end arch_mux81;