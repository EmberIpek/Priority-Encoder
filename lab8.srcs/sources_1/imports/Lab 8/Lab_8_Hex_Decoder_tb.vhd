--------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date: 
-- Experiment Name: Priority Encoder in VHDL (Lab #8)
-- Project Name: Lab_8
--
-- Description:	Testbench for the Hex to Seven-segment Decoder (Lab #8).
-- 				It tests ALL of the possible input combinations (0000 to 1111).
--				This is known as an "exhaustive test".
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lab_8_Hex_Decoder_tb is
end lab_8_Hex_Decoder_tb;

architecture behavior of lab_8_Hex_Decoder_tb is

-- component declaration 
component lab_8_Hex_Decoder is

port (B3, B2, B1, B0 : in std_logic;
	  a, b, c, d, e, f, g : out std_logic);

end component;

-- signal declaration
signal BBBB_tb : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal a_tb, b_tb, c_tb, d_tb, e_tb, f_tb, g_tb : STD_LOGIC; 

begin
	-- instantiate the component (i.e. the device under test (DUT))
	
	dut : lab_8_Hex_Decoder port map  (
			B3 => BBBB_tb(3),
			B2 => BBBB_tb(2),
			B1 => BBBB_tb(1),
			B0 => BBBB_tb(0),
			a => a_tb, 
			b => b_tb, 
			c => c_tb, 
			d => d_tb, 
			e => e_tb, 
			f => f_tb, 
			g => g_tb);

			
	stimuli : process
	begin

		wait for 10 ns;
		BBBB_tb <= BBBB_tb + 1;
	
		
	end process stimuli;
	
end behavior;
