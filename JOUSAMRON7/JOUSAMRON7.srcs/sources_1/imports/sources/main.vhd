library IEEE;
use IEEE.std_logic_1164.all;

entity main is
    port(
        -- I/O W5
        clk : in std_logic;
        -- I/O L1
        clk_o1hz: out std_logic;
        -- I/O P1
        clka: out std_logic;
        -- I/O U18
        rst : in std_logic;
        -- I/O W19
        load: in std_logic;
        -- I/O W17
        en: in std_logic;
        -- I/O W16 V16
        s: in std_logic_vector(1 downto 0);
        -- I/O V17
        s1: in std_logic;
        -- I/O R2 T1 U1 W2 R3 T2 T3 V2 W13 W14 V15 W15 
        dig_in0,dig_in1,dig_in2: in std_logic_vector(3 downto 0);
        -- I/O U7 V5 U5 V8 U8 W6 W7 V7
        SAL7: out std_logic_vector(6 downto 0);
        -- I/O W4 V4 U4 U2
        ANODS: out std_logic_vector(3 downto 0)
        );
end entity;

architecture Behavioral of main is
    
    signal dig0, dig1, dig2: std_logic_vector(3 downto 0);
    signal clk_vd,clk_1hz, clk_2hz, clk_4hz, clk_8hz,clk_a: std_logic;
    signal c_dig0, c_dig1, c_dig2: std_logic_vector(3 downto 0);
    begin

    clk1hz: entity work.DIV_1HZ port map(
        Clk => clk,
        CLK_o => clk_1hz
    );
    
    clk2hz: entity work.DIV_2HZ port map(
        Clk => clk,
        CLK_o => clk_2hz
    );

    clk4hz: entity work.DIV_4HZ port map(
        Clk => clk,
        CLK_o => clk_4hz
    );

    clk8hz: entity work.DIV_8HZ port map(
        Clk => clk,
        CLK_o => clk_8hz
    );
    
    c_clk_VD: entity work.DIV_VD port map(
        Clk => clk,
        CLK_o => clk_vd
    );

    mux: entity work.mux4a1 port map(
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
        load => load,
        enable => en,
        dig_in0 => dig_in0,
        dig_in1 => dig_in1,
        dig_in2 => dig_in2,
        dig0 => dig0,
        dig1 => dig1,
        dig2 => dig2

    );

    vis_din: entity work.VIS_DIN_4DIG port map(
        clk => clk_vd,
        BCD1 => "0000",
        BCD2 => c_dig2,
        BCD3 => c_dig1,
        BCD4 => c_dig0,
        SAL7SEG => SAL7,
        ANODS => ANODS
    ); 

    mux2: entity work.mux8a4 port map(
        s => s1,
        IA => dig0,
        IB => dig1,
        IC => dig2,

        IE => dig_in0,
        II => dig_in1,
        IG => dig_in2,


        Y0 => c_dig0,
        Y1 => c_dig1,
        Y2 => c_dig2
 

    );

    clk_o1hz <= clk_1hz;
    clka <= clk_a;
    end architecture;