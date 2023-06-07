----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 05:39:17 PM
-- Design Name: 
-- Module Name: TB_NanoProcessor_With_7SegOut - Behavioral
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

entity TB_NanoProcessor_With_7SegOut is
    Port ( Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       LED_out : out STD_LOGIC_VECTOR (3 downto 0);
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC;
       Cathode_7seg : out STD_LOGIC_VECTOR (3 downto 0);
       Anode_7seg : out STD_LOGIC_VECTOR (6 downto 0));
       
end TB_NanoProcessor_With_7SegOut;

architecture Behavioral of TB_NanoProcessor_With_7SegOut is

begin


end Behavioral;
