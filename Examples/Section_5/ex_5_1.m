RMG_Ds = [0.0198, 0.0217, 0.0229, 0.0222, 0.0243, 0.0255, 0.0241, 0.0264, 0.0264, 0.0284,0.0289,...
    0.0304, 0.0284, 0.0306, 0.0314, 0.0327,0.0335,0.0373, 0.0352,0.0386,0.0402,0.0402,0.0415,...
    0.0436,0.0444,0.0466,0.0470,0.0494,0.0498,0.0523,0.0586]


Palavra_codigo = [ "Waxwing", "Partridge", "Ostrich", "Merlin", "Linnet", "Oriole", "Chickadee", ...
    "Ibis", "Pelican", "Flicker", "Hawk", "Hen", "Osprey", "Parakeet", "Dove", "Rook", "Grosbeak",...
    "Drake","Tern", "Rail", "Cardinal", "Ortolan", "BlueJay", "Finch", "Bittern", "Pheasant", "Bobolink",...
    "Plover", "Lapwing", "Falcon", "Bluebird"]

resistencia= [0.3831 0.3792 0.3372 0.3037 0.3006 0.2987 0.2572 0.2551 0.2148 0.2134 0.2120 0.2107 0.1843,...
    0.1832 0.1826 0.1603 0.1596 0.1284 0.1302 0.1092 0.1082 0.1011 0.0941 0.0937 0.0832 0.0821 0.0746 ...
    0.0735 0.0678 0.0667 0.0515]

D_ex =[0.609 0.642 0.680 0.684 0.721 0.741 0.743 0.783 0.814 0.846 0.858 0.883 0.879 0.914 0.927, ...
    0.977 0.990 1.108 1.063 1.165 1.196 1.213 1.259 1.293 1.345 1.382 1.427 1.465 1.502 1.545 1.762];

Xa_Capacitiva = [0.1090 0.1074 0.1057 0.1055 0.1040 0.1032 0.1031 0.1015 0.1004 0.0992 0.0988 0.0980 0.0981,0.0969 0.0965,...
    0.0950 0.0946 0.0912 0.0925 0.0897 0.0890 0.0874 0.0866 0.0855 0.0847 0.0837 0.0829 0.0829 0.0822 0.0814 0.0776 ];


Xa_Indutiva = [0.476, 0.465, 0.458, 0.462, 0.451, 0.445,0.452,0.441,0.441,0.432,0.430,0.424,0.432,0.423,0.420,...
    0.415,0.412,0.399,0.406,0.395,0.390,0.390,0.386,0.380,0.378,0.372,0.371,0.365,0.364,0.358,0.344]

A2 = [0.0841 0.1333 0.1682 0.1953 0.2174 0.2361 0.2523 0.2666 0.2794 0.2910 0.3015 0.3112 0.3202 0.3286 0.3364 ...
    0.3438 0.3507 0.3573 0.3635 0.3694 0.3751 0. 3805 0.3856 0.3906 0.3953 0.3999 0.4043 0.4086 0.4127 0.4205 ...
    0.4243 0.4279 0.4314 0.4348 0.4382 0.4414 0.4445 0.4476 0.4506 0.4535 0.4564 0.4592 0.4619 0.4646 0.4672 0.4697 0.4722]


A3 = [0.02006 0.0326 0.0411 0.0478 0.0532 0.0577 0.0617 0.0652 0.0683 0.0711 0.0737 0.0761 0.0783 0.0803 0.0823 0.0841, ...
    0.0848 0.0874 0.0889 0.0903 0.0917 0.0930 0.0917 0.0930 0.0943 0.0955 0.0967 0.0978 0.0989 0.0999 0.1009 0.1019,...
    0.1028 0.1037 0.1046 0.1055 0.1063 0.1071 0.1079 0.1087 0.1094 0.1102 0.1109 0.1116 0.1123 0.1129 0.1136 0.1142 0.1142,...
    0.1139 0.1155
   ];


disp("1-Manter dados");
disp("2-inserir outros dados");
variavel = input("Escolha: ");


if variavel ==1
    condutor = "Rook"

    distancia_condutores = 23.8;

    comprimento_linha = 230;

    Potencia_linha_MWA = 125;

    VLL = 215000;

    fp =1;
    

end

