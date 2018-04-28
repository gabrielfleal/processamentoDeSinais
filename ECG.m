% Atividade EAD

% Atividade A
ecg = load('ECG.txt');
plot(ecg);
xlim([1 9000]);

% Atividade B
[indexPeaks] = findpeaks(ecg, "DoubleSided", "MinPeakDistance", 100);

mediaTotal = mean(ecg(1:9000));

for i = 1:10
  ciclo = ecg((i*900):((i+1)*900)); 
  media(i) = mean(ciclo);
endfor

figure;
stem(mediaTotal, 'filled', 'LineStyle', 'none');  % Média de cada ciclo
hold on
plot(media);  % Média total do sinal
plot(media, "o", "markersize", 10);
hold off;
xlim([1 11]);


% Atividade C
[indexPeaks] = findpeaks(ecg, "DoubleSided", "MinPeakDistance", 100);

desvioTotal = std(ecg(1:9000));

for i = 1:10
  ciclo = ecg((i*900):((i+1)*900)); 
  desvio(i) = std(ciclo);
endfor

figure;
stem(desvioTotal, 'filled', 'LineStyle', 'none');  % Média de cada ciclo
hold on
plot(desvio);  % Média total do sinal
plot(desvio, "o", "markersize", 10);
hold off;
xlim([1 11]);

% Atividade D
% Observando os graficos gerados da media e variancia, podemos observar que
% esses valores nao variam muito ao longo dos ciclos, fazendo deste sinal um 
% sinal Estacionario e Ergodico.