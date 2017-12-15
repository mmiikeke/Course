(a)
Dur = 30;
dt = 0.001;
M = 1;
k = 0.5;
V = [10,8,5];
X = [0,2,3];

Nstep = ceil(Dur/dt);
for i = 1:3
    v(1) = V(i);
    x(1) = X(i);
    for j = 1:Nstep
        a(j) = -k*x(j)/M;
        v(j+1) = v(j) + a(j)*dt;
        x(j+1) = x(j) + v(j)*dt;
    end
plot(x,v)
hold on
end

legend('v=10,x=0','v=8,x=2','v=5,x=3')
axis equal
title('Ma=-kx的粒子運動')
xlabel('x 位移')
ylabel('v 速度')
grid on

N = Dur/(2*pi*((M/k)^(0.5)));
disp(['振盪次數為 ' num2str(N)])

(b)
Dur = 30;dt = 0.001;
M = 1;k = 0.5;
v(1) = 10;x(1) = 0;
L = [input(['請輸入第一個β值 (dissipation coefficient),小於' num2str((k/M)^0.5) ': '])...
    ,(k/M)^0.5...
    ,input(['請輸入第三個β值 (dissipation coefficient),大於' num2str((k/M)^0.5) ': '])];

Nstep = ceil(Dur/dt);
for i = 1:3
    B = L(i);
    for j = 1:Nstep
        a(j) = (-B*v(j)-k*x(j))/M;
        v(j+1) = v(j) + a(j)*dt;
        x(j+1) = x(j) + v(j)*dt;
    end
    plot (x,v)
    hold on
end

legend('B1','B2','B3')
axis equal
grid on
title('Ma=-kx的粒子運動')
xlabel('x 位移')
ylabel('v 速度')

N = Dur/(2*pi*((M/k)^(0.5)));
disp(['循環次數為 ' num2str(N)])

(d)  
1.%(a)的動畫
Dur = 30;dt = 0.001;
M = 1;k = 0.5;
v1=10; v2=8; v3=5;
x1=0; x2=2; x3=3;

Nstep = ceil(Dur/dt);
for j = 1:Nstep
    a1(j) = -k*x1(j)/M;
    v1(j+1) = v1(j) + a1(j)*dt;
    x1(j+1) = x1(j) + v1(j)*dt;
    a2(j) = -k*x2(j)/M;
    v2(j+1) = v2(j) + a2(j)*dt;
    x2(j+1) = x2(j) + v2(j)*dt;
    a3(j) = -k*x3(j)/M;
    v3(j+1) = v3(j) + a3(j)*dt;
    x3(j+1) = x3(j) + v3(j)*dt;
      if ceil(j/100) == j/100
        plot(x1,v1,'b.',x2,v2,'r.',x3,v3,'g.')
        legend('v=10,x=0','v=8,x=2','v=5,x=3')
        grid on
        axis([-15 15 -15 15])
        title('Ma=-kx的粒子運動')
        xlabel('x 位移')
        ylabel('v 速度')
        F(j/100) = getframe;
      end
end
N = Dur/(2*pi*((M/k)^(0.5)));
disp(['振盪次數為 ' num2str(N)])
%%%%%%%%%%
Dur = 30;dt = 0.001;
M = 1;k = 0.5;
v = [10,8,5]
x = [0,2,3]

Nstep = ceil(Dur/dt);
for j = 0:Nstep-1
    for i = 1:3
        a(3*j+i) = -k*x(3*j+i)/M;
        v(3*j+i+3) = v(3*j+i) + a(3*j+i)*dt;
        x(3*j+i+3) = x(3*j+i) + v(3*j+i)*dt;
        plot(x(3*j+i),v(3*j+i),C(i));
        hold on
    end
      if ceil(j/100) == j/100
        plot(x1,v1,'b.',x2,v2,'r.',x3,v3,'g.')
        legend('v=10,x=0','v=8,x=2','v=5,x=3')
        grid on
        axis([-15 15 -15 15])
        title('Ma=-kx的粒子運動')
        xlabel('x 位移')
        ylabel('v 速度')
        F(j/100) = getframe;
      end
end
N = Dur/(2*pi*((M/k)^(0.5)));
disp(['振盪次數為 ' num2str(N)])

