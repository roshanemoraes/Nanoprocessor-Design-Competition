----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 09:19:21 PM
-- Design Name: 
-- Module Name: TSB_Mux_8_way_4_bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TSB_Mux_8_way_4_bit is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end TSB_Mux_8_way_4_bit;

architecture Behavioral of TSB_Mux_8_way_4_bit is

COMPONENT Decoder_3_to_8
PORT (
    I : in STD_LOGIC_VECTOR (2 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (7 downto 0)
);
END COMPONENT;

COMPONENT TSB_4_Bit 
PORT (
    I : in STD_LOGIC_VECTOR (3 downto 0);
    Sel : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (3 downto 0)
);
END COMPONENT;

SIGNAL Decoded_Sel : STD_LOGIC_VECTOR (7 downto 0);

begin
Decode_3_to_8_0 : Decoder_3_to_8 
port map (
    I => Sel,
    EN => '1',
    Y => Decoded_Sel
);

TSB_4_Bit_0 : TSB_4_Bit
port map (
	I => I0,
	Sel => Decoded_Sel(0),
	Y => Y
);

TSB_4_Bit_1 : TSB_4_Bit
port map (
	I => I1,
	Sel => Decoded_Sel(1),
	Y => Y
);

TSB_4_Bit_2 : TSB_4_Bit
port map (
	I => I2,
	Sel => Decoded_Sel(2),
	Y => Y
);

TSB_4_Bit_3 : TSB_4_Bit
port map (
	I => I3,
	Sel => Decoded_Sel(3),
	Y => Y
);

TSB_4_Bit_4 : TSB_4_Bit
port map (
	I => I4,
	Sel => Decoded_Sel(4),
	Y => Y
);

TSB_4_Bit_5 : TSB_4_Bit
port map (
	I => I5,
	Sel => Decoded_Sel(5),
	Y => Y
);

TSB_4_Bit_6 : TSB_4_Bit
port map (
	I => I6,
	Sel => Decoded_Sel(6),
	Y => Y
);

TSB_4_Bit_7 : TSB_4_Bit
port map (
	I => I7,
	Sel => Decoded_Sel(7),
	Y => Y
);
    

end Behavioral;
