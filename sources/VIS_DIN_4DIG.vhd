----------------------------------------------------------------------------------
-- VISUALIZACION DINÁMICA DE 4 DIGITOS HEXADECIMALES
----------------------------------------------------------------------------------
-- DANILO GARCIA H.--
--       ECI       --
--------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VIS_DIN_4DIG is

    Port( CLK: IN STD_LOGIC;
			BCD1, BCD2, BCD3, BCD4 : in  STD_LOGIC_VECTOR (3 downto 0);
           ANODS : out  STD_LOGIC_VECTOR (3 downto 0);
           SAL7SEG : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));

end VIS_DIN_4DIG;

architecture Behavioral of VIS_DIN_4DIG is

SIGNAL BCD: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL Q: STD_LOGIC_VECTOR(1 DOWNTO 0);

begin
	
CONTADOR: PROCESS(CLK) --DEBE SER A 200 Hz I/O W5
BEGIN
if CLK' event and CLK='0' then
	Q<=Q+1;
end if;
END PROCESS CONTADOR;

BCD <=	BCD1 WHEN Q="00" ELSE
		BCD2 WHEN Q="01" ELSE
		BCD3 WHEN Q="10" ELSE
		BCD4;
		
ANODS<= "0111" WHEN Q="00" ELSE
		"1011" WHEN Q="01" ELSE
		"1101" WHEN Q="10" ELSE
		"1110";

SAL7SEG <= 	"1000000" WHEN BCD="0000" ELSE
			"1111001" WHEN BCD="0001" ELSE
	   		"0100100" WHEN BCD="0010" ELSE
	   		"0110000" WHEN BCD="0011" ELSE
	   		"0011001" WHEN BCD="0100" ELSE
	   		"0010010" WHEN BCD="0101" ELSE
	   		"0000010" WHEN BCD="0110" ELSE
	   		"1111000" WHEN BCD="0111" ELSE
	   		"0000000" WHEN BCD="1000" ELSE
	   		"0010000" WHEN BCD="1001" ELSE
	   		"0001000" WHEN BCD="1010" ELSE
	   		"0000011" WHEN BCD="1011" ELSE
	   		"1000110" WHEN BCD="1100" ELSE
	   		"0100001" WHEN BCD="1101" ELSE
	   		"0000110" WHEN BCD="1110" ELSE
	   		"0001110" WHEN BCD="1111" ELSE
	   		"1111111";

end Behavioral;