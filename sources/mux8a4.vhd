
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8a4 is
    Port ( 
        IA : in STD_LOGIC;
        IB : in STD_LOGIC;
        IC : in STD_LOGIC;
        ID : in STD_LOGIC;

        IE: in STD_LOGIC;
        II: in STD_LOGIC;
        IG: in STD_LOGIC;
        IH: in STD_LOGIC;

        S : in STD_LOGIC;
        Y0 : out STD_LOGIC;
        Y1 : out STD_LOGIC;
        Y2 : out STD_LOGIC;
        Y3 : out STD_LOGIC
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

    Y3 <= ID WHEN S='0' 
    ELSE IH;

end arch_mux81;