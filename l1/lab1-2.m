# подынтегральна функция
function y = f (x)
    y = atan(x);
endfunction
# пределы интегрирования
a=0
b=1
# аналитическое решение
int_a=1/4*(pi - log(4))

disp("Метод средних прямоугольников")


### число узлов интегрирования
N=12
N2 = 13
### шаг
h=(b-a)/N;
h2 = (b-a)/N2;
##
### узлы квадратурной формулы
x=a+h/2:h:b;
x2=a+h2/2:h2:b;
### веса квадратурной формулы
c=ones(1,N);
### численное решение
int_p=h*sum(c.*f(x));
### абсолютная погрешность
delta=int_a-int_p;
### относительная погрешность, %
epsilon=delta/int_p*100;
printf("Относительна погрешность %g %%\n", epsilon)
N=13
h=(b-a)/N;
x=a+h/2:h:b;
c=ones(1,N);
int_p2=h*sum(c.*f(x));
delta=int_a-int_p2;
epsilon=delta/int_p2*100;
printf("Относительная погрешность %g %%\n", epsilon)
### оценка погрешности по правилу Рунге
delta_runge=(int_p2-int_p)/(2^2-1);
### уточнение по Ричардсону
int = int_p2 + delta_runge;
delta=int_a-int;
epsilon=delta/int*100;
printf("Относительная погрешность уточнённого значения %g %%\n", epsilon)
N=12


disp("2. Метод трапеций")
int_p = h*((f(a) + f(b))/2 + sum(f(x)));
### абсолютная погрешность
delta=int_a-int_p;
### относительная погрешность, %
epsilon=delta/int_p*100;
printf("Относительна погрешность %g %%\n", epsilon)
h=(b-a)/N2;
int_p2=h2*((f(a) + f(b))/2 + sum(f(x2)));
delta=int_a-int_p2;
epsilon=delta/int_p2*100;
printf("Относительная погрешность %g %%\n", epsilon)
### оценка погрешности по правилу Рунге
delta_runge=(int_p2-int_p)/(2^2-1);
### уточнение по Ричардсону
int = int_p2 + delta_runge;
delta=int_a-int;
epsilon=delta/int*100;
printf("Относительная погрешность уточнённого значения %g %%\n", epsilon)

disp("3. Метод Симпсона")
% x
chet = sum(f(a+h/2 + h:2*h:b));
nechet = sum(f(a+h/2:2*h:b));
int_p = h/3*(f(a) + f(b) + 2 * chet + 4 * nechet);
### абсолютная погрешность
delta=int_a-int_p;
### относительная погрешность, %
epsilon=delta/int_p*100;
printf("Относительна погрешность %g %%\n", epsilon)
h=(b-a)/N2;
int_p2=h2*((f(a) + f(b))/2 + sum(f(x2)));
delta=int_a-int_p2;
epsilon=delta/int_p2*100;
printf("Относительная погрешность %g %%\n", epsilon)
### оценка погрешности по правилу Рунге
delta_runge=(int_p2-int_p)/(2^2-1);
### уточнение по Ричардсону
int = int_p2 + delta_runge;
delta=int_a-int;
epsilon=delta/int*100;
printf("Относительная погрешность уточнённого значения %g %%\n", epsilon)


disp("4. Метод 3/8")
sumins = 0;
counter = 1;

for i = x
    if  mod (counter, 3) == 0
        sumins = sumins + 2 * f(i);
    else
        sumins = sumins + 3 * f(i);
    endif
    counter = counter + 1;
endfor
sumins = sumins + f(a) + f(b);

int_p = 3 * h / 8 * sumins;
### абсолютная погрешность
delta=int_a-int_p;
### относительная погрешность, %
epsilon=delta/int_p*100;
printf("Относительна погрешность %g %%\n", epsilon)
h=(b-a)/N2;
int_p2=h2*((f(a) + f(b))/2 + sum(f(x2)));
delta=int_a-int_p2;
epsilon=delta/int_p2*100;
printf("Относительная погрешность %g %%\n", epsilon)
### оценка погрешности по правилу Рунге
delta_runge=(int_p2-int_p)/(2^2-1);
### уточнение по Ричардсону
int = int_p2 + delta_runge;
delta=int_a-int;
epsilon=delta/int*100;
printf("Относительная погрешность уточнённого значения %g %%\n", epsilon)