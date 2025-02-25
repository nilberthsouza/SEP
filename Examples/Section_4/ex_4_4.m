RMG_Ds = [0.0198, 0.0217, 0.0229, 0.0222, 0.0243, 0.0255, 0.0241, 0.0264, 0.0264, 0.0284,0.0289,...
    0.0304, 0.0284, 0.0306, 0.0314, 0.0327,0.0335,0.0373, 0.0352,0.0386,0.0402,0.0402,0.0415,...
    0.0436,0.0444,0.0466,0.0470,0.0494,0.0498,0.0523,0.0586];

D_ex =[0.609 0.642 0.680 0.684 0.721 0.741 0.743 0.783 0.814 0.846 0.858 0.883 0.879 0.914 0.927, ...
    0.977 0.990 1.108 1.063 1.165 1.196 1.213 1.259 1.293 1.345 1.382 1.427 1.465 1.502 1.545 1.762];


Palavra_codigo = [ "Waxwing", "Partridge", "Ostrich", "Merlin", "Linnet", "Oriole", "Chickadee", ...
    "Ibis", "Pelican", "Flicker", "Hawk", "Hen", "Osprey", "Parakeet", "Dove", "Rook", "Grosbeak",...
    "Drake","Tern", "Rail", "Cardinal", "Ortolan", "BlueJay", "Finch", "Bittern", "Pheasant", "Bobolink",...
    "Plover", "Lapwing", "Falcon", "Bluebird"];

Xa_Capacitiva = [0.1090 0.1074 0.1057 0.1055 0.1040 0.1032 0.1031 0.1015 0.1004 0.0992 0.0988 0.0980 0.0981,0.0969 0.0965,...
    0.0950 0.0946 0.0912 0.0925 0.0897 0.0890 0.0874 0.0866 0.0855 0.0847 0.0837 0.0829 0.0829 0.0822 0.0814 0.0776 ];

A3 = [0.02006 0.0326 0.0411 0.0478 0.0532 0.0577 0.0617 0.0652 0.0683 0.0711 0.0737 0.0761 0.0783 0.0803 0.0823 0.0841, ...
    0.0848 0.0874 0.0889 0.0903 0.0917 0.0930 0.0917 0.0930 0.0943 0.0955 0.0967 0.0978 0.0989 0.0999 0.1009 0.1019,...
    0.1028 0.1037 0.1046 0.1055 0.1063 0.1071 0.1079 0.1087 0.1094 0.1102 0.1109 0.1116 0.1123 0.1129 0.1136 0.1142 0.1142,...
    0.1139 0.1155
   ];

% Criando a tabela A1
A1 = table(D_ex', Palavra_codigo', Xa_Capacitiva', 'VariableNames', {'Diametro_Externo', 'Palavra_Codigo', 'Xa_Capacitiva'});

disp("1-Manter dados");
disp("2-inserir outros dados");
variavel = input("Escolha: ");


if variavel ==1
    condutor = "Ostrich";
    

    % medidas pés
    ab = 10;
    bc = 10;
    ac_ = 18;
    bb_ = 21;
    ca_ = 18;

end

if variavel ==2
    condutor = input("Insira o codigo-nome do condutor(dentro de aspas duplas): ");

    ab = input("Distancia entre os condutores a e b: ");
    bc = input("Distancia entre os condutores b e c: ");

    ac_ = input("Insira a distancia entre a e c': ");
    bb_ = input("Insira a distancia entre b e b': ");
    ca_ = input("Insira a distancia entre c e a': ");


   
end
indice = find(strcmp(A1.Palavra_Codigo, condutor));

D_ext = A1.Diametro_Externo(indice);


dist_ab = sqrt(ab^2 + 1.5^2);
dist_ab_ = sqrt(10^2 + 19.5^2);
dpab = (dist_ab*dist_ab_)^(2/4);
dpca = ((ab+bc)*ac_)^(2/4);
deq = (dpab*dpab*dpca)^(1/3);


r = D_ext/(24);

diag = sqrt((ab+bc)^2 + ac_^2);

D_p_sc =( sqrt(diag*r)*sqrt(bb_*r)*sqrt(diag*r))^(1/3);

Cn = (2*pi* 8.85* 10^(-12)) /log(deq/D_p_sc);
Bn = 2*pi*Cn*1609;
disp("A suceptancia capacitiva ao neutro por milha por fase é de : ");
disp(Bn);
