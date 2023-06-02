----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 10:50:11 PM
-- Design Name: 
-- Module Name: TB_Adder - Behavioral
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

entity TB_Adder is
--  Port ( );
end TB_Adder;

architecture Behavioral of TB_Adder is

COMPONENT Adder
    Port ( Addr : in STD_LOGIC_VECTOR (2 downto 0);
       Addr_out : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

SIGNAL A, S : std_logic_vector (2 downto 0);

begin
UUT : Adder
    port map (
        Addr => A,
        Addr_out => S);
        
process begin
        A <= "000";
        wait for 10 ns;
        A <= "001";
        wait for 10 ns;
        A <= "010";
        wait for 10 ns;
        A <= "011";
        wait for 10 ns;
        A <= "100";
        wait for 10 ns;
        A <= "101";
        wait for 10 ns;
        A <= "110";
        wait for 10 ns;
        A <= "111";
        wait for 10 ns;
        wait;
end process;

end Behavioral;
