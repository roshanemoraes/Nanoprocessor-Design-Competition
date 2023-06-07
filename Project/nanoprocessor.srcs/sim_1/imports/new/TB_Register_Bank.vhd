----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/28/2022 02:15:13 AM
-- Design Name: 
-- Module Name: TB_register_bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

component Register_Bank
port (data : in STD_LOGIC_VECTOR (3 downto 0);
       clk : in STD_LOGIC;
       en : in STD_LOGIC_VECTOR (2 downto 0);
       r0 : out STD_LOGIC_VECTOR (3 downto 0);
       r1 : out STD_LOGIC_VECTOR (3 downto 0);
       r2 : out STD_LOGIC_VECTOR (3 downto 0);
       r3 : out STD_LOGIC_VECTOR (3 downto 0);
       r4 : out STD_LOGIC_VECTOR (3 downto 0);
       r5 : out STD_LOGIC_VECTOR (3 downto 0);
       r6 : out STD_LOGIC_VECTOR (3 downto 0);
       r7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal data : STD_LOGIC_VECTOR (3 downto 0);
signal r0, r1, r2, r3, r4, r5, r6, r7 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal clk : STD_LOGIC := '0';
signal en : STD_LOGIC_VECTOR (2 downto 0);

begin
uut: Register_bank
        Port map (
        data=>data,
        clk=>clk, 
        en=>en, 
        r0=>r0, 
        r1=>r1, 
        r2=>r2, 
        r3=>r3, 
        r4=>r4, 
        r5=>r5,
        r6=>r6, 
        r7=>r7);
        
process
begin  
    wait for 5ns;
    clk <= NOT clk;    
end process;

process
begin  
    data <= "1011";
    
    --Index no:- 210390F
    --In binary:- 110 011 010 111 010 110
    
    en <= "110";
    wait for 20ns; -- 
    
    en <= "010";
    wait for 20ns;
    
    en <= "111";
    wait for 20ns;
    
    en <= "011";
    wait;
    
end process;
end Behavioral;