pkg load signal;
ecg = load('ECG.txt');
tamSinal = 9000;  # Definição do tamanho máximo do sinal

resultado = zeros(size(tamSinal));

for(i = 1:tamSinal)
  resultado(i) = 0;
  for(j = 1:tamSinal)
    if ((j-1)+i <= tamSinal)
      resultado(i) += ecg(j) * ecg((j-1)+i);  # Somatório do valor da autocorrelação naquele ponto
    else
      resultado(i) += 0;
    endif
  endfor
endfor

acOctave = xcorr(ecg(1:tamSinal));  # Autocorrelação do Octave para comparação
figure
plot(acOctave);

inversao = flip(resultado); # Inversão do sinal para representação

acFinal = zeros(size(2*tamSinal));
for(i = 1:(tamSinal)) # União do array original e do invertido
  acFinal(i) = inversao(i);
  acFinal(i + tamSinal) = resultado(i);
endfor

figure
plot(acFinal);  # Autocorrelação final