2.%(b)的動畫
Dur = 30;dt = 0.001;
M = 1;k = 0.5;
v1(1) = 10;x1(1) = 0;
v2(1) = 10;x2(1) = 0;
v3(1) = 10;x3(1) = 0;
v4(1) = 10;x4(1) = 0;
v5(1) = 10;x5(1) = 0;
v6(1) = 10;x6(1) = 0;
B = [input(['請輸入第一個β值 (dissipation coefficient),小於' num2str((k/M)^0.5) ': '])...
    ,(k/M)^0.5...
    ,input(['請輸入第三個β值 (dissipation coefficient),大於' num2str((k/M)^0.5) ': '])]

Nstep = ceil(Dur/dt);

for j = 1:Nstep
    a1(j) = (-B(1)*v1(j)-k*x1(j))/M;
    v1(j+1) = v1(j) + a1(j)*dt;
    x1(j+1) = x1(j) + v1(j)*dt;
    a2(j) = (-B(2)*v2(j)-k*x2(j))/M;
    v2(j+1) = v2(j) + a2(j)*dt;
    x2(j+1) = x2(j) + v2(j)*dt;
    a3(j) = (-B(3)*v3(j)-k*x3(j))/M;
    v3(j+1) = v3(j) + a3(j)*dt;
    x3(j+1) = x3(j) + v3(j)*dt;
    a4(j) = (-B(1)*v4(j)-k*x4(j))/M;
    v4(j+1) = v4(j) + a4(j)*dt;
    x4(j+1) = x4(j) + v4(j)*dt;
    a5(j) = (-B(2)*v5(j)-k*x5(j))/M;
    v5(j+1) = v5(j) + a5(j)*dt;
    x5(j+1) = x5(j) + v5(j)*dt;
    a6(j) = (-B(3)*v6(j)-k*x6(j))/M;
    v6(j+1) = v6(j) + a6(j)*dt;
    x6(j+1) = x6(j) + v6(j)*dt;
    if ceil(j/200) == j/200
    plot(x1(j),v1(j),'b.',x2(j),v2(j),'r.',x3(j),v3(j),'g.'...
         x4(j),v4(j),'x.',x5(j),v5(j),'p.',x6(j),v6(j),'o.');
    legend('B1','B2','B3','B4','B5','B6')
    grid on
    axis([-12 12 -12 12])
    title('Ma=-kx的粒子運動')
    xlabel('x 位移')
    ylabel('v 速度')
    F(j) = getframe;
    end
end

N = Dur/(2*pi*((M/k)^(0.5)));
disp(['循環次數為 ' num2str(N)])
%%%%%%%%%%%%%%%%%%
Dur = 30;dt = 0.1;
M = 1;k = 0.5;
v = [10,10,10,10,10,10];x = [0,0,0,0,0,0];
B = [input(['請輸入第一個β值 (dissipation coefficient),小於' num2str((k/M)^0.5) ': '])...
    ,(k/M)^0.5...
    ,input(['請輸入第三個β值 (dissipation coefficient),大於' num2str((k/M)^0.5) ': '])]
C = ['b.','r.','g.','x.','p.','o.']
Nstep = ceil(Dur/dt);

for j = 0:Nstep-1
    for i = 1:6
        a(6*j+i) = (-B(i)*v(6*j+i)-k*x(6*j+i))/M;
        v(6*j+i+6) = v(6*j+i) + a(6*j+i)*dt;
        x(6*j+i+6) = x(6*j+i) + v(6*j+i)*dt;
        if ceil(j/100) == j/100
        plot(x(6*j+i),v(6*j+i),C(3));
        hold on
        end
    end
    hold off
    if ceil(j/100) == j/100
    grid on
    axis([-10 10 -10 10])
    title('Ma=-kx的粒子運動')
    xlabel('x 位移')
    ylabel('v 速度')
    legend('B1','B2','B3','B4','B5','B6')
    F(j/100+1) = getframe;
end

T = Dur/(2*pi*((M/k)^(0.5)));
disp(['循環次數為 ' num2str(T)])
%%%%%%%%%%%%%%%
note:
p=plot(,,,)
legend('text1','text2','text3')
grid on
p(1).LineWidth = 1;
p(1).Marker = 'd';
p(1).LineStyle = '-.'

mesh
plot3
surf
contour

surfnorm
axis equal
