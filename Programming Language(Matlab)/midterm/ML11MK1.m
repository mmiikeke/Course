%(a)
Dur = 100;
dt = 0.01;
Nstep = ceil(Dur/dt);
K=1 ; k=0.5;
M = 2.5;
R1=2 ; R2=0;
V1=0 ; V2=0;
E1=0 ; E2=0;
U1=abs(1/2*K*R1^2-1/2*k*(R1-R2)^2);
U2=abs(1/2*K*R2^2-1/2*k*(R2-R1)^2);
K1=U1+E1;
K2=U2+E2;
t=0;

for i = 1:Nstep
    a1 = (-K*R1(i)-k*(R1(i)-R2(i)))/M;
    a2 = (-K*R2(i)-k*(R2(i)-R1(i)))/M;
    V1(i+1) = a1*dt+V1(i);
    V2(i+1) = a2*dt+V2(i);
    R1(i+1) = V1(i)*dt+R1(i);
    R2(i+1) = V2(i)*dt+R2(i);
    U1(i+1) = abs(1/2*K*R1(i+1)^2-1/2*k*(R1(i+1)-R2(i+1))^2);
    U2(i+1) = abs(1/2*K*R2(i+1)^2-1/2*k*(R2(i+1)-R1(i+1))^2);
    E1(i+1) = 1/2*M*(V1(i+1))^2;
    E2(i+1) = 1/2*M*(V2(i+1))^2;
    K1(i+1) = U1(i+1)+E1(i+1);
    K2(i+1) = U2(i+1)+E2(i+1);
    t(i+1) = i*dt;
end
subplot(2,1,1),plot(t,R1,t,R2)
subplot(2,1,2),plot(t,K1,t,K2)


%(b)
Dur = 100;
dt = 0.01;
Nstep = ceil(Dur/dt);
K=1 ; k=0.5;
M = 2.5;
R1=2 ; R2=0;
V1=0 ; V2=0;
n1=1 ; n2=1
t=0;

for i = 1:Nstep
    a1 = (-K*R1(i)-k*(R1(i)-R2(i)))/M;
    a2 = (-K*R2(i)-k*(R2(i)-R1(i)))/M;
    V1(i+1) = a1*dt+V1(i);
    V2(i+1) = a2*dt+V2(i);
    R1(i+1) = V1(i)*dt+R1(i);
    R2(i+1) = V2(i)*dt+R2(i);
    n1(i+1) = (R1(i+1)+R2(i+1))*1/2;
    n2(i+1) = (R1(i+1)-R2(i+1))*1/2;
    t(i+1) = i*dt;
end
plot(t,n1,t,n2)
    

%(c)
Dur = 100;
dt = 0.05;
Nstep = ceil(Dur/dt);
K=1 ; k=0.5;
M = 2.5;
R1=3 ; R2=-3;
V1=0 ; V2=0;
n1=1 ; n2=1
t=0;

for i = 1:Nstep
    a1 = (-K*R1(i)-k*(R1(i)-R2(i)))/M;
    a2 = (-K*R2(i)-k*(R2(i)-R1(i)))/M;
    V1(i+1) = a1*dt+V1(i);
    V2(i+1) = a2*dt+V2(i);
    R1(i+1) = V1(i)*dt+R1(i);
    R2(i+1) = V2(i)*dt+R2(i);
    n1(i+1) = (R1(i+1)+R2(i+1))*1/2;
    n2(i+1) = (R1(i+1)-R2(i+1))*1/2;
    t(i+1) = i*dt;
end
subplot(211),plot(t,R1,t,R2)
subplot(212),plot(t,n1,t,n2)
