-- Medio Sumador
library IEEE;
use IEEE.std_logic_1164.all;
entity MedioSumador is
-- Pines de entrada y salida
	port (a, b: in std_logic;
			s, c: out std_logic);
end MedioSumador;

architecture MedioSumador_bh of MedioSumador is
-- Descripción estructural
	-- Compuerta XOR
	component CompuertaXOR is
		port(x, y: in std_logic;
			  F: out std_logic);
	end component;
	-- Compuerta AND
	component CompuertaAND is
		port(x, y: in std_logic;
			  F: out std_logic);
	end component;
begin
-- Paso de parametros
	CompuertaXOR_1: CompuertaXOR port map (a, b, s);
	CompuertaAND_1: CompuertaAND port map (a, b, c);
end MedioSumador_bh;	
