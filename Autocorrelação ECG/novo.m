clear all;
ecg = load('ECG.txt'); 
pkg load signal;

janela = 1000; #trocar pra 1000
num_janelas = 2;
tamSinal = janela * num_janelas;

sinal = ecg(1:(tamSinal)); #pegando uma parte do sinal de 10 mil amostras

pronta = xcorr(sinal);
somatorio = zeros(size(sinal));
autocorr = zeros(size(sinal));

for (i=1:tamSinal)
  for(j=1:tamSinal)
    if (((j-1)+i)<=tamSinal)
    multiplica = sinal(j) * sinal((j-1)+i);
    somatorio(i) += multiplica;
    else
    somatorio(i) += 0;    
    endif
    endfor
  autocorr(i) = somatorio(i);
  endfor

figure
subplot(1,2,1);
stem(pronta)
title('Função xcorr');

corr_flip = flip(autocorr);
autocorr_final = vertcat(corr_flip,autocorr);

subplot(1,2,2);
stem(autocorr_final)
title("Função própria");