------------------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date: 3/28/24
-- Experiment Name: Priority Encoder in VHDL (Lab #8)
-- Design Name: Lab_8_Priority_Encoder 
-- Project Name: Lab_8 
-- Target Devices: xc7a35t-1cpg236c
--
-- Description:	Design an 16-to-4 Priority Encoder using behavioral VHDL.
-- 				Use a 'when else' statement to describe the encoder.  
--				The priority encoder has sixteen inputs (slider switches).
--				The priority encoder has four outputs (seven-segment display).
--				The priority encoder has one valid output (LED).
-- 
-- Basys 3 Board resources used for this design:
-- 				16 slider switches for the encoder inputs.
-- 				1 seven-segment display for the priority encoder outputs.
-- 				1 LED for the valid output of the priority encoder.
------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab_8_Priority_Encoder is
   Port ( ENC_in : in STD_LOGIC_VECTOR(0 to 15);
          ENC_out : out STD_LOGIC_VECTOR(3 downto 0);
		  ENC_valid : out STD_LOGIC
		  );
end lab_8_Priority_Encoder;

architecture behavioral of lab_8_Priority_Encoder is
begin

	ENC_out <= "1111" when ENC_in(15) = '1' else
			   "1110" when ENC_in(14) = '1' else
			   "1101" when ENC_in(13) = '1' else
			   "1100" when ENC_in(12) = '1' else
			   "1011" when ENC_in(11) = '1' else
			   "1010" when ENC_in(10) = '1' else
			   "1001" when ENC_in(9) = '1' else
			   "1000" when ENC_in(8) = '1' else
			   "0111" when ENC_in(7) = '1' else
			   "0110" when ENC_in(6) = '1' else
			   "0101" when ENC_in(5) = '1' else
			   "0100" when ENC_in(4) = '1' else
			   "0011" when ENC_in(3) = '1' else
			   "0010" when ENC_in(2) = '1' else
			   "0001" when ENC_in(1) = '1' else
			   "0000" when ENC_in(0) = '1' else
			   "0000";
	ENC_valid <= '0' when ENC_in = "0000000000000000" else '1';

end behavioral;
