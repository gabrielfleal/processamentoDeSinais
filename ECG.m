% Atividade EAD

% Atividade A
ecg = load('ECG.txt');
plot(ecg);
xlim([1 9000]);

% Atividade B
[indexPeaks] = findpeaks(ecg, "DoubleSided", "MinPeakDistance", 100);

mediaTotal = mean(ecg);

for i = 1:10
  ciclo = ecg((i*900):((i+1)*900)); 
  media(i) = mean(ciclo);
endfor


% Atividade C


% Atividade D