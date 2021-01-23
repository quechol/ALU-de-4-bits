-- ALU de 1 bit
-- 000 pasar el dato
-- 001 and
-- 010 or
-- 011 not
-- 100 suma
-- 101 resta
-- 110 incremento
-- 111 decremento
library IEEE;
use IEEE.std_logic_1164.all;

entity ALU1 is
-- Pines de entrada y salida
	port (A: in std_logic;	-- Pin A de entrada
			B: in std_logic;	-- Pin B de entrada
			auxB: in std_logic;	-- NOT B
			Cin: in std_logic;	-- Acarreo de entrada
			aux: in std_logic;		-- ++1//--1
			opc: in std_logic_vector(2 downto 0);	-- vector de bits de seleccion
			Cout: out std_logic;		-- Acarreo de salida
			Sout: out std_logic);	-- Resultado
end ALU1;

architecture ALU1_bh of ALU1 is
-- Descripción estructural
	-- Compuerta and
	component CompuertaAND is
		port (x: in std_logic;
				y: in std_logic;
				F: out std_logic);
	end component;
	-- Compuerta or
	component CompuertaOR is
		port (x: in std_logic;
				y: in std_logic;
				F: out std_logic);
	end component;
	-- Compuerta not
	component CompuertaNOT is
		port (x: in std_logic;
				F: out std_logic);
	end component;
	-- Sumador completo
	component SumadorCompleto is
		port (a_in, b_in, c_in: in std_logic;
				s_out, c_out: out std_logic);
	end component;
	-- Multplexor 2 a 1
	component MultiplexorUno_2a1 is
		port (sel: in std_logic_vector(1 downto 0);
				op: in std_logic;
				y: out std_logic);
	end component;
	-- Multiplexor 4 a 1
	component MultiplexorUno_4a1 is
		port (sel: in std_logic_vector(3 downto 0);
				op: in std_logic_vector(1 downto 0);
				y: out std_logic);
	end component;
	-- Multiplexor 8 a 1
	component MultiplexorUno_8a1 is
		port (sel: in std_logic_vector(7 downto 0);
				op: in std_logic_vector(2 downto 0);
				y: out std_logic);
	end component;
	-- Señales (Variables intermedias)
	signal s0: std_logic;
	signal s1: std_logic;
	signal s2: std_logic;
	signal s3: std_logic;
	signal s4: std_logic;
	signal s5: std_logic;
	signal s6: std_logic;
	-- Señales de vectores (Variables intermedias)
	signal s7: std_logic_vector(1 downto 0);
	signal s8: std_logic_vector(1 downto 0);
	signal s9: std_logic_vector(3 downto 0);
	signal s10: std_logic_vector(7 downto 0);
begin
-- Paso de parametros
	-- Operaciones logicas
	CompuertaAND_1: CompuertaAND port map (A, B, s0);
	CompuertaOR_1: CompuertaOR port map (A, B, s1);
	CompuertaNOT_A: CompuertaNOT port map (A, s2);
	CompuertaNOT_B: CompuertaNOT port map (B, s3);
	-- Multiplexor 4 a 1
	s9 <= '0' & '1' & s3 & B;
	s7 <= aux & auxB;
	MultiplexorUno_4a1_Uno: MultiplexorUno_4a1 port map (s9, s7, s4);
	--Operaciones aritmeticas
	SumadorCompleto_1: SumadorCompleto port map (A, s4, Cin, s5, s6);
	-- Multiplexor 2 a 1
	s8 <= s6 & '0';
	MultiplexorUno_2a1_Uno: MultiplexorUno_2a1 port map (s8, opc(2), Cout);
	-- Multiplexor 8 a 1
	s10 <= s5 & s5 & s5 & s5 & s2 & s1 & s0 & A;
	MultiplexorUno_8a1_Uno: MultiplexorUno_8a1 port map (s10, opc, Sout);
end ALU1_bh;
	