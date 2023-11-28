-- Testbench de Suma de dinero
library ieee;
use ieee.std_logic_1164.all;

entity tb_of_suma_dinero is
end entity;

architecture tb of tb_of_suma_dinero is
component suma_dinero is
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
end component;

signal clk_IN,  Entregar_dinero_IN: std_logic;
signal UP_IN_IN, DOP_IN_IN, CP_IN_IN, DP_IN_IN, RST_IN_IN : std_logic;
signal RecibeDinero_OUT : std_logic;
signal DineroReci_OUT : integer;


begin 

UUT : suma_dinero port map( 
        clk_100mhz => clk_IN,
        RST_IN => RST_IN_IN,
        UP_IN => UP_IN_IN,
        DOP_IN => DOP_IN_IN,
        CP_IN => CP_IN_IN,
        DP_IN => DP_IN_IN,
        Entregar_dinero => Entregar_dinero_IN,
        DineroReci => DineroReci_OUT,
        RecibeDinero => RecibeDinero_OUT
);

Clk : process
begin
clk_IN <= '0';
wait for 1 ns;
clk_IN <= '1';
wait for 1 ns;
end process;

stimulation_signals : process
begin
	Entregar_dinero_IN <= '1';
	UP_IN_IN <= '0';
	DOP_IN_IN <= '0';
	CP_IN_IN <= '1';
	DP_IN_IN <= '0';
    RST_IN_IN <= '0';
	wait for 5 ns;
    Entregar_dinero_IN <= '1';
	UP_IN_IN <= '1';
	DOP_IN_IN <= '0';
	CP_IN_IN <= '0';
	DP_IN_IN <= '0';
    RST_IN_IN <= '0';
	wait for 20ns;
    Entregar_dinero_IN <= '1';
	UP_IN_IN <= '0';
	DOP_IN_IN <= '1';
	CP_IN_IN <= '0';
	DP_IN_IN <= '0';
    RST_IN_IN <= '0';
	wait for 5 ns;
    Entregar_dinero_IN <= '0';
	UP_IN_IN <= '0';
	DOP_IN_IN <= '0';
	CP_IN_IN <= '0';
	DP_IN_IN <= '0';
    RST_IN_IN <= '0';
	wait for 15 ns;
    Entregar_dinero_IN <= '1';
	UP_IN_IN <= '0';
	DOP_IN_IN <= '0';
	CP_IN_IN <= '1';
	DP_IN_IN <= '0';
    RST_IN_IN <= '0';
	wait for 5 ns;
    Entregar_dinero_IN <= '1';
	UP_IN_IN <= '0';
	DOP_IN_IN <= '0';
	CP_IN_IN <= '0';
	DP_IN_IN <= '1';
    RST_IN_IN <= '0';
	wait for 10 ns;
    Entregar_dinero_IN <= '0';
	UP_IN_IN <= '0';
	DOP_IN_IN <= '0';
	CP_IN_IN <= '1';
	DP_IN_IN <= '0';
    RST_IN_IN <= '0';
	wait for 5 ns;
    Entregar_dinero_IN <= '0';
	UP_IN_IN <= '0';
	DOP_IN_IN <= '1';
	CP_IN_IN <= '0';
	DP_IN_IN <= '0';
    RST_IN_IN <= '1';
	wait for 15 ns;
    Entregar_dinero_IN <= '1';
	UP_IN_IN <= '1';
	DOP_IN_IN <= '0';
	CP_IN_IN <= '0';
	DP_IN_IN <= '0';
	RST_IN_IN <= '0';
	wait for 5 ns;
    Entregar_dinero_IN <= '0';
	UP_IN_IN <= '0';
	DOP_IN_IN <= '1';
	CP_IN_IN <= '1';
	DP_IN_IN <= '1';
    RST_IN_IN <= '0';
	wait for 10 ns;
	
    -- Run Time: 500 ns
	
end process;

end tb;