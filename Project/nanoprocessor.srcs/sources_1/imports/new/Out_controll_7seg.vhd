

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Out_control_7seg is
    Port ( R7_out : in STD_LOGIC_VECTOR (3 downto 0);
           Anode_out : out STD_LOGIC_VECTOR (3 downto 0);
           Cathode_out : out STD_LOGIC_VECTOR (6 downto 0));
end Out_control_7seg;

architecture Behavioral of Out_control_7seg is
   
    component LUT_16_7
        Port ( Addr : in STD_LOGIC_VECTOR (3 downto 0);
               Data : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal S_7seg:std_logic_vector(6 downto 0);
    
begin
    LUT_16_7_0:LUT_16_7
            port map(
                    Addr=>R7_out,
                    Data=>S_7Seg    ); 
                Anode_out<="1110";
                Cathode_out<=S_7Seg;   

end Behavioral;
