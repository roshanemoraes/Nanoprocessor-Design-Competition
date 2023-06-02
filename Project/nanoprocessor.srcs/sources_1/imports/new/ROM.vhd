----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2022 01:55:18 PM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
signal twelveSegment_ROM : rom_type := (
 "101110000000", -- MOVI R7, 0
 "101100000011", -- MOVI R6, 3
 "101010000001", -- MOVI R5, 1
 "011010000000", -- NEG R5
 "001111100000", -- ADD R7, R6
 "001101010000", -- ADD R6, R5
 "111100000110", -- JZR R6, 6
 "110000000100" -- JZR R0, 4
 );
 
begin
data <= twelveSegment_ROM(to_integer(unsigned(address)));
end Behavioral;