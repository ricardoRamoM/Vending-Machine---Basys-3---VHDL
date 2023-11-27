## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk100Mhz]
	set_property IOSTANDARD LVCMOS33 [get_ports clk100Mhz]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## LEDs
set_property PACKAGE_PIN U16 [get_ports {LEDS[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[0]}]
set_property PACKAGE_PIN E19 [get_ports {LEDS[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[1]}]
set_property PACKAGE_PIN U19 [get_ports {LEDS[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[2]}]
set_property PACKAGE_PIN V19 [get_ports {LEDS[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[3]}]
set_property PACKAGE_PIN W18 [get_ports {LEDS[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[4]}]
set_property PACKAGE_PIN U15 [get_ports {LEDS[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[5]}]
set_property PACKAGE_PIN U14 [get_ports {LEDS[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[6]}]
set_property PACKAGE_PIN V14 [get_ports {LEDS[7]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[7]}]
set_property PACKAGE_PIN V13 [get_ports {LEDS[8]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[8]}]
set_property PACKAGE_PIN V3 [get_ports {LEDS[9]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[9]}]
set_property PACKAGE_PIN W3 [get_ports {LEDS[10]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[10]}]
set_property PACKAGE_PIN U3 [get_ports {LEDS[11]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[11]}]
set_property PACKAGE_PIN P3 [get_ports {LEDS[12]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[12]}]
set_property PACKAGE_PIN N3 [get_ports {LEDS[13]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[13]}]
set_property PACKAGE_PIN P1 [get_ports {LEDS[14]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[14]}]
set_property PACKAGE_PIN L1 [get_ports {LEDS[15]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[15]}]
	
##Buttons
# Arriba
#set_property PACKAGE_PIN T18 [get_ports UP_IN]
	#set_property IOSTANDARD LVCMOS33 [get_ports UP_IN]
# Derecha	
#set_property PACKAGE_PIN T17 [get_ports DOP_IN]
	#set_property IOSTANDARD LVCMOS33 [get_ports DOP_IN]
# Abajo
#set_property PACKAGE_PIN U17 [get_ports CP_IN]
	#set_property IOSTANDARD LVCMOS33 [get_ports CP_IN]
# Izquierda
#set_property PACKAGE_PIN W19 [get_ports DP_IN]
	#set_property IOSTANDARD LVCMOS33 [get_ports DP_IN]
# Centro
set_property PACKAGE_PIN U18 [get_ports RST_IN]
    set_property IOSTANDARD LVCMOS33 [get_ports RST_IN]
	
## Switches
set_property PACKAGE_PIN V17 [get_ports {UP_IN}]
	set_property IOSTANDARD LVCMOS33 [get_ports {UP_IN}]
set_property PACKAGE_PIN V16 [get_ports {DOP_IN}]
	set_property IOSTANDARD LVCMOS33 [get_ports {DOP_IN}]
set_property PACKAGE_PIN W16 [get_ports {CP_IN}]
	set_property IOSTANDARD LVCMOS33 [get_ports {CP_IN}]
set_property PACKAGE_PIN W17 [get_ports {DP_IN}]
	set_property IOSTANDARD LVCMOS33 [get_ports {DP_IN}]
set_property PACKAGE_PIN T3 [get_ports {CONF_COMPRA_IN}]
	set_property IOSTANDARD LVCMOS33 [get_ports {CONF_COMPRA_IN}]
	
	
## Switches
set_property PACKAGE_PIN R2 [get_ports {PRODUCT_IN[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {PRODUCT_IN[0]}]
set_property PACKAGE_PIN T1 [get_ports {PRODUCT_IN[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {PRODUCT_IN[1]}]
set_property PACKAGE_PIN U1 [get_ports {PRODUCT_IN[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {PRODUCT_IN[2]}]
set_property PACKAGE_PIN W2 [get_ports {PRODUCT_IN[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {PRODUCT_IN[3]}]
set_property PACKAGE_PIN R3 [get_ports {PRODUCT_IN[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {PRODUCT_IN[4]}]
	
	



	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg_display[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_display[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg_display[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_display[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg_display[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_display[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg_display[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_display[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg_display[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_display[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg_display[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_display[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg_display[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_display[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {select_display[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {select_display[0]}]
set_property PACKAGE_PIN U4 [get_ports {select_display[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {select_display[1]}]
set_property PACKAGE_PIN V4 [get_ports {select_display[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {select_display[2]}]
set_property PACKAGE_PIN W4 [get_ports {select_display[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {select_display[3]}]
	