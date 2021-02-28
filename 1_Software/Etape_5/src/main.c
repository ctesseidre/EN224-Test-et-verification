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
  assert(A>=0);
  assert(A<=65535);
  return A;
}
//-------------------------------------------------------------------------------------------------------------------------------------------//
int another_PGCD (int A, int B){

  int pgcd;

  for(int i=1; i <= A && i <= B; ++i)
  {
      if(A%i==0 && B%i==0)
          pgcd = i;
  }

  return pgcd;
}
//-------------------------------------------------------------------------------------------------------------------------------------------//
int RandAB(){
  return rand()%65536;
}

/*-------------------------------------------------------------------------------------------------------------------------------------------//
****************************************************Main***************************************************************************************
//-------------------------------------------------------------------------------------------------------------------------------------------*/
int main (int argc, char * argv []){
	printf("(II) Starting program\n");

  // Déclaration des variables
  int A,B;
  const int NB_ITE = 65536;
  int pgcd1, pgcd2;
  // Génération de NB_ITE valeurs aléatoires entre 0 et 65536 + PGCD
  for(int i = 0; i<NB_ITE; i++){
    A = RandAB();
    B = RandAB();
    pgcd1 = PGCD(A, B);
    pgcd2 = another_PGCD(A, B);
    assert(pgcd1 == pgcd2);
  }

	printf("(II) End of program\n");
  return 0;
}
