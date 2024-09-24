-------------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date:  3/28/24
-- Experiment Name: Priority Encoder in VHDL (Lab #8)
-- Design Name: Lab_8_Hex_Decoder
-- Project Name: Lab_8
-- Target Devices: xc7a35t-1cpg236c
--
-- Description: Design a Hex to Seven-segment Decoder using the VHDL with-select-when statement.
--				You may use the VHDL description written in Lab 7.
-------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab_8_Hex_Decoder is
  
port (B3, B2, B1, B0 : in std_logic;
	  a, b, c, d, e, f, g : out std_logic);
  
end lab_8_Hex_Decoder;

architecture behavioral of lab_8_Hex_Decoder is

signal BBBB : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal segments : STD_LOGIC_VECTOR(1 to 7); 

begin

BBBB <= B3&B2&B1&B0;

WITH BBBB SELECT
	segments <= "0000001" WHEN "0000",
	"1001111" WHEN "0001",
	"0010010" WHEN "0010",
	"0000110" WHEN "0011",
	"1001100" WHEN "0100",
	"0100100" WHEN "0101",
	"0100000" WHEN "0110",
	"0001111" WHEN "0111",
    "0000000" WHEN "1000",
	"0000100" WHEN "1001",
	"0001000" WHEN "1010",
	"1100000" WHEN "1011",
	"0110001" WHEN "1100",
	"1000010" WHEN "1101",
	"0110000" WHEN "1110",
	"0111000" WHEN "1111",
	"0000000" when others;
a <= segments(1);
b <= segments(2);
c <= segments(3);
d <= segments(4);
e <= segments(5);
f <= segments(6);
g <= segments(7);


end behavioral;
