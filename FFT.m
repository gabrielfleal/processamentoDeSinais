#Fs = 1000;
#t = 0:1/Fs:1-1/Fs;
#x = cos(2*pi*100*t) + randn(size(t));
#N = length(x);
#xdft = fft(x);
#xdft = xdft(1:N/2+1);

#N=50; %Número de amostras no gráfico.
#fo = 2; %frequência do sinal x
#Ts=1/40;
#n=0:N-1;
#x=cos(2*pi*fo*n*Ts);
#fu = 10; %frequência do sinal u
#Tu = 1/100;
#y=cos(2*pi*fu*n*Tu);

x = [2, 2, 4, 4, 6];  #Sinal
N = length(x);

kernel = exp((-j*2*pi)/N);

resultado = zeros (1, N);
C = zeros (1, N);

for(i = 1:N)
  for(j = 1:N)
    resultado(i) += x(j)*(kernel^((i-1)*(j-1)));  #Cálculo do X[k]
  endfor
    C(i) = ((resultado(i) * 2)/N);  #Cálculo do sinal real C[k]
endfor

resultadoFase = angle(resultado);

subplot(3, 1, 1);
stem(abs(fft(x)));
title("FFT");

subplot(3, 1, 2);
stem(abs(resultado));
title("FFT Manual");

subplot(3, 1, 3);
stem(abs(C));
title("Sinal Real");