clear
clf
function y = g(x, c)
 y = sqrt(1-x.^2);
endfunction
a=-1
b=1
n=10
h=(b-a)/(n+1)
x=(a+h):h:(b-h);
c=(a+h/2):h:b;
inta=-pi*c;
for m=1:n+1
 int(m)=0;
 for k=1:n
 int(m)+=g(x(k), c(m))*h/cot((x(k)-c(m))/2);
 endfor # k
endfor # m

# setenv("GNUTERM","wxt")
# graphics_toolkit("gnuplot")
plot(c, inta, 'r', c, int, 'gx')
title('Analytical and numerical solution')
xlabel('c')
ylabel('Ia, In')
pause()
# абсолютная погрешность
delta=inta-int;
err=norm(delta);
printf('Ошибка err=%g\n', err)
plot(c, delta, 'b')
title('Absolute error')
xlabel('c')
ylabel('error')
pause()