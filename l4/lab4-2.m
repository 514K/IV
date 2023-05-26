clear
clf
function y = g(x, c)
 y = sin(x) * cot((x-c) / 2);
endfunction
a=0
b=2*pi
n=10
h=(b-a)/(n+1)
x=(a+h):h:(b-h);
c=(a+h/2):h:b;
inta=2*pi*cos(c);
for m=1:n+1
 int(m)=0;
 for k=1:n
 int(m)+=g(x(k), c(m))*h;
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