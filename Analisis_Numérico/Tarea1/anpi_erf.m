#Ejercicio 1

function [v,ev,ea,n] = anpi_erf(x,k)
  error = "";
  mensaje = "";
  if !(isa(x,"numeric")) 
    error = " x debe ser un numero "
    break
  elseif ! (abs(mod(k,1))==0) 
    error = "k debe ser un numero entero"
    break
  elseif k<=0
    error = "k debe ser un numero entero positivo"
  elseif isa(x,"single") & k>8
    mensaje = "Para un x de tipo single, k debe tener un valor máximo de 8"
    k = 8
  elseif isa(x,"double") & k>17
    mensaje = "Para un x de tipo double, k debe tener un valor máximo de 17"
    k = 17
  endif
      
  
  
  
  aprox_actual = 0;
  aprox_anterior = 0;
  es = 0.5*10^(2-k);
  i = 0;
  ea = 1;
  while (abs(ea)>es)   
    aprox_anterior = aprox_actual;
    elemento_i = (((-1)^i)*(x^(2*i+1)))/((factorial(i))*(2*i+1));
    aprox_actual += elemento_i;
    ea = (1- (aprox_anterior/aprox_actual))*100;
    i+=1;
  endwhile
  v = aprox_actual*2/(sqrt(pi))
  valor_verdadero = erf(x)  ;
  ev = abs(1- (v/valor_verdadero))*100
  ea = abs(1- (aprox_anterior/aprox_actual))*100
  n = i-1
endfunction

