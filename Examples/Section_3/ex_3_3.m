RMG_Ds = [0.0198, 0.0217, 0.0229, 0.0222, 0.0243, 0.0255, 0.0241, 0.0264, 0.0264, 0.0284,0.0289,...
    0.0304, 0.0284, 0.0306, 0.0314, 0.0327,0.0335,0.0373, 0.0352,0.0386,0.0402,0.0402,0.0415,...
    0.0436,0.0444,0.0466,0.0470,0.0494,0.0498,0.0523,0.0586]


Palavra_codigo = [ "Waxwing", "Partridge", "Ostrich", "Merlin", "Linnet", "Oriole", "Chickadee", ...
    "Ibis", "Pelican", "Flicker", "Hawk", "Hen", "Osprey", "Parakeet", "Dove", "Rook", "Grosbeak",...
    "Drake","Tern", "Rail", "Cardinal", "Ortolan", "BlueJay", "Finch", "Bittern", "Pheasant", "Bobolink",...
    "Plover", "Lapwing", "Falcon", "Bluebird"]

Xa_Indutiva = [0.476, 0.465, 0.458, 0.462, 0.451, 0.445,0.452,0.441,0.441,0.432,0.430,0.424,0.432,0.423,0.420,...
    0.415,0.412,0.399,0.406,0.395,0.390,0.390,0.386,0.380,0.378,0.372,0.371,0.365,0.364,0.358,0.344]

A2 = [0 0.0841 0.1333 0.1682 0.1953 0.2174 0.2361 0.2523 0.2666 0.2794 0.2910 0.3015 0.3112 0.3202 0.3286 0.3364 ...
    0.3438 0.3507 0.3573 0.3635 0.3694 0.3751 0. 3805 0.3856 0.3906 0.3953 0.3999 0.4043 0.4086 0.4127 0.4205 ...
    0.4243 0.4279 0.4314 0.4348 0.4382 0.4414 0.4445 0.4476 0.4506 0.4535 0.4564 0.4592 0.4619 0.4646 0.4672 0.4697 0.4722]

A1 = table(RMG_Ds', Palavra_codigo', Xa_Indutiva', 'VariableNames', {'RMG_Ds', 'Palavra_Codigo', 'Xa_Indutiva'});

disp("Você deseja usar os dados do Exemplo 3.3 ou inserir novas informações");

disp("1-Manter dados");
disp("2-inserir outros dados");
variavel = input("Escolha: ");

if variavel == 1
    Ds = 0.0217;
    dist_pes = 20;
    
end

if variavel == 2
    condutor = input('Digite a palavra a ser procurada: ', 's');
    indice = find(strcmp(A1.Palavra_Codigo, condutor));
    Ds = A1.RMG_Ds(indice);
    dist_pes = input("Entre com a distancia entre os centros dos cabos em pés: ");

end

X_L = 2.022*(10^-3)*60*log(dist_pes/Ds);
disp("X_L = ");
disp(X_L);

if variavel == 1
    disp("O valor da reatância indutiva para 1 pé de afastamento");
    disp("Para o condutor Patridge: X_a = 0.456 ohms/milha");
    disp(["A reatancia indutiva de um cabo é então: ",0.465+0.3635,"ohm's/mi"]);
    disp(["Como a linha é composta de dois cabos ","idêntico, a reatância indutiva da linha será: ",2*(0.465+0.3635),"ohms/mi"])
    
end

if variavel == 2
    disp(["O valor dá reatancia indutiva para 1 pé de afastamento"]);
    disp(["Para o condutor ",condutor," X_a = ",A1.Xa_Indutiva(round(indice)), "ohms/milha"]);
    disp(["A reatancia indutiva de um cabo é então: ",A1.Xa_Indutiva(round(indice))+A2(dist_pes),"ohms/mi"]);
    disp(["Como a linha é composta de dois cabos", "idêntico, a reatância indutiva da linha será: ",2*(A1.Xa_Indutiva(round(indice))+A2(dist_pes)),"ohms/mi"])

   
end





