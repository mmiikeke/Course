Dur = 100;
dt = 0.05;
Nstep = ceil(Dur/dt);
K=1 ; k=0.5;
M=2.5 ; M11=5;
R=zeros(5,1);
V=zeros(5,1);
R(1)=2
t=0;
%%% m*a1 = -KR1-k(R1-R2) 
%%% m*a2 = k(R3-R2)-k(R2-R1) = k(R3-2*R2+R1)
%%% m*a3 = k(R4-R3)-k(R3-R2) = k(R4-2*R3+R2)
%%% m*a5 = -KR5-k(R5-R4)
for j = 1:Nstep-1
    V(1,j+1) = ((-K*R(1,j)-k*(R(1,j)-R(2,j)))/M)*dt+V(1,j);
    for i = 2:4
        V(i,j+1) = ((k*(R(i+1,j)-2*R(i,j)+R(i-1,j)))/M)*dt+V(i,j);
    end
    V(21,j+1) = ((-K*R(5,j)-k*(R(5,j)-R(4,j)))/M)*dt+V(5,j);
    for i = 1:5
        R(i,j+1) = V(i,j)*dt+R(i,j);
    end
    t(j+1) = j*dt;
end
subplot(5,1,1),plot(t,R(1,:))
title('簡諧運動')
xlabel('時間 (s)')
ylabel('距離平衡點位置 (m)')
grid on
subplot(5,1,2),plot(t,R(2,:))
xlabel('時間 (s)')
ylabel('距離平衡點位置 (m)')
grid on
subplot(5,1,3),plot(t,R(3,:))
xlabel('時間 (s)')
ylabel('距離平衡點位置 (m)')
grid on
subplot(5,1,4),plot(t,R(4,:))
xlabel('時間 (s)')
ylabel('距離平衡點位置 (m)')
grid on
subplot(5,1,5),plot(t,R(5,:))
xlabel('時間 (s)')
ylabel('距離平衡點位置 (m)')
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%修正版
Dur = 80;
dt = 0.002;
Nstep = ceil(Dur/dt);
k=0.5;
M=2.5 ; M11=5;
R=zeros(21,Nstep);
V=zeros(21,Nstep);
R(1)=2;
t=0;
%%% m*a1 = -k(R1-R2) 
%%% m*a2 = k(R3-R2)-k(R2-R1) = k(R3-2*R2+R1)
%%% m*a3 = k(R4-R3)-k(R3-R2) = k(R4-2*R3+R2)
%%% m*a21 = -k(R21-R20)
for j = 1:Nstep-1
    V(1,j+1) = ((-k*(R(1,j)-R(2,j)))/M)*dt+V(1,j);
    for i = 2:20
        if i == 11
            V(i,j+1) = ((k*(R(i+1,j)-2*R(i,j)+R(i-1,j)))/M11)*dt+V(i,j);
        else
            V(i,j+1) = ((k*(R(i+1,j)-2*R(i,j)+R(i-1,j)))/M)*dt+V(i,j);
        end
    end
    V(21,j+1) = ((-k*(R(21,j)-R(20,j)))/M)*dt+V(20,j);
    for i = 1:21
        R(i,j+1) = V(i,j)*dt+R(i,j);
    end
    t(j+1) = j*dt;
end
subplot(5,1,1),plot(t,R(1,:))
title('耦合振盪')
xlabel('時間 (s)')
ylabel('R1 (m)')
grid on
subplot(5,1,2),plot(t,R(10,:))
xlabel('時間 (s)')
ylabel('R10 (m)')
grid on
subplot(5,1,3),plot(t,R(11,:))
xlabel('時間 (s)')
ylabel('R11 (m)')
grid on
subplot(5,1,4),plot(t,R(12,:))
xlabel('時間 (s)')
ylabel('R12 (m)')
grid on
subplot(5,1,5),plot(t,R(21,:))
xlabel('時間 (s)')
ylabel('R21 (m)')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%簡化版
Dur = 80;
dt = 0.002;
Nstep = ceil(Dur/dt);
k=1;
M=2.5 ; M11=5;
R=zeros(23,Nstep);
V=zeros(23,Nstep);
R(2,1)=2
t=0;
%%% m*a1 = -KR1-k(R1-R2) 
%%% m*a2 = k(R3-R2)-k(R2-R1) = k(R3-2*R2+R1)
%%% m*a3 = k(R4-R3)-k(R3-R2) = k(R4-2*R3+R2)
%%% m*a21 = -KR21-k(R21-R20)
for j = 1:Nstep-1
    for i = 2:22
        if i == 11
            V(i,j+1) = ((k*(R(i+1,j)-2*R(i,j)+R(i-1,j)))/M11)*dt+V(i,j);
            R(i,j+1) = V(i,j)*dt+R(i,j);
        else
            V(i,j+1) = ((k*(R(i+1,j)-2*R(i,j)+R(i-1,j)))/M)*dt+V(i,j);
            R(i,j+1) = V(i,j)*dt+R(i,j);
        end
    end
    t(j+1) = j*dt;
end
subplot(5,1,1),plot(t,R(2,:))
title('耦合振盪')
xlabel('時間 (s)')
ylabel('R1 (m)')
grid on
subplot(5,1,2),plot(t,R(11,:))
xlabel('時間 (s)')
ylabel('R10 (m)')
grid on
subplot(5,1,3),plot(t,R(12,:))
xlabel('時間 (s)')
ylabel('R11 (m)')
grid on
subplot(5,1,4),plot(t,R(13,:))
xlabel('時間 (s)')
ylabel('R12 (m)')
grid on
subplot(5,1,5),plot(t,R(22,:))
xlabel('時間 (s)')
ylabel('R21 (m)')
grid on