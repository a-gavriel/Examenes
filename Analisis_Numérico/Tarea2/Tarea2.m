1;

##################################3
#funcion: 
#sin(e^ (x²))
function funcion(x)
  lambda = 0.99;
  if !(0.1 <= lambda < 1)
    lambda = 0.5;
  endif
  
  h_i = double(1);
  i = 1;
  
  
  size = floor (-15/(log10(lambda))) 
  
  Potencias = 1:0.01:size;
  h_i = lambda .^ Potencias;
  
  x_plus = x .+ h_i;
  x_minus = x .- h_i;
  
  ###################################
  #argumento del seno, e**(x**2)
  arg = e ^ (x ^ 2);
  arg_ad = e .^ (x_plus .^ 2);
  arg_at = e .^ (x_minus .^ 2);


  ################################
  #fx
  f = sin( arg );
  f_ad = sin ( arg_ad);
  f_at = sin ( arg_at);
  
  ################################
  #derivada de fx
  fp_ad  =  (f_ad .- f)./(h_i) ;
  fp_at  =  (f .- f_at)./(h_i) ;
  fp_cen =  (f_ad .- f_at)./(2*h_i) ;
  
  fp = double(2 * x * e^((x)^ 2) * cos(e^((x)^2)) );
  
  ###########################################
  #Error relativo fraccional
  Erel_ad  =  abs((fp.-fp_ad)./fp) ;
  Erel_at  =  abs((fp.-fp_at)./fp) ;
  Erel_cen =  abs((fp.-fp_cen)./fp);
  
  hold off
  loglog(h_i,Erel_ad,'g')
  hold on
  loglog(h_i,Erel_at,'b')
  loglog(h_i,Erel_cen,'r')
  
endfunction
