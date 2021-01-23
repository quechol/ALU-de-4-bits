-- Multiplexor1 4 a 1
library IEEE;
use IEEE.std_logic_1164.all;
entity MultiplexorUno_4a1 is
-- Pines de entrada y salida
	port (sel: in std_logic_vector(3 downto 0);
			op: in std_logic_vector(1 downto 0);
			y: out std_logic);
end MultiplexorUno_4a1;

architecture MultiplexorUno_4a1_bh of MultiplexorUno_4a1 is
begin
-- Seleccion de opciones
	--Asignacion
	y <= 	sel(0) when op = "00" else
			sel(1) when op = "01" else
			sel(2) when op = "10" else
			sel(3) when op = "11" else
			'U';
end MultiplexorUno_4a1_bh;