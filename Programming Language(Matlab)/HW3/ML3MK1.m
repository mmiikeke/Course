a = input('��J�Ĥ@�Ӽ�:');
b = input('��J�ĤG�Ӽ�:');
x = max(a,b);
y = min(a,b);
r = rem(x,y);
while r~=0
    x = y ; y = r ; r = rem(x,y);
end
x = a*b/y;
fprintf('�̤j���]��=:%d',y)
fprintf('�̤p������=:%d',x)