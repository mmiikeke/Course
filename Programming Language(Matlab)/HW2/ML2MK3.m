Dur = 10;
dt = 0.2;
D = 20;
Nstep = ceil(Dur/dt);
t(1) = 0;
x = zeros(500,1);
y = zeros(500,1);

   for i = 1:Nstep*500;
    x(i+500) = x(i)+D*randn;
    y(i+500) = y(i)+D*randn;
   end
   for i = 1:Nstep+1;
   t(i) = (i-1)*dt
   x1(i) = mean(x(500*(i-1)+1:500*i));
   x2(i) = mean((x(500*(i-1)+1:500*i)).^2);
   y1(i) = mean(y(500*(i-1)+1:500*i));
   y2(i) = mean((y(500*(i-1)+1:500*i)).^2);
   r1(i) = mean((((x(500*(i-1)+1:500*i)).^2)+(y(500*(i-1)+1:500*i)).^2).^(1/2))
   r2(i) = mean(((x(500*(i-1)+1:500*i)).^2)+(y(500*(i-1)+1:500*i)).^2)
   end

subplot(231),plot(t,x1);
subplot(232),plot(t,y1);
subplot(233),plot(t,r1);
subplot(234),plot(t,x2);
subplot(235),plot(t,y2);
subplot(236),plot(t,r2);

