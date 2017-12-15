N = 1000;               %取多少個等分點
frames = 20;            %最終影片的貞數
calculateTimes = 20;    %F(x)的運算次數 <= frames
factor = 1;             %放大倍率
targetx = -1.63;        %放大焦點
targety = 0;            %放大焦點
xmin = -2;              %邊界
xmax = 2;               %邊界
ymin = -2;              %邊界
ymax = 2;               %邊界
FrameRate = 3;         %影格速率
filename=['movie.mp4']; %影片名稱

%Initialize
clear F;
style = ['gbr'];
dotAmount = N*N;
nextdotAmount = dotAmount;
dots = zeros(N,N);

for i = 1:N
    dots(i,:) = linspace(-2,2,N);
end
dots = [reshape(dots,1,N*N) ; reshape(dots',1,N*N)];
initialdots = dots;

%start
tic
writerObj=VideoWriter(filename,'MPEG-4');
writerObj.FrameRate=FrameRate;
writerObj.Quality=100;
open(writerObj);

for i = 1 : frames
    %檢查所有點，分別記錄圓外和園內的點
    if i <= calculateTimes
        out = []; in = []; initialin = [];
        counter = ones(1,2);
        for j = 1 : dotAmount
            if dots(1,j)^2 + dots(2,j)^2 > 4
                nextdotAmount = nextdotAmount - 1;
                out(1,counter(2)) = initialdots(1,j);
                out(2,counter(2)) = initialdots(2,j);
                counter(2) = counter(2) + 1;
            else
                in(1,counter(1)) = dots(1,j);
                in(2,counter(1)) = dots(2,j);
                initialin(1,counter(1)) = initialdots(1,j);
                initialin(2,counter(1)) = initialdots(2,j);
                counter(1) = counter(1) + 1;
            end
        end
        dotAmount = nextdotAmount;
        dots = in;
        initialdots = initialin;
    
        if i == 1
            plot(dots(1,:),dots(2,:), 'k.');
            axis equal;
            axis off;
            hold on;
        else
            if counter(2) ~= 1
                R = 0.8*i/calculateTimes + 0.15;
                G = 0.8*i/calculateTimes + 0.15;
                B = 0.7*i/calculateTimes + 0.3;
                plot(out(1,:), out(2,:), [style(rem(i,3)+1) '.']);
            end
        end
    end
    
    axis([xmin xmax ymin ymax]);
    xmin = (xmin - targetx) * factor + targetx; xmax = (xmax - targetx) * factor + targetx;
    ymin = (ymin - targety) * factor + targety; ymax = (ymax - targety) * factor + targety;

    if i <= calculateTimes
        a = dots(1,:).^2 - dots(2,:).^2 +  initialdots(1,:);
        b = 2*dots(1,:).*dots(2,:) + initialdots(2,:);
        dots(1,:) = a;
        dots(2,:) = b;
    end
    
    F = getframe;
    F.cdata = imresize(F.cdata, [500 500]);       % 設置 行列
    writeVideo(writerObj,F);
    i
end
close(writerObj);
toc