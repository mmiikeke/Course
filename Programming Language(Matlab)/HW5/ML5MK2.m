Dur = 100;
dt = 0.005;
Nstep = ceil(Dur/dt);
K=1 ; k=0.5;
M = 2.5;
R1=2 ; R2=0;
V1=0 ; V2=0;
t=0;

for i = 1:Nstep
    V1(i+1) = ((-K*R1(i)-k*(R1(i)-R2(i)))/M)*dt+V1(i);
    V2(i+1) = ((-K*R2(i)-k*(R2(i)-R1(i)))/M)*dt+V2(i);
    R1(i+1) = V1(i)*dt+R1(i);
    R2(i+1) = V2(i)*dt+R2(i);
    t(i+1) = i*dt;
end
U1 = 1/2*K*R1.^2+1/2*k*(R1-R2).^2;
U2 = 1/2*K*R2.^2+1/2*k*(R2-R1).^2;
E1 = 1/2*M*V1.^2;
E2 = 1/2*M*V2.^2;
K1=U1+E1;
K2=U2+E2;
subplot(2,1,1),plot(t,R1,'r',t,R2,'b')
title('²�ӹB��')
xlabel('�ɶ� (s)')
ylabel('�Z�������I��m (m)')
legend('R1','R2')
grid on
subplot(2,1,2),plot(t,K1,'r',t,K2,'b')
xlabel('�ɶ� (s)')
ylabel('�O�ǯ� (J)')
legend('W1','W2')
grid on


%(b)%%%%%%%%%%%%%%%%%%%%%%
Dur = 100;
dt = 0.005;
Nstep = ceil(Dur/dt);
K=1 ; k=0.5;
M = 2.5;
R1=2 ; R2=0;
V1=0 ; V2=0;
t=0;

for i = 1:Nstep
    V1(i+1) = ((-K*R1(i)-k*(R1(i)-R2(i)))/M)*dt+V1(i);
    V2(i+1) = ((-K*R2(i)-k*(R2(i)-R1(i)))/M)*dt+V2(i);
    R1(i+1) = V1(i)*dt+R1(i);
    R2(i+1) = V2(i)*dt+R2(i);
    t(i+1) = i*dt;
end
n1 = (R1+R2)*1/2;
n2 = (R1-R2)*1/2;
plot(t,n1,'r.',t,n2,'k.')
title('²�ӹB��')
xlabel('�ɶ� (s)')
ylabel('�b1�B�b2 (m)')
legend('�b1','�b2')
grid on


%(c)%%%%%%%%%%%%%%%%%%%%%%
Dur = 100;
dt = 0.005;
Nstep = ceil(Dur/dt);
K=1 ; k=0.5;
M = 2.5;
R1=3 ; R2=-3;
V1=0 ; V2=0;
t=0;

for i = 1:Nstep
    V1(i+1) = ((-K*R1(i)-k*(R1(i)-R2(i)))/M)*dt+V1(i);
    V2(i+1) = ((-K*R2(i)-k*(R2(i)-R1(i)))/M)*dt+V2(i);
    R1(i+1) = V1(i)*dt+R1(i);
    R2(i+1) = V2(i)*dt+R2(i);
    t(i+1) = i*dt;
end
n1 = (R1+R2)*1/2;
n2 = (R1-R2)*1/2;
subplot(211),plot(t,R1,t,R2)
title('²�ӹB��')
xlabel('�ɶ� (s)')
ylabel('�Z�������I��m (m)')
legend('R1','R2')
grid on
subplot(212),plot(t,n1,t,n2)
title('²�ӹB��')
xlabel('�ɶ� (s)')
ylabel('�b1�B�b2 (m)')
legend('�b1','�b2')
grid on
