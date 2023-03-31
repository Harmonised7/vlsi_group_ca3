library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary16_to_decimal_4x4 is
port
(
    input_binary : in  integer range 0 to 9999;
    output_decimal : out std_logic_vector(15 downto 0)
);
end entity binary16_to_decimal_4x4;

architecture rtl of binary16_to_decimal_4x4 is
begin

process(input_binary)
        variable temp_num : integer range 0 to 9999 := input_binary;
        variable digit : integer;
        variable quotient : integer;
        variable divisor : integer := 1000;
    begin
        for i in 0 to 3 loop
            digit := temp_num / divisor;
            quotient := temp_num - digit * divisor;
            temp_num := quotient;
            divisor := divisor / 10;
            output_decimal(i*4+3 downto i*4) <= std_logic_vector(to_unsigned(digit, 4));
        end loop;
    end process;

end architecture rtl;