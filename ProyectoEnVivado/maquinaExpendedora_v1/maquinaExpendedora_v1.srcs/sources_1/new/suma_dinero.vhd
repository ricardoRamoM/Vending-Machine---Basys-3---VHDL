-- Suma de dinero
library ieee;
use ieee.std_logic_1164.all;

entity suma_dinero is
    Port ( 
        clk_100mhz : in std_logic;
           
        UP_IN : in std_logic;
    	DOP_IN : in std_logic;
        CP_IN : in std_logic;
        DP_IN : in std_logic;
        RST_IN : in std_logic;
        Entregar_dinero: in std_logic;
        
        DineroReci: out integer range 0 to 99;
        RecibeDinero: out std_logic      
     );
end suma_dinero;

architecture Behavioral of suma_dinero is

    signal moneda_prev: integer:= 0; --
    signal moneda_act: integer:= 0;

begin
    process(clk_100mhz)
    begin
    if (Entregar_dinero = '1' and UP_IN='0' and DOP_IN='0' and CP_IN='0' and DP_IN='0' and RST_IN = '0' ) then
        moneda_act <= 0;
    else
	    if (clk_100mhz'event and clk_100mhz='1' ) then
            if (UP_IN='1' and DOP_IN='0' and CP_IN='0' and DP_IN='0' and RST_IN = '0') then
                moneda_act <= moneda_prev + 1;
                RecibeDinero <= '1';
            elsif (UP_IN='0' and DOP_IN='1' and CP_IN='0' and DP_IN='0' and RST_IN = '0') then
                moneda_act <= moneda_prev + 2;
                RecibeDinero <= '1';
            elsif (UP_IN='0' and DOP_IN='0' and CP_IN='1' and DP_IN='0' and RST_IN = '0') then
                moneda_act <= moneda_prev + 5;
                RecibeDinero <= '1';
            elsif (UP_IN='0' and DOP_IN='0' and CP_IN='0' and DP_IN='1' and RST_IN = '0') then
                moneda_act <= moneda_prev + 10;
                RecibeDinero <= '1';
            elsif (RST_IN = '1') then
                moneda_act <= 0;
                RecibeDinero <= '0';
        end if;
    end if;
        moneda_prev <= moneda_act;
        DineroReci <= moneda_act;
	end if;
    end process;
    
end Behavioral;