----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2021 16:04:45
-- Design Name: 
-- Module Name: PGCD - Behavioral
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

entity PGCD is
    Port ( 
        CLK      : in  STD_LOGIC;
        RESET    : in  STD_LOGIC;

        idata_a  : in  STD_LOGIC_VECTOR (31 downto 0);
        idata_b  : in  STD_LOGIC_VECTOR (31 downto 0);
        idata_en : in  STD_LOGIC;

        odata    : out STD_LOGIC_VECTOR (31 downto 0);
        odata_en : out STD_LOGIC
    );
end PGCD;

architecture Behavioral of PGCD is

    type state is (idle, st1, st2);
    signal current_state, next_state : state;
    signal end_pgcd_calcul : std_logic := '0';
    signal data_a, data_b : unsigned(31 downto 0);

begin

    -- Process mémorisation des états
    memorisation : process(CLK, RESET)
    begin
        if(RESET = '0') then
            current_state <= idle;
        elsif rising_edge(CLK) then
            current_state <= next_state;
        end if;
    end process;

    -- Process évolution des états
    evolution : process(current_state, idata_en, end_pgcd_calcul)
    begin
        case current_state is
            when idle =>
                if idata_en = '1' then

                    -- Vérification des valeurs d'entrée
                    assert unsigned(idata_a) >= to_unsigned(0, 32) report "idata_a negatif" severity failure;
                    assert unsigned(idata_a) <= to_unsigned(65535, 32) report "idata_a trop haut" severity failure;
                    assert unsigned(idata_b) >= to_unsigned(0, 32) report "idata_b negatif" severity failure;
                    assert unsigned(idata_b) <= to_unsigned(65535, 32) report "idata_b trop haut" severity failure;

                    next_state <= st1;
                else
                    next_state <= idle;
                end if;

            when st1 =>
                if end_pgcd_calcul = '1' then
                    next_state <= st2;
                else
                    next_state <= st1;
                end if;
            
            when st2 => 
                next_state  <= idle;

            when others =>
                next_state <= idle;
        end case;
    end process;

        -- Process calcul du PGCD
    mise_a_jour_sorties : process(current_state, idata_a, idata_b, data_a, data_b)
    begin
        if(current_state = idle) then

            odata_en    <= '0';
            odata       <= (others=>'0');
            data_a      <= unsigned(idata_a);
            data_b      <= unsigned(idata_b);
            
        elsif(current_state = st1) then

            if (data_a = x"00000000") then
                data_a <= data_b;
                end_pgcd_calcul <= '1';

            elsif (data_b = x"00000000") then
                end_pgcd_calcul <= '1';

            elsif (data_a > data_b) then
                data_a <= data_a - data_b;

            elsif (data_a < data_b) then
                data_b <= data_b - data_a;

            elsif (data_a = data_b) then
                end_pgcd_calcul <= '1';

            end if ;            

        elsif (current_state = st2) then
            
            end_pgcd_calcul <= '0';
            odata <= std_logic_vector(data_a);
            odata_en <= '1';

        end if;
    end process;

end Behavioral;