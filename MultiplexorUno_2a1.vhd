-- Multiplexor1 2 a 1
library IEEE;
use IEEE.std_logic_1164.all;
entity MultiplexorUno_2a1 is
-- Pines de entrada y salida
	port (sel: in std_logic_vector(1 downto 0);
			op: in std_logic;
			y: out std_logic);
end MultiplexorUno_2a1;

architecture MultiplexorUno_2a1_bh of MultiplexorUno_2a1 is
begin
-- Seleccion de opciones
	--Asignacion
	y <= 	sel(0) when op = '0' else
			sel(1) when op = '1' else
			'U';
end MultiplexorUno_2a1_bh;