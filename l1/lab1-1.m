# подынтегральна функция
function y = f (x)
    y = atan(x);
endfunction
# пределы интегрирования
a=0
b=1
# аналитическое решение
int_a=1/4*(pi - log(4))

disp("Элементарные квадратурные формулы:")
disp("1. Метод средних прямоугольников")
# число узлов интегрирования
N=12
# шаг
h=(b-a)/N;
# узлы квадратурной формулы
x=a+h/2:h:b;
# веса квадратурной
c=ones(1,N);
# численное решение
int_p=h*sum(c.*f(x));
# абсолютная погрешность
delta=int_a-int_p;
# относительная погрешность, %
epsilon=delta/int_p*100;
disp( int_p)

disp("2. Метод трапеций")
int_p = h*((f(a) + f(b))/2 + sum(f(x)));
disp( int_p)

disp("3. Метод Симпсона")
% x
chet = sum(f(a+h/2 + h:2*h:b));
nechet = sum(f(a+h/2:2*h:b));
int_p = h/3*(f(a) + f(b) + 2 * chet + 4 * nechet);
disp( int_p)
% h/3*()


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
disp( int_p)