lambda=0.5
exp(1)
# пределы интегрирования
a=0
b=1
# число узлов интегрирования
N=20
# шаг
h=(b-a)/N
# узлы и веса квадратурной формулы
x=h/2:h:b;
c=ones(1,N);
# неоднородность интегрального уравнения
function f=F(x)
 f=exp(-x);
endfunction
# ядро интегрального уравнения
function K=Ker(x,t)
 K = x*exp(t);
endfunction
# аналитическое решение
ua=x+exp(-x);
for i=1:N
 for j=1:N
 if (i~=j) A(i,j)=-lambda*c(j)*h*Ker(x(i),x(j));
 else A(i,j)=1-lambda*c(j)*h*Ker(x(i),x(j));
 end
 end
 b(i)=F(x(i));
end
un=A\b';
delta=norm(un'-ua, 2);
printf("Погрешность delta=%g\n", delta)
plot(x, ua, "r", "linewidth", 2, x, un, "gx",
"linewidth", 2)
set(gca, "fontsize", 12)
title('Analytical and numerical solution')
xlabel('x')
ylabel('ua, un')
pause(10)