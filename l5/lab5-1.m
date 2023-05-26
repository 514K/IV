clear
a=-1;
b=1;
n=100
h=2/(n+1);

for k=1:n
  x(k)=-1+k*h;
  c(k)=x(k)+h/2;
  ua(k)=sqrt((1-x(k))/(1+x(k)));
end

for m=1:n
  for k=1:n
    A(m,k)=h/(c(m)-x(k));
  end
  b(m)=pi;
end

u1=A\b';
printf('Погрешность\n')
eps=norm(ua-u1', inf)
plot(x,ua,'r',x, u1,'gx');
pause()