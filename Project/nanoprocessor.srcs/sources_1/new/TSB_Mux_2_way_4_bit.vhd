----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 02:10:13 PM
-- Design Name: 
-- Module Name: TSB_Mux_2_way_4_bit - Behavioral
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

entity TSB_Mux_2_way_4_bit is
PORT (
    I0 : in STD_LOGIC_VECTOR (3 downto 0);
    I1 : in STD_LOGIC_VECTOR (3 downto 0);
    Sel : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (3 downto 0)
);
end TSB_Mux_2_way_4_bit;

architecture Behavioral of TSB_Mux_2_way_4_bit is

COMPONENT TSB_4_Bit 
PORT (
    I : in STD_LOGIC_VECTOR (3 downto 0);
    Sel : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (3 downto 0)
);
END COMPONENT;

begin

TSB_4_Bit_0 : TSB_4_Bit
port map (
	I => I0,
	Sel => Sel,
	Y => Y
);

TSB_4_Bit_1 : TSB_4_Bit
port map (
	I => I1,
	Sel => Sel,
	Y => Y
);

end Behavioral;
