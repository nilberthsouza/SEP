% Exemplo 5.2 - Cálculo da tensão e corrente na barra transmissora usando PU

% Definição das bases
S_base = 125e6; % 125 MVA
V_base = 215e3; % 215 kV
Z_base = (V_base^2) / S_base; % Impedância base
I_base = S_base / (sqrt(3) * V_base); % Corrente base

% Parâmetros da linha em PU
Z_c = 406.4 * exp(-1j * deg2rad(5.48)) / Z_base; % Impedância característica
V_R_pu = 1.0; % Tensão na carga em PU
I_R_pu = 1.0; % Corrente na carga em PU (FP = 1)

% Constantes calculadas no Exemplo 5.1
cosh_gamma_l = 0.8904 * exp(1j * deg2rad(1.34));
sinh_gamma_l = 0.4596 * exp(1j * deg2rad(84.94));

% Cálculo da tensão na barra transmissora em PU
V_S_pu = V_R_pu * cosh_gamma_l + I_R_pu * Z_c * sinh_gamma_l;

% Cálculo da corrente na barra transmissora em PU
I_S_pu = I_R_pu * cosh_gamma_l + (V_R_pu / Z_c) * sinh_gamma_l;

% Conversão para valores reais
V_S = V_S_pu * V_base; % Tensão na barra transmissora (linha)
I_S = I_S_pu * I_base; % Corrente na barra transmissora

% Exibição dos resultados
disp(['Tensão na barra transmissora: ', num2str(abs(V_S)/1e3), ' kV']);
disp(['Ângulo da tensão: ', num2str(angle(V_S) * (180/pi)), ' graus']);
disp(['Corrente na barra transmissora: ', num2str(abs(I_S)), ' A']);
disp(['Ângulo da corrente: ', num2str(angle(I_S) * (180/pi)), ' graus']);
