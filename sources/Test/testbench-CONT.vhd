library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench_CONT is
end entity;

architecture Behavioral of testbench_CONT is

    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal en: std_logic := '1';
    signal dig_in0,dig_in1,dig_in2: std_logic_vector(3 downto 0) := (others => '0');
    signal data_out: std_logic_vector(9 downto 0) := (others => '0');
    signal clk_period: time := 10 ms;
    signal dig0, dig1, dig2: std_logic_vector(3 downto 0) := "0000";
begin

    cont: entity work.CONT_3DIG port map(
        clk => clk,
        reset => rst,
        enable => en,
        num_out => data_out,
        dig_in0 => dig_in0,
        dig_in1 => dig_in1,
        dig_in2 => dig_in2,
        dig0=>dig0,
        dig1=>dig1,
        dig2=>dig2
    );
    
    CLK_PROC : process
    begin
    wait for clk_period / 2;
    if clk = '1' then
        clk <= '0';
    else
        clk <= '1';
    end if;
    end process;
    
    test: process
    begin
    wait for 100 ns;

    dig_in0 <= "0000";
    dig_in1 <= "0000";
    dig_in2 <= "0000";

    wait for 120 ms;
    en<='0';
    rst <= '1';
    dig_in0 <= "0101";
    dig_in1 <= "0010";
    dig_in2 <= "1000";
    wait for 10 ns;
    rst <= '0';
    en<='1';
    
  
    wait;
    end process;
    end architecture;