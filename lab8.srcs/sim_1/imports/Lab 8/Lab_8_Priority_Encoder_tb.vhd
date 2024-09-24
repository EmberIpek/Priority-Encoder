-------------------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date: 
-- Experiment Name: Priority Encoder in VHDL (Lab #8)
-- Design Name: Lab_8_Priority_Encoder 
-- Project Name: Lab_8 
--
-- Description:	Test bench for the 16-to-4 Priority Encoder (Lab_8_Priority_Encoder).
--				An exhaustive test would require 65536 test vectors and be too time consuming.
--				Instead, the Priority Encoder should be tested using the test vectors 
--				specified in the lab manual.
--------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity lab_8_Priority_Encoder_tb is
end lab_8_Priority_Encoder_tb;

architecture behavior of lab_8_Priority_Encoder_tb is

-- component declaration for unit under test
component lab_8_Priority_Encoder is
   Port ( ENC_in : in STD_LOGIC_VECTOR(0 to 15);
          ENC_out : out STD_LOGIC_VECTOR(3 downto 0);
		  ENC_valid : out STD_LOGIC
		  );
end component;

-- signals declared for use in the testbench 
signal ENC_in_tb : STD_LOGIC_VECTOR(0 to 15); 
signal ENC_out_tb : STD_LOGIC_VECTOR(3 downto 0);
signal ENC_valid_tb : STD_LOGIC;

begin

	-- instantiate the unit under test (uut)
	dut : lab_8_Priority_Encoder port map (
			ENC_in => ENC_in_tb,
			ENC_out => ENC_out_tb,
			ENC_valid => ENC_valid_tb
		);

	ENC_simulation: process
	begin
	
	ENC_in_tb <= "0000000000100000";
	wait for 10 ns;
	ENC_in_tb <= "0000000001000010";
	wait for 10 ns;
	ENC_in_tb <= "0111000000000000";
	wait for 10 ns;
	ENC_in_tb <= "1000000000000001";
	wait for 10 ns;
	ENC_in_tb <= "0000000011111111";
	wait for 10 ns;
	ENC_in_tb <= "1111111100000000";
	wait for 10 ns;
	ENC_in_tb <= "0101010101010101";
	wait for 10 ns;
	ENC_in_tb <= "1010101010101010";
	wait for 10 ns;
	ENC_in_tb <= "1111111111111111";
	wait for 10 ns;
	ENC_in_tb <= "0000000000000000";
	wait for 10 ns;

	end process ENC_simulation;
	
end behavior;
