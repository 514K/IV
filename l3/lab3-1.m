# пределы интегрирования
a=0
b=1
# число узлов интегрирования
N=20
# шаг
h=(b-a)/N
# погрешность
epsilon=eps
# узлы и веса квадратурной формулы
x=h/2:h:b;
c=ones(1,N);
# неоднородность интегрального уравнения
function f=F(x)
 f = e.^(-x);
endfunction
# ядро интегрального уравнения
function K=Ker(x,t)
 K=e^(t - x);
endfunction
# аналитическое решение
ua = 1;
# начальное приближение
u=F(x);
# номер итерации
k=0;
do
 for i=1:N
 int=0;
 for j=1:i
 int+=c(j)*h*Ker(x(i),x(j))*u(j);
 endfor # j
 u1(i)=F(x(i))+int;
 endfor # i
 delta=norm(u1-u, 1)/N;
 k++;
 err=norm(u1-ua);
 printf('%i iteration, err=%g\n', k, err)
 u=u1;
until (delta<=eps)
#setenv("GNUTERM","wxt")
#graphics_toolkit("gnuplot")
plot(x, ua, 'r', x, u, 'gx')
title('Analytical and numerical solution')
xlabel('x')
ylabel('ua, un')
pause()