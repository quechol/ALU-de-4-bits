-- Compuerta XOR
library IEEE;
use IEEE.std_logic_1164.all;
entity CompuertaXOR is
-- Pines de entrada y salida
	port (x: in std_logic;
			y: in std_logic;
			F: out std_logic);
end CompuertaXOR;

architecture CompuertaXOR_bh of CompuertaXOR is
begin
	process(x,y)
	begin
		--Asignacion
		F <= x XOR y;
	end process;
end CompuertaXOR_bh;