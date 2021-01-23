-- Compuerta AND
library IEEE;
use IEEE.std_logic_1164.all;
entity CompuertaAND is
-- Pines de entrada y salida
	port (x: in std_logic;
			y: in std_logic;
			F: out std_logic);
end CompuertaAND;

architecture CompuertaAND_bh of CompuertaAND is
begin
	process(x,y)
	begin
		--Asignacion
		F <= x AND y;
	end process;
end CompuertaAND_bh;
