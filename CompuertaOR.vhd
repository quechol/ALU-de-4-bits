-- Compuerta OR
library IEEE;
use IEEE.std_logic_1164.all;
entity CompuertaOR is
-- Pines de entrada y salida
	port (x: in std_logic;
			y: in std_logic;
			F: out std_logic);
end CompuertaOR;

architecture CompuertaOR_bh of CompuertaOR is
begin
	process(x,y)
	begin
		--Asignacion
		F <= x OR y;
	end process;
end CompuertaOR_bh;
