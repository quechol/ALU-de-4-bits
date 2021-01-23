-- ALU de 4 bits
-- 000 pasar el dato
-- 001 and
-- 010 or
-- 011 not
-- 100 suma
-- 101 resta
-- 110 incremento
-- 111 decremento
-- Autor: Gerardo Miguel Quechol Zarate
-- Version: 2
-- Fecha: 23/01/2021
library IEEE;
use IEEE.std_logic_1164.all;
entity ALU2 is
-- Pines de entrada y salida
	port (A: in std_logic_vector (3 downto 0);	--	Vector de entrada para bits de A
			B: in std_logic_vector (3 downto 0);	--	Vector de entrada para bits de B
			op: in std_logic_vector (2 downto 0);		-- Vector de entrada para seleccion de opcion de 3 bits
			S: out std_logic_vector(3 downto 0);		-- Salida 
			C: out std_logic);							-- Acarreo de salida final
end ALU2;

architecture bh of ALU2 is
-- Descripción estructural
	-- ALU de 1 bit
	component ALU1 is
		port (A: in std_logic;
				B: in std_logic;
				auxB: in std_logic;
				Cin: in std_logic;
				aux: in std_logic;
				opc: in std_logic_vector(2 downto 0);
				Cout: out std_logic;
				Sout: out std_logic);
	end component;
	-- Señales (Variables intermedias)
	-- Acarreos
	signal c_0: std_logic;
	signal c_1: std_logic;
	signal c_2: std_logic;
	signal c_3: std_logic;
	-- Salidas por ALU
	signal s_0: std_logic_vector (1 downto 0);	-- Salidas del primer ALU
	signal s_1: std_logic_vector (1 downto 0);	-- Salidas demas ALU
begin
	-- Asignacion a primera ALU, operaciones aritmeticas
	with op select
			S_0 <= 	"01" when "101",
						"10" when "110",
						"11" when "111",
						"00" when others;
	ALU1_0: ALU1 port map (A(0),B(0),s_0(0),s_0(0),s_0(1),op,c_0,S(0));
	-- Asignacion a ALU, operaciones aritmeticas
	with op select
			S_1 <= 	"01" when "101",
						"10" when "110",
						"11" when "111",
						"00" when others;
	ALU1_1: ALU1 port map (A(1),B(1),s_1(0),c_0,s_1(1),op,c_1,S(1));
	ALU1_2: ALU1 port map (A(2),B(2),s_1(0),c_1,s_1(1),op,c_2,S(2));
	ALU1_3: ALU1 port map (A(3),B(3),s_1(0),c_2,s_1(1),op,c_3,S(3));
	
	C <= c_3;
end bh;