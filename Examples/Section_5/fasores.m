clc;
clear;
close all;

% Solicita ao usuário as entradas em coordenadas polares [magnitude, fase]
Vs_polar = input('Digite Vs em coordenadas polares [magnitude, fase (graus)]: ');
Vr_polar = input('Digite Vr em coordenadas polares [magnitude, fase (graus)]: ');
A_polar = input('Digite A da linha em coordenadas polares [magnitude, fase (graus)]: ');
B_polar = input('Digite B da linha em coordenadas polares [magnitude, fase (graus)]: ');

% Converte para forma retangular
Vs = Vs_polar(1) * exp(1j * deg2rad(Vs_polar(2)));
Vr = Vr_polar(1) * exp(1j * deg2rad(Vr_polar(2)));
A = A_polar(1) * exp(1j * deg2rad(A_polar(2)));
B = B_polar(1) * exp(1j * deg2rad(B_polar(2)));

% Calcula os componentes dos fasores
IR = Vr / B;
Is = (Vs - A * Vr) / B;

% Plota os fasores
figure;
quiver(0, 0, real(Vs), imag(Vs), 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
hold on;
quiver(0, 0, real(Vr), imag(Vr), 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
quiver(0, 0, real(IR), imag(IR), 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
quiver(0, 0, real(Is), imag(Is), 'm', 'LineWidth', 2, 'MaxHeadSize', 0.5);

grid on;
axis equal;
legend('Vs', 'Vr', 'IR', 'Is');
title('Diagrama Fasorial');
xlabel('Parte Real');
ylabel('Parte Imaginária');