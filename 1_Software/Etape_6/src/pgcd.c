#include "pgcd.h"

//-------------------------------------------------------------------------------------------------------------------------------------------//
void exit_if(int condition, const char *prefix)
{
    if (condition)
    {
        perror(prefix);
        exit(1);
    }
}
//-------------------------------------------------------------------------------------------------------------------------------------------//
int PGCD(int A, int B)
{
    //Test des valeurs seuil
    assert(A >= 0);
    assert(A <= 65535);
    assert(B >= 0);
    assert(B <= 65535);
    if (A == 0)
    {
        return B;
    }
    if (B == 0)
    {
        return A;
    }
    while (A != B)
    {
        if (A > B)
        {
            A = A - B;
        }
        else
        {
            B = B - A;
        }
    }
    assert(A >= 0);
    assert(A <= 65535);
    return A;
}



