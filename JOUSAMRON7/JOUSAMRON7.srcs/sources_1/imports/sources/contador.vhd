library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CONT_3DIG is
    
    port(
        clk: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        load: in std_logic;
   
        dig_in0, dig_in1,dig_in2: in std_logic_vector(3 downto 0);
        num_out: out std_logic_vector(9 downto 0);
        dig0, dig1, dig2: out std_logic_vector(3 downto 0)
        
    );

    end entity;

architecture Behavioral of CONT_3DIG is
    
    signal count: integer range 0 to 999 := 0;
    signal dig0_s,dig1_s,dig2_s: unsigned(3 downto 0) := (others => '0');

    begin

    process(clk, reset, enable, dig_in0, dig_in1, dig_in2)
    begin
    
    if reset = '1' then        

        if rising_edge(clk) and enable='1' then
            if count =999 then 
                count <= 0;
                dig0_s <= (others => '0');
                dig1_s <= (others => '0');
                dig2_s <= (others => '0');
            else
                count <= count + 1;
            

            if ((count+1) mod 100 = 0 and count > 0) then
                dig2_s <= dig2_s+1;
                dig1_s <= (others => '0');
                dig0_s <= (others => '0');

            elsif ((count+1) mod 10 = 0 and count > 0) then
                dig1_s <= dig1_s+1;
                dig0_s <= (others => '0');

            else 
                dig0_s <= dig0_s+1;
            end if;
            end if;
        end if;

    if load = '1' then
        count <= to_integer(unsigned(dig_in2))*100 + to_integer(unsigned(dig_in1))*10 + to_integer(unsigned(dig_in0));
        dig0_s <= unsigned(dig_in0);
        dig1_s <= unsigned(dig_in1);
        dig2_s <= unsigned(dig_in2);
        end if;
        
    elsif reset='0' then
        count<=0;
        dig0_s <= (others => '0');
        dig1_s <= (others => '0');
        dig2_s <= (others => '0');
    end if;

    end process;
    
    dig0 <= std_logic_vector(dig0_s);
    dig1 <= std_logic_vector(dig1_s);
    dig2 <= std_logic_vector(dig2_s);
  
    num_out <= std_logic_vector(to_unsigned(count,10));
    end architecture;