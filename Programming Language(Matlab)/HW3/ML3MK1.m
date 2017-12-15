a = input('块材计:');
b = input('块材计:');
x = max(a,b);
y = min(a,b);
r = rem(x,y);
while r~=0
    x = y ; y = r ; r = rem(x,y);
end
x = a*b/y;
fprintf('程そ计=:%d',y)
fprintf('程そ计=:%d',x)