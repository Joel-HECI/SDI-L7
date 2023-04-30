library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_MAIN is
end entity;

architecture Behavioral of testbench_MAIN is
    signal clk_vd,clk_1hz, clk_2hz, clk_4hz, clk_8hz: std_logic:='0';
    signal rst: std_logic := '0';
    signal en: std_logic := '1';
    signal s: std_logic_vector(1 downto 0) := (others => '0');
    signal dig_in0,dig_in1,dig_in2: std_logic_vector(3 downto 0) := (others => '0');
    signal dig_0,dig_1,dig_2: std_logic_vector(3 downto 0) := (others => '0');signal SAL7 : std_logic_vector(6 downto 0) := (others => '0');


    constant ClockFrequency1 : integer := 1; -- 100 MHz
    constant ClockFrequency2 : integer := 2; -- 100 MHz
    constant ClockFrequency4 : integer := 4; -- 100 MHz
    constant ClockFrequency8 : integer := 8; -- 100 MHz
    constant ClockFrequencyVD : integer := 200;

    constant ClockPeriod1    : time    := 1 sec / ClockFrequency1;
    constant ClockPeriod2    : time    := 1 sec / ClockFrequency2;
    constant ClockPeriod4    : time    := 1 sec / ClockFrequency4;
    constant ClockPeriod8    : time    := 1 sec / ClockFrequency8;
    constant ClockPeriodVD   : time    := 1 sec / ClockFrequencyVD;

begin

    main : entity work.main2
        port map(
            clk_vd => clk_vd,
            clk_1hz => clk_1hz,
            clk_2hz => clk_2hz,
            clk_4hz => clk_4hz,
            clk_8hz => clk_8hz,

            rst => rst,
            en => en,
            s => s,
            dig_in0 => dig_in0,
            dig_in1 => dig_in1,
            dig_in2 => dig_in2,
            dig_0 => dig_0,
            dig_1 => dig_1,
            dig_2 => dig_2

        );

    CLK_PROC_VD : process
    begin
    wait for ClockPeriodVD / 2;
    if clk_vd = '1' then
        clk_vd <= '0';
    else
        clk_vd <= '1';
    end if;
    end process;

    CLK_PROC_1HZ : process
    begin
    wait for ClockPeriod1 / 2;
    if clk_1hz = '1' then
        clk_1hz <= '0';
    else
        clk_1hz <= '1';
    end if;
    end process;

    CLK_PROC_2HZ : process
    begin
    wait for ClockPeriod2 / 2;
    if clk_2hz = '1' then
        clk_2hz <= '0';
    else
        clk_2hz <= '1';
    end if;
    end process;

    CLK_PROC_4HZ : process
    begin
    wait for ClockPeriod4 / 2;
    if clk_4hz = '1' then
        clk_4hz <= '0';
    else
        clk_4hz <= '1';
    end if;
    end process;

    CLK_PROC_8HZ : process
    begin
    wait for ClockPeriod8 / 2;
    if clk_8hz = '1' then
        clk_8hz <= '0';
    else
        clk_8hz <= '1';
    end if;
    end process;

    process
    begin
    wait for 10 ns;
    s <= "00";
    wait for 2500 ms;
    en <= '0';
    wait for 3000 ms;
    en <= '1';
    wait for 4800 ms;
    s <= "01";
    wait for 5600 ms;
    dig_in0 <= "0001";
    dig_in1 <= "0010";
    dig_in2 <= "0011";
    rst <= '1';
    wait for 100 ns;
    rst <= '0';
    wait;
    end process;
    
    end architecture;

    