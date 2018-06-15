x = [2 3 3 2 1 1.5 1.5];
y = [0.5 0.3 0.2];

tamX = length(x);
tamY = length(y);
tamFinal = tamX + tamY; #Tamanho do vetor resultante

resultado = zeros(1, tamFinal);
sinalInvertido = flip(y);

for (i = 1:tamFinal)
  for(j = tamY:-1:1)
    if (j + (i - tamY) <= tamX && j + (i - tamY) >= 1)
      resultado(i) += x(j + (i - (tamY))) * sinalInvertido(j);  #Multiplicação de cada ponto; Y "parado"; X "shift"
    else
      resultado(i) += 0;
    endif
  endfor
endfor

resultado

figure(1);
subplot(2, 1, 1);
stem(conv2(x,y));
title("Convolução Octave");

subplot(2, 1, 2);
stem(resultado);
title("Convolução Manual");