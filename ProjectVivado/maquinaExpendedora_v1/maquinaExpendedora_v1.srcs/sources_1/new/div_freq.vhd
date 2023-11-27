-- Divisor de frecuencias 
library ieee;
use ieee.std_logic_1164.all;

entity div_freq is
    generic( max_conteo : integer); --con esto se puede usar una entrada como constante
    Port ( 
            clkOriginal : in std_logic;
            reset : in std_logic;
            clkDividido : out std_logic
           );
end div_freq;

architecture Behavioral of div_freq is
    -- conteoMax= 100Mhz / (freq req) = 100Mhz / (1/segundosReq) 
	-- contador 500Hz (para refresco del display) o cada 2ms
	-- contador 1 Hz . conteoMax= 100000000. T=1.0s . Cada 2 s  cambia
	-- contador 2 Hz . conteoMax= 50000000. T=0.5s . Cada 1 s  cambia
	-- contador 4 Hz. conteoMax= 25000000. T=0.25s . Cada 0.5s  cambia
    -- contador 1000 Hz. conteoMax= 100000. T=0.001=1ms . Cada 2 ms  cambia 
    signal contador : integer range 0 to max_conteo; 
    signal clk_state : std_logic := '0';
    
begin 
    gen_clock: process(clk_state, contador, reset, clkOriginal)
	begin
        if (reset = '1') then
	       clk_state <= '0';
           contador <= 0;
        elsif (clkOriginal'event and clkOriginal='1') then
            if (contador < max_conteo) then 
				contador <= contador + 1;
			else
				clk_state <= not(clk_state);
				contador <= 0;
			end if;
		end if;
	end process;
	
	persecond: process (clk_state)
	begin
		clkDividido <= clk_state;
	end process;
              
end Behavioral;
