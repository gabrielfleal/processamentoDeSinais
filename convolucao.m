pkg load signal;

x = [2 3 3 2 1 1.5 1.5];
y = [0.5 0.3 0.2];

tamX = length(x);
tamY = length(y);


#if (tamX > tamY)
 # sinalInvertido = flip(y);
  #resultado = zeros(1, 2 .* length(x));
#else
  sinalInvertido = flip(y);
  #resultado = zeros(1, 2 .* length(y));
#endif

#tamR = length(resultado)
#for(i = t:tamR)5:-1:1
  #for(j = tamY:-1:1)
  #  resultado(i) += x * y(j);
 # endfor
#endfor  
  


x2 = zeros (1, length(y));
x3 = cat (2, x2, x);
x3 = cat (2, x3, x2);

tamR = length(x);
resultado = zeros(1, 2 .* length(x));

  for(i = 1:length(x3))
    soma = 0;
    for(j = 1:tamX)
        if((i-1)+j < tamY)
          soma += sinalInvertido((i-1)+j) * x3(j);
        endif
    endfor
    resultado(i) = soma;
  endfor
resultado