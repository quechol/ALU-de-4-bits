-- Multiplexor1 8 a 1
library IEEE;
use IEEE.std_logic_1164.all;
entity MultiplexorUno_8a1 is
-- Pines de entrada y salida
	port (sel: in std_logic_vector(7 downto 0);
			op: in std_logic_vector(2 downto 0);
			y: out std_logic);
end MultiplexorUno_8a1;

architecture MultiplexorUno_8a1_bh of MultiplexorUno_8a1 is
begin
-- Seleccion de opciones
	--Asignacion
	y <= 	sel(0) when op = "000" else
			sel(1) when op = "001" else
			sel(2) when op = "010" else
			sel(3) when op = "011" else
			sel(4) when op = "100" else
			sel(5) when op = "101" else
			sel(6) when op = "110" else
			sel(7) when op = "111" else
			'U';
end MultiplexorUno_8a1_bh;