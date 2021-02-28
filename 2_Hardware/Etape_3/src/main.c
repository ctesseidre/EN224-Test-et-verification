#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>



int main(int argc, char *argv[])
{
	printf("idata_a  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 18, 32) );\n");
	printf("idata_b  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 12, 32) );\n");
	printf("idata_en <= '1';\n");
	printf("wait 10 ns;\n");
	printf("while odata_en = '0' loop\n");
	printf("    idata_en <= '0';\n");
	printf("    wait 10 ns;\n");
	printf("end loop;\n");
	printf("ASSERT UNSIGNED( odata = TO_UNSIGNED( 6, 32) ) SEVERITY FAILURE;\n");
    return EXIT_SUCCESS;
}