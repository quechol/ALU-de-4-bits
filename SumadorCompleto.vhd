-- Sumador Completo
library IEEE;
use IEEE.std_logic_1164.all;
entity SumadorCompleto is
-- Pines de entrada y salida
	port (a_in, b_in, c_in: in std_logic;
			s_out, c_out: out std_logic);
end SumadorCompleto;

architecture SumadorCompleto_bh of SumadorCompleto is
-- Descripción estructural
	-- Medio Sumador
	component MedioSumador is
		port (a, b: in std_logic;
				s, c: out std_logic);
	end component;
	-- Compuerta OR
	component CompuertaOr is
		port (x, y: in std_logic;
				F: out std_logic);
	end component;
	-- Señales (Variables intermedias)
	signal s1, s2, s3: std_logic;
begin
-- Paso de parametros
	MedioSumador_1: MedioSumador port map (a_in, b_in, s1, s2);
	MedioSumador_2: MedioSumador port map (s1, c_in, s_out, s3);
	CompuertaOr_1: CompuertaOr port map(s3, s2, c_out);
end SumadorCompleto_bh;
	