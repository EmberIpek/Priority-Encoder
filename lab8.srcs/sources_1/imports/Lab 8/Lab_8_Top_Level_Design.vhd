------------------------------------------------------------------------------------------------------------
-- Course: ECE 232 - Digital System Design Lab
-- Author: Ember Ipek
-- 
-- Create Date:  3/28/24
-- Experiment Name: Priority Encoder in VHDL (Lab #8)
-- Design Name: Lab_8_Top_Level_Design
-- Project Name: Lab_8
-- Target Devices: xc7a35t-1cpg236c
--
-- Description: Create the top-level design using Structural VHDL.
--				The design includes a 16-to-4 Priority Encoder and an Hex to Seven-segment Decoder.
--				The Priority Encoder and Hex to Seven-segment Decoder are described in separate VHDL files.
------------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab_8_Top_Level_Design is
    Port ( top_in : in std_logic_vector (0 to 15);
           top_a, top_b, top_c, top_d, top_e, top_f, top_g : out std_logic;
           disp_right, disp_left, disp_midright, disp_midleft : out STD_LOGIC;
		   top_valid : out std_logic
		   );
  
end Lab_8_Top_Level_Design;

architecture structural of lab_8_Top_Level_Design is

--component declarations
component Lab_8_Priority_Encoder
Port ( ENC_in : in STD_LOGIC_VECTOR(0 to 15);
          ENC_out : out STD_LOGIC_VECTOR(3 downto 0);
		  ENC_valid : out STD_LOGIC);
end component;

component Lab_8_Hex_Decoder
port (B3, B2, B1, B0 : in std_logic;
	  a, b, c, d, e, f, g : out std_logic);
end component;
	 
--signal declarations
signal sig_in : std_logic_vector (3 downto 0);
signal sig_out : std_logic_vector (16 downto 0);
	 
begin
    encoder : Lab_8_Priority_Encoder port map (
        ENC_in => top_in,
        ENC_valid => top_valid,
        ENC_out => sig_in
        );
    decoder : Lab_8_Hex_Decoder port map (
        B3 => sig_in(3),
        B2 => sig_in(2),
        B1 => sig_in(1),
        B0 => sig_in(0),
        a => top_a,
        b => top_b,
        c => top_c,
        d => top_d,
        e => top_e,
        f => top_f,
        g => top_g
        );
      
disp_right <= '0';		-- turn the seven-segment display on
disp_left <= '1';		-- turn the seven-segment display off
disp_midright <= '1';	-- turn the seven-segment display off
disp_midleft <= '1';	-- turn the seven-segment display off 

end structural;
