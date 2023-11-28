-- Testbench de Demultiplexor para mostrar numeros en display
library ieee;
use ieee.std_logic_1164.all;

entity tb_of_demux_display is
end entity;

architecture tb of tb_of_demux_display is
component demux_display is
  Port (
  -- contador 1000 Hz. conteoMax= 100000. T=0.001=1ms . Cada 2 ms  cambia 
        clk1000hz: 	    in std_logic;  
        Confirmar_compra_IN : in std_logic; 
        segmentos_uni_dinero : in std_logic_vector (6 downto 0);
        segmentos_dec_dinero : in std_logic_vector (6 downto 0);
        segmentos_uni_cambio : in std_logic_vector (6 downto 0);
        segmentos_dec_cambio : in std_logic_vector (6 downto 0);
        segmentos_uni_precio : in std_logic_vector (6 downto 0);
        segmentos_dec_precio : in std_logic_vector (6 downto 0);
        segmentos_letra 	 : in std_logic_vector (6 downto 0);
        display : 	     out std_logic_vector (6 downto 0);
        curr_display :   out std_logic_vector (3 downto 0)
  );
end component;

signal clk_IN,  Confirmar_compra_IN_IN : std_logic;
signal segmentos_uni_dinero_IN : std_logic_vector (6 downto 0):= "1111001"; -- 1
signal segmentos_dec_dinero_IN : std_logic_vector (6 downto 0):= "1111001"; -- 1
signal segmentos_uni_cambio_IN : std_logic_vector (6 downto 0):= "0110000"; -- 3
signal segmentos_dec_cambio_IN : std_logic_vector (6 downto 0):= "1000000"; -- 0
signal segmentos_uni_precio_IN : std_logic_vector (6 downto 0):= "1111001"; -- 1
signal segmentos_dec_precio_IN : std_logic_vector (6 downto 0):= "1111000"; -- 7
signal segmentos_letra_IN :  std_logic_vector (6 downto 0) :=  "1000110"; --c
signal display_OUT : 	  std_logic_vector (6 downto 0);
signal curr_display_OUT : std_logic_vector (3 downto 0);


begin 

UUT : demux_display port map( 
        clk1000hz => clk_IN,
        Confirmar_compra_IN => Confirmar_compra_IN_IN,
        segmentos_uni_dinero => segmentos_uni_dinero_IN,
        segmentos_dec_dinero => segmentos_dec_dinero_IN,
        segmentos_uni_cambio => segmentos_uni_cambio_IN,
        segmentos_dec_cambio => segmentos_dec_cambio_IN,
        segmentos_uni_precio => segmentos_uni_precio_IN,
        segmentos_dec_precio => segmentos_dec_precio_IN,
        segmentos_letra => segmentos_letra_IN,
        display => display_OUT,
        curr_display => curr_display_OUT
);

            --0 => segmentos := "1000000";
            --1 => segmentos := "1111001";
            --2 => segmentos := "0100100";
            --3 => segmentos := "0110000";
            --4 => segmentos := "0011001";
            --5 => segmentos := "0010010";
            --6 => segmentos := "0000010";
            --7 => segmentos := "1111000";
            --8 => segmentos := "0000000";
            --9 => segmentos := "0010000";

Clk : process
begin
clk_IN <= '0';
wait for 1 ns;
clk_IN <= '1';
wait for 1 ns;
end process;

stimulation_signals : process
begin
	Confirmar_compra_IN_IN <= '1';
	wait for 5 ns;
    Confirmar_compra_IN_IN <= '1';
	wait for 20ns;
    Confirmar_compra_IN_IN <= '1';
	wait for 5 ns;
    Confirmar_compra_IN_IN <= '0';
	wait for 15 ns;
    Confirmar_compra_IN_IN <= '1';
	wait for 5 ns;
    Confirmar_compra_IN_IN <= '0';
	wait for 10 ns;
    Confirmar_compra_IN_IN <= '0';
	wait for 5 ns;
    Confirmar_compra_IN_IN <= '1';
	wait for 15 ns;
    Confirmar_compra_IN_IN <= '1';
	wait for 5 ns;
    Confirmar_compra_IN_IN <= '0';
	wait for 10 ns;
	
    -- Run Time: 500 ns
	
end process;

end tb;