----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2018 02:58:44 PM
-- Design Name: 
-- Module Name: TB_LUT_16_7 - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_ROM_16_17 is
    --  Port ( );
end TB_ROM_16_17;

architecture Behavioral of TB_ROM_16_17 is
    component ROM
            Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
                   data : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    signal address: STD_LOGIC_VECTOR (2 downto 0);
    signal data: STD_LOGIC_VECTOR (11 downto 0);

begin
    UUT: ROM port map(
        address => address,
        data => data
        );
    
    process begin
    
        -- testing all possible values
        test_loop : for i in 0 to 7 loop
            address <= std_logic_vector(to_unsigned(i, 3));
            wait for 100ns;
        end loop test_loop;
        wait;
        
    end process;


end Behavioral;
