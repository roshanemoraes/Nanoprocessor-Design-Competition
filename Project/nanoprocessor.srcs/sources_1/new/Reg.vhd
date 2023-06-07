----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 04:22:01 PM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           En : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0) := "0000");
end Reg;

architecture Behavioral of Reg is

begin
    
    -- OLD CODE
    -- Q <= D when (rising_edge(Clk) AND En = '1');
    
    process (Clk,Reset,EN) begin
       if Reset = '1' then
           Q <= "0000";
       elsif (rising_edge(Clk)) then  -- respond when clock rises
          if EN ='1' then
               Q <= D;
          end if;
       end if;
    end process;

end Behavioral;
