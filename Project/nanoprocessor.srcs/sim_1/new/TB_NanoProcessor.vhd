----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 05:41:25 PM
-- Design Name: 
-- Module Name: TB_NanoProcessor - Behavioral
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

entity TB_NanoProcessor is
-- Port();
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is
COMPONENT NanoProcessor
Port ( 
   Clk : in STD_LOGIC;
   Reset : in STD_LOGIC;
   Overflow : out STD_LOGIC;
   Zero : out STD_LOGIC;
   R7_out : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

signal Overflow, Zero : std_logic;
signal Clk, Reset : std_logic := '1';
signal R7_out : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT : NanoProcessor
    port map(
        Clk=>Clk,
        Reset=>Reset,
        OverFlow=>Overflow,
        Zero=>Zero,
        R7_out=>R7_out);
        
process begin
    -- wait for 1ns; -- 500 MHz
    wait for 5ns; -- 100 MHz
    Clk <= not(Clk);
end process;

process begin
    WAIT FOR 200ns; -- R7_Out should be 0110
    
    Reset <= '1';
    WAIT FOR 20ns;
    
    Reset <= '0';
    WAIT;
    
end process;


end Behavioral;
