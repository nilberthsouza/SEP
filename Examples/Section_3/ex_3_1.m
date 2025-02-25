
disp("Você deseja inserir novos dados ou manter os dados do exemplo:")
disp("1- Manter Dados");
disp("2- Entrar com novos dados");

variavel = input("Escolha: ");

if variavel == 1
     p = 17;   %resistividade
     l = 1000; %comprimento
     area = 1113*10^3; % Area Cmil

     R_ca50 = 0.0956;  %Resistencia em Corrente alternada 50;

     T = 228
    
   
end

if variavel == 2
    disp("Qual tipo de condutor? :")
    disp("1- Cobre");
    disp("2- Aluminio");

    cond = input("Escolha: ");

    if cond == 1
        p = 10.66;
    end
    if cond == 2
        p = 17;
    end

    if cond == 1
        T = 234.5; %Cobre recozido com 100% de condutividade
    end

    if cond == 2
        T = 228; %aluminio com 61% de condutividade
    end
    l = 1000;
    area = input("insira a Area do condutor em cmil: ");

    R_ca50 = input("insira a resistencia CA a 50º C por milha: ");
  
end

R_zero = ((p*l)/area)*1.02;

dispRzero = sprintf("Para 20ºC CC a resistencia é: %d ohms por 1000pes", R_zero);

disp(dispRzero);

R_cc50 = R_zero*((T+50)/(T+20));

disp50cc = sprintf("Para 50ºC CC a resistencia é %d Ohms por 1000pés",R_cc50);
disp(disp50cc);

disprel = sprintf("A relação entre as resistencia CA e CC é %d", R_ca50/(R_cc50*5.280));
disp(disprel);
