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
Port ( Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
       Reg_in : in STD_LOGIC_VECTOR (3 downto 0);
       Reset : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Reg_out0 : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_out1 : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_out2 : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_out3 : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_out4 : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_out5 : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_out6 : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_out7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Reg_in : STD_LOGIC_VECTOR (3 downto 0);
signal Reset : STD_LOGIC;
signal Reg_out0, Reg_out1, Reg_out2, Reg_out3, Reg_out4, Reg_out5, Reg_out6, Reg_out7 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal Clk : STD_LOGIC := '0';
signal Reg_en : STD_LOGIC_VECTOR (2 downto 0);

begin
uut: Register_bank
        Port map (
        Reg_in => Reg_in, -- data
        Clk => Clk,
        Reset => Reset,
        Reg_en => Reg_en, 
        Reg_out0 => Reg_out0,
        Reg_out1 => Reg_out1,
        Reg_out2 => Reg_out2,
        Reg_out3 => Reg_out3,
        Reg_out4 => Reg_out4,
        Reg_out5 => Reg_out5,
        Reg_out6 => Reg_out6,
        Reg_out7 => Reg_out7);
        
process
begin  
    wait for 5ns;
    Clk <= NOT Clk;    
end process;

process
begin  

    Reg_in <= "0011"; -- From 210161F (11 0011 0100 1111 0001)
    
    -- Registers enabled according to index no:- 210390F
    --In binary:- 110 011 010 111 010 110
    
    Reg_en <= "110";
    wait for 10ns; -- R6
    
    Reg_en <= "010";
    wait for 10ns; -- R2
    
    Reg_en <= "111";
    wait for 10ns; -- R7
    
    Reg_en <= "000";
    wait for 10ns; -- R0 -- Should not be written
    
    Reg_en <= "011"; -- R3
    wait for 10ns;
    
    Reset <= '1'; 
    wait; -- All values should become 0000
    
end process;
end Behavioral;