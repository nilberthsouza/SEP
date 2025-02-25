function polar_vector = complex_to_polar(z)
  % Recebe um número complexo 'z' e retorna um vetor com a forma polar: [magnitude, ângulo (graus)].

  % Calcula a magnitude (módulo) do número complexo.
  magnitude = abs(z);

  % Calcula o ângulo em radianos.
  angulo_rad = angle(z);

  % Converte o ângulo de radianos para graus.
  angulo_graus = rad2deg(angulo_rad);

  % Retorna um vetor com a magnitude e o ângulo em graus.
  polar_vector = [magnitude, angulo_graus];
end
