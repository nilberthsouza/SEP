

disp("Exemplo 3.2 - Um circuito de uma linha de transmissão monofásico é composto de três fios sólidos de 0.25cm " + ...
    "de raios. O circuito de retorno é composto de dois fios de 0.5cm de raio. A disposição dos condutores é mostrada " + ...
    "na figura 3.9. Determine a indutância devido à corrente em cada lado da linha e a indutância da linha completa em" + ...
    " henrys/metro (e em milihenrys por milha)");

disp("Você deseja inserir novos dados ou manter os dados do exemplo:")
disp("1- Manter Dados");
disp("2- Entrar com novos dados");

variavel = input("Escolha: ");

if variavel == 1
    % Determinemos a DMG entre os lados X e Y
    D_ad = 9;
    D_ab = 6;
    raio_fase = 0.25;
    raio_retorno = 0.5;
end

if variavel == 2
    D_ad = input("Entre com a distancia entre o circuito de fase e de retorno: ");
    D_ab = input("Entre com a distancia entre os condutores de fase: ");
    raio_fase = input("Entre com o raio dos condutores de fase em cm: ");
    raio_retorno = input("Entre com o raio dos condutores de retorno em cm");

end

D_ae = ((D_ab^2) + (D_ad^2))^(1/2);
D_cd = ((D_ad^2)+(2*D_ab)^2)^(1/2);
Dm = ((D_ad^2) * D_cd * (D_ae^3) )^(1/6);
disp("A DMG entre os lados X e Y é: ");
disp(Dm);
       
% Para o RMG do lado X
D_s1 = (((raio_fase*0.7788*10^-2)^3)*(D_ab^4)*((2*D_ad)^2))^(1/9);
disp("O raio médio geometrico para o lado X: ");
disp(D_s1);

% Para o RMG do lado Y
D_s2 = ((raio_retorno*0.7788*10^-2)^2 * D_ad^2)^(1/4);
disp("O raio médio geometrico para o lado Y: ");
disp(D_s2);

% Indutancia L_x 
Lx = 2*10^-7*log(Dm/D_s1);
disp("A indutância de Lx: ");
disp(Lx);

Ly = 2*10^-7*log(Dm/D_s2);
disp("A indutância de Ly");
disp(Ly);

L = Lx + Ly ;

disp("A indutâncoa total é: ");
disp(L);

