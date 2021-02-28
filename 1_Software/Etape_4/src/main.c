#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "assert.h"

//-------------------------------------------------------------------------------------------------------------------------------------------//
void exit_if(int condition, const char *prefix)
{
    if (condition) {
        perror(prefix);
        exit(1);
    } 
}
//-------------------------------------------------------------------------------------------------------------------------------------------//
int PGCD(int A, int B)
{
	//Test des valeurs seuil
	assert(A>=0);
  assert(A<=65535);
	assert(B>=0);
  assert(B<=65535);
  
  if(A == 0){
    return B;
  } 
  if(B == 0) {
    return A;
  }
  while(A!=B){
    if(A>B){
      A = A - B;
    } else {
      B = B - A;
    }
  }
  return A;
}

/*-------------------------------------------------------------------------------------------------------------------------------------------//
****************************************************Main***************************************************************************************
//-------------------------------------------------------------------------------------------------------------------------------------------*/
int main (int argc, char * argv []){
	printf("(II) Starting program\n");


	// Same value
	//printf("Rslt A=5 et B=5 : %d\n",PGCD(5, 5));
	// Normal values
	// printf("Rslt A=8 et B=6 : %d\n",PGCD(8, 6));
	// Same value equal to 0
	// printf("Rslt A=0 et B=0 : %d\n",PGCD(0, 0));
	// // Valeur max
	// printf("Rslt A=65535 et B=5 : %d\n",PGCD(65535, 5));
	// //B negativ
	printf("Rslt A=5 et B=-6 : %d\n",PGCD(5, -6));
	// // A = 0
	// printf("Rslt A=0 et B=5 : %d\n",PGCD(0, 5));


	printf("(II) End of program\n");
  return 0;
}
