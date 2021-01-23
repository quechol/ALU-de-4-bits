-- Compuerta NOT
library IEEE;
use IEEE.std_logic_1164.all;
entity CompuertaNOT is
-- Pines de entrada y salida
	port (x: in std_logic;
			F: out std_logic);
end CompuertaNOT;

architecture CompuertaNOT_bh of CompuertaNOT is
begin
	process(x)
	begin
		--Asignacion
		F <= NOT x;
	end process;
end CompuertaNOT_bh;