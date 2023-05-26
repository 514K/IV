# пределы интегрирования
a=0
b=1
# число узлов интегрирования
N=21
disp('Метод Симпсона')
# шаг
h=(b-a)/(N-1)
# узлы и веса квадратурной формулы
x=a:h:b;
c=ones(1,N)/3;
for i=2:2:N-1
  c(i) *= 4;
end
for i=3:2:N-2
  c(i) *= 2;
end
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