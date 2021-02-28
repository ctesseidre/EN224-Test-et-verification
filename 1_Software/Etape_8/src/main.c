#include "pgcd.h"

/*-------------------------------------------------------------------------------------------------------------------------------------------//
****************************************************Main***************************************************************************************
//-------------------------------------------------------------------------------------------------------------------------------------------*/
int main(int argc, char *argv[])
{
  printf("(II) Starting program\n");
  // Déclaration & Initialisation des variables
  FILE *fd = fopen("src/matlab_values.txt", "r");
  exit_if(fd == NULL, "Erreur los de l'ouverture du fichier");
  int A, B, rslt_PGCD_matlab, rslt_PGCD;
  int flag = 0;

  while(fscanf(fd, "%d %d %d", &A, &B, &rslt_PGCD_matlab)!=EOF)
  {
    rslt_PGCD = PGCD(A, B);
    if (rslt_PGCD_matlab != rslt_PGCD){
      printf("Test KO : A = %d B = %d Matlab = %d C = %d\n", A, B, rslt_PGCD_matlab, rslt_PGCD);
      flag = 1;
    }
  }
  flag==1 ? printf("Tests Failed\n") : printf("All tests succed\n");
  fclose(fd);

  printf("(II) End of program\n");
  return 0;
}
