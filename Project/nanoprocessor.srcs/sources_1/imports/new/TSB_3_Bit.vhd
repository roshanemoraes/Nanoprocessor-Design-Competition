----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 08:23:43 PM
-- Design Name: 
-- Module Name: TSB_3_Bit - Behavioral
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

entity TSB_3_Bit is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end TSB_3_Bit;

architecture Behavioral of TSB_3_Bit is

begin

    Y <= I when (Sel = '1') else "ZZZ";

end Behavioral;
