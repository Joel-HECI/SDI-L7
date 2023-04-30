library IEEE;
use IEEE.std_logic_1164.all;

entity main2 is
    port(
        clk_vd,clk_1hz, clk_2hz, clk_4hz, clk_8hz: in std_logic;
        rst : in std_logic;
        en: in std_logic;
        s: in std_logic_vector(1 downto 0);
        dig_in0,dig_in1,dig_in2: in std_logic_vector(3 downto 0);
        dig_0, dig_1, dig_2: out std_logic_vector(3 downto 0)
        );
end entity;

architecture Behavioral of main2 is
    
    signal dig0, dig1, dig2: std_logic_vector(3 downto 0);
    signal clk_a: std_logic;

    begin

    mux1: entity work.mux4a1 port map(
        s => s,
        IA => clk_1hz,
        IB => clk_2hz,
        IC => clk_4hz,
        ID => clk_8hz,
        Y => clk_a
    );

    cont: entity work.CONT_3DIG port map(
        clk => clk_a,
        reset => rst,
        enable => en,
        dig_in0 => dig_in0,
        dig_in1 => dig_in1,
        dig_in2 => dig_in2,
        dig0 => dig0,
        dig1 => dig1,
        dig2 => dig2

    );

    end architecture;