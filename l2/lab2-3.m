lambda=0.5
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