--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Tue Feb 11 14:14:33 2020
--Host        : edev3 running 64-bit major release  (build 9200)
--Command     : generate_target MercuryXU1_wrapper.bd
--Design      : MercuryXU1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MercuryXU1_wrapper is
  port (
    GPIO_UART_SEL_tri_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    GPIO_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pl_clk1 : out STD_LOGIC;
    pl_resetn0 : out STD_LOGIC
  );
end MercuryXU1_wrapper;

architecture STRUCTURE of MercuryXU1_wrapper is
  component MercuryXU1 is
  port (
    pl_clk1 : out STD_LOGIC;
    pl_resetn0 : out STD_LOGIC;
    GPIO_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    GPIO_UART_SEL_tri_o : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component MercuryXU1;
begin
MercuryXU1_i: component MercuryXU1
     port map (
      GPIO_UART_SEL_tri_o(4 downto 0) => GPIO_UART_SEL_tri_o(4 downto 0),
      GPIO_tri_o(7 downto 0) => GPIO_tri_o(7 downto 0),
      pl_clk1 => pl_clk1,
      pl_resetn0 => pl_resetn0
    );
end STRUCTURE;
