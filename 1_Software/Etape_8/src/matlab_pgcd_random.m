close all;
clc;

%% Traitement du fichier texte PGCD
fd = fopen('matlab_values.txt','w+');
for i = 1:65535
    A = randi([0 65535],1,1);
    B = randi([0 65535],1,1);
    fprintf(fd, "%d %d %d\n", A, B, gcd(A, B));
end
fclose(fd) ;



