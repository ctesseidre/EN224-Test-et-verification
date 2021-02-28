#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include "catch.hpp"
#include "pgcd.h"

TEST_CASE( "PGCD fonctionnement normal", "[PGCD1]" ) {

    SECTION ("A > B"){
        REQUIRE( PGCD(8,6) == 2 );
        REQUIRE( PGCD(65535,5) == 5 );
    }

    SECTION ("A < B"){
        REQUIRE( PGCD(5,10) == 5 );
        REQUIRE( PGCD(24,56) == 8 );
        REQUIRE( PGCD(0,12) == 12 );
    }

    SECTION ("A == B"){
        REQUIRE( PGCD(5,5) == 5 );
        REQUIRE( PGCD(12,12) == 12 );
    }
}

TEST_CASE( "PGCD fonctionnement anormal", "[PGCD2]" ) {
    SECTION ("A > B"){
        REQUIRE( PGCD(8,0) == 8 );
    }

    SECTION ("A < B"){
        REQUIRE( PGCD(0,10) == 10 );
        // REQUIRE( PGCD(12,6) == 4 );
        REQUIRE( PGCD(12,6) == 2 );
    }

    SECTION ("A == B"){
        REQUIRE( PGCD(0,0) == 0 );
    }

    SECTION ("Errors"){
        REQUIRE( PGCD(12,3) == 5 );
        
    }
}



