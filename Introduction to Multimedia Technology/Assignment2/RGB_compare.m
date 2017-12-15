N = [100 500 1000];     %取多少個等分點
frames = 20;            %最終影片的貞數
calculateTimes = 20;    %F(x)的運算次數 <= frames
factor = 0.9;             %放大倍率
targetx = -1.63;        %放大焦點
targety = 0;            %放大焦點
xmin = -2;              %邊界
xmax = 2;               %邊界
ymin = -2;              %邊界
ymax = 2;               %邊界
FrameRate = 3;          %影格速率
dt=0.5;                 %GIF 影格速率
filename=['movie.mp4']; %影片名稱

%Initialize
clear F;
style = ['gbr'];
dotAmount = [N(1)*N(1) N(2)*N(2) N(3)*N(3)];
nextdotAmount = [dotAmount(1) dotAmount(2) dotAmount(3)];
dots = {zeros(N(1),N(1)) zeros(N(2),N(2)) zeros(N(3),N(3))};
initialdots = {};

for j = 1:3
    for i = 1:N(j)
        dots{j}(i,:) = linspace(-2,2,N(j));
    end
    dots{j} = [reshape(dots{j},1,N(j)*N(j)) ; reshape(dots{j}',1,N(j)*N(j))];
    initialdots{j} = dots{j};
end

%start
tic
%{
writerObj=VideoWriter(filename,'MPEG-4');
writerObj.FrameRate=FrameRate;
writerObj.Quality=100;
open(writerObj);
%}

for i = 1 : frames
    %檢查所有點，分別記錄圓外和園內的點
    for k = 1 : 3
        if i <= calculateTimes
            out = {[] [] []}; in = {[] [] []}; initialin = {[] [] []};
            counter = {ones(1,2) ones(1,2) ones(1,2)};
            for j = 1 : dotAmount(k)
                if dots{k}(1,j)^2 + dots{k}(2,j)^2 > 4
                    nextdotAmount(k) = nextdotAmount(k) - 1;
                    out{k}(1,counter{k}(2)) = initialdots{k}(1,j);
                    out{k}(2,counter{k}(2)) = initialdots{k}(2,j);
                    counter{k}(2) = counter{k}(2) + 1;
                else
                    in{k}(1,counter{k}(1)) = dots{k}(1,j);
                    in{k}(2,counter{k}(1)) = dots{k}(2,j);
                    initialin{k}(1,counter{k}(1)) = initialdots{k}(1,j);
                    initialin{k}(2,counter{k}(1)) = initialdots{k}(2,j);
                    counter{k}(1) = counter{k}(1) + 1;
                end
            end
            dotAmount(k) = nextdotAmount(k);
            dots{k} = in{k};
            initialdots{k} = initialin{k};
            
            subplot(1,3,k);
            if i == 1
                plot(dots{k}(1,:),dots{k}(2,:), 'k.');
                axis equal;
                axis off;
                hold on;
            else
                if counter{k}(2) ~= 1
                    R = 0.8*i/calculateTimes + 0.15;
                    G = 0.8*i/calculateTimes + 0.15;
                    B = 0.7*i/calculateTimes + 0.3;
                    plot(out{k}(1,:), out{k}(2,:), [style(rem(i,3)+1) '.']);
                end
            end
        end
        axis([xmin xmax ymin ymax]);
    end
    
    xmin = (xmin - targetx) * factor + targetx; xmax = (xmax - targetx) * factor + targetx;
    ymin = (ymin - targety) * factor + targety; ymax = (ymax - targety) * factor + targety;

    for j = 1 : 3
        if i <= calculateTimes
            a = dots{j}(1,:).^2 - dots{j}(2,:).^2 +  initialdots{j}(1,:);
            b = 2*dots{j}(1,:).*dots{j}(2,:) + initialdots{j}(2,:);
            dots{j}(1,:) = a;
            dots{j}(2,:) = b;
        end
    end
    
    F = getframe(gcf);
    %F.cdata = imresize(F.cdata, [500 500]);       % 設置 行列
    %writeVideo(writerObj,F);
    %GIF
    [image,map]=frame2im(F);
    [im,map2]=rgb2ind(image,128);
    if i==1
        imwrite(im,map2,'RGB_Compare.gif','gif','writeMode','overwrite','delaytime',dt,'loopcount',inf);
    else
        imwrite(im,map2,'RGB_Compare.gif','gif','writeMode','append','delaytime',dt);
    end
    i
end
%close(writerObj);
toc