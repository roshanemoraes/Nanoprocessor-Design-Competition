----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 01:05:29 PM
-- Design Name: 
-- Module Name: P_counter_sim - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is
component Program_Counter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           res : in STD_LOGIC ;
           Q : out std_logic_vector (2 downto 0));
end component;
signal clk : STD_LOGIC := '0';
signal res : STD_LOGIC := '0';
signal D,Q : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT: Program_Counter
    port map(
        D=>D,
        clk=>clk,
        res=>res,
        Q=>Q);
        
process
begin
        clk<=not(clk);
        wait for 1ns;
end process;

process
begin        
        wait for 80ns;
        res<=not(res);
end process;

process 
begin
        D <= "000";
        wait for 10 ns;
        D <= "001";
        wait for 10 ns;
        D <= "010";
        wait for 10 ns;
        D <= "011";
        wait for 10 ns;
        D <= "100";
        wait for 10 ns;
        D <= "101";
        wait for 10 ns;
        D <= "110";
        wait for 10 ns;
        D <= "111";
        wait;
end process;

end Behavioral;