if variavel ==2
    condutor = input("Insira o codigo-nome do condutor(dentro de aspas duplas): ");

    distancia_condutores = input("Insira a distancia entre os condutores");

    comprimento_linha = input("insira o comprimento da linha: ");

    Potencia_linha_MWA = input("insira a potencia em MWA: ")

    VLL = input("Insira a tensão de linha-linha da Linha de Transmissão: ");

    fp = input("Insira o fator de potencia da linha: ");


   
end

indice = find(strcmp(Palavra_codigo, condutor));

D_equivalente = round((distancia_condutores*distancia_condutores*2*distancia_condutores)^(1/3));

Z_real = resistencia(indice);

Xa = Xa_Indutiva(indice);
Xd = A2(D_equivalente);

Z_imag = Xa+Xd;

Z = Z_real + Z_imag*1j;
Z_degree = complex_to_polar(Z);

fprintf('A impedância da LT é %.4e + j %.4e\n', Z_real, Z_imag);
fprintf("A impedancia da LT é %.4e  ∠ %.2f",Z_degree(1),Z_degree(2))

Xa_c = Xa_Capacitiva(indice);
xd_c = A3(D_equivalente);
Xc = (Xa_c+ xd_c)*10^6 ;

% A admitância capacitiva

Y = (1/Xc)*1j;
Y_degree = complex_to_polar(Y);

fprintf("\nA admitancia em derivação é %.4e \n",imag(Y));
fprintf("A admitancia em derivação é %.4e ∠ %.2f \n",Y_degree(1),Y_degree(2));


% Constante de propagação
gamma = sqrt(Z*Y);
gamma_degree = complex_to_polar(Y);

fprintf("\nA constante de propagação  é: %.4e \n",gamma);
fprintf("A constante de derivacao  é: %.4e ∠ %.2f \n",gamma_degree(1),gamma_degree(2));



% impedancia caracteristica 
Z_c = sqrt(Z/Y);
Z_c_degree = complex_to_polar(Z_c);

fprintf("\n A impedancia caracteristica é: %.4e \n",Z_c);

fprintf("A impedancia caracteristica é: %.4e ∠ %.2f \n",Z_c_degree(1),Z_c_degree(2));


% Tensão Linha neutro na Barra receptora
Vr = VLL/sqrt(3);
Vr_degree = complex_to_polar(Vr);

fprintf("\n A tensão ao neutro da Barra Receptora é %.4e \n",Vr);

fprintf("A tensão na Barra receptora é %.4e ∠ %.2f \n",Vr_degree(1),Vr_degree(2));

% Corrente na barra receptora
Ir = (Potencia_linha_MWA*10^6)/(sqrt(3)*VLL);
Ir_degree = complex_to_polar(Ir);

fprintf("\n A corrente Barra Receptora é %.4e \n",Ir);
fprintf("A corrente Receptora é %.4e ∠ %.2f\n", Ir_degree(1),Ir_degree(2));


A = cosh(gamma*comprimento_linha);
D = A;
B = Z_c*sinh(gamma*comprimento_linha);
C = (1/Z_c)*sinh(gamma*comprimento_linha);

%Tensão na barra transmissora
Vs = A*Vr + B*Ir;
Vs_degree = complex_to_polar(Vs);

Is = C*Vr + D*Ir;
Is_degree = complex_to_polar(Is);

fprintf("\n A tensão Vs %.4e \n",Vs);
fprintf("A tensão na Vs é %.4e ∠ %.2f \n",Vs_degree(1),Vs_degree(2));

fprintf("\n A tensão Is %.4e \n",Vs);
fprintf("A tensão na Is é %.4e ∠ %.2f \n",Is_degree(1),Is_degree(2));

Vsll = sqrt(3)*Vs_degree(1);
fprintf("\n tensão de linha na barra transmissora é %.4e V",Vsll(1));

% fator de potencia barra transmissora
fp_t = cos(((Vs_degree(2)*pi)/360) - ((Is_degree(2)*pi)/360));

fprintf("\n O fator de potência na barra transmissora %.f",fp_t)

% potencia barra de transmissora
Potencia_Bus_Vr = sqrt(3)*Vsll(1)*Is_degree(1)*fp_t;
fprintf("\n A potência trifásica na barra transmissora %e",Potencia_Bus_Vr );














   


