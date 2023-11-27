-- Testbench del Divisor de frecuencias 
library ieee;
use ieee.std_logic_1164.all;

entity tb_of_div_freq is
end entity;

architecture tb of tb_of_div_freq is
component div_freq is
    generic( max_conteo : integer);
    Port ( 
            clkOriginal : in std_logic;
            reset : in std_logic;
            clkDividido : out std_logic
           );
end component;

signal clkOriginal_IN, reset_IN : STD_LOGIC;
signal clkDividido_OUT : STD_LOGIC;


begin

UUT:  div_freq    
          	generic map( max_conteo => 5)
            port map(
            	clkOriginal => clkOriginal_IN,
                reset => reset_IN,
                clkDividido  => clkDividido_OUT
			); 
            
Clk : process
begin
clkOriginal_IN <= '0';
wait for 10 ns;
clkOriginal_IN <= '1';
wait for 10 ns;
end process;

stimulation_signals : process
begin
	reset_IN <= '0';
	wait for 250 ns;
	reset_IN <= '1';
	wait for 20 ns;
	reset_IN <= '0';
	wait for 500 ns;
	
    --recordar en EDA Playground colocar un valor en RUN TIME p.e. 2000ns
end process;


end tb;