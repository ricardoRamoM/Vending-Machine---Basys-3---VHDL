-- Testbench de Contador de 0 a N bits
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_of_contadorNbits is
end entity;

architecture tb of tb_of_contadorNbits is

component contadorNbits is
    generic( N : integer); --conteo de N bits
    --generic( max_conteo : integer);
    port(
        clk_100MHz_contador : in std_logic; --
        reset: in std_logic;    
        count_enable: in std_logic;    --count enable
        
        terminal_count: out std_logic;--teminal count
        counter_out: out std_logic_vector (N - 1 downto 0);
        counter_out_int: out integer
    );
end component;

signal N_IN : integer := 8;
signal clk_100MHz_contador_IN, reset_IN, count_enable_IN : std_logic;
signal terminal_count_OUT : std_logic;
signal counter_out_OUT : std_logic_vector (N_IN - 1 downto 0);
signal counter_out_int_OUT : integer;


begin 

UUT : contadorNbits
	generic map(N => N_IN)
    port map(
        	clk_100MHz_contador => clk_100MHz_contador_IN,
        	reset => reset_IN,
        	count_enable => count_enable_IN,
        
        	terminal_count => terminal_count_OUT,
        	counter_out => counter_out_OUT,
        	counter_out_int => counter_out_int_OUT
        	);
            
Clk : process
begin
clk_100MHz_contador_IN <= '0';
wait for 10 ns;
clk_100MHz_contador_IN <= '1';
wait for 10 ns;
end process;            

            
stimulation_signals : process
begin

reset_IN <= '0';
count_enable_IN <= '1';
wait for 5 ns;
reset_IN <= '0';
count_enable_IN <= '1';
wait for 20ns;
reset_IN <= '0';
count_enable_IN <= '1';
wait for 5 ns;
reset_IN <= '0';
count_enable_IN <= '0';
wait for 15 ns;
reset_IN <= '0';
count_enable_IN <= '1';
wait for 5 ns;
reset_IN <= '0';
count_enable_IN <= '0';
wait for 10 ns;
-- Run Time:500 ns
end process;


end tb;