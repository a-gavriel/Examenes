function cuad( a , b, c)
  r_delta = sqrt( b^2 - 4*a*c )
  X1 = (-b + r_delta)/(2*a)
  X2 = (-b - r_delta)/(2*a)
  
  Y1 = (-2*c)/(b + r_delta)
  Y1 = (-2*c)/(b - r_delta)
endfunction