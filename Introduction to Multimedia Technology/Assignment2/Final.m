gridSize = 1000;                            %1000 74 60 200 0.994
xlimit = [-4 4];                            %畫面邊界
ylimit = [-2 2];                            %畫面邊界
times = 80;                                 %重新取點運算的次數
frames = 60;                                %跑一遍的影片貞數(總幀數=times*frames)
calculateTimes = 800;                       %F(x)的運算次數(Iteration)
factor = 0.994;                             %每幀放大倍率
targetx = -0.72922175749625;                %放大焦點
targety = -0.22322837539578;                %放大焦點
FrameRate=24;                               %影格速率
filename=['movie_' num2str(FrameRate) '_' num2str(times*frames) '.mp4']; %影片名稱

% Setup
t = tic();
writerObj=VideoWriter(filename,'MPEG-4');
writerObj.FrameRate=24;
writerObj.Quality=100;
open(writerObj);

for i = 1 : times 
    x = linspace(xlimit(1), xlimit(2), gridSize);
    y = linspace(ylimit(1), ylimit(2), gridSize);
    [xGrid,yGrid] = meshgrid(x, y);
    z0 = xGrid + 1i*yGrid;
    count = ones(size(z0));

    %運算
    z = z0;
    C = calculateTimes + 2*i;
    for n = 0 : C
        z = z.*z + z0;                      %F(x) = x^2 + c
        inside = abs(z)<=2;
        count = count + inside;             %累計點在圓內的次數

    end
    toc(t);

    count = log(count);

    %顯示
    fig = gcf;
    if i == 1
        fig.Position = [0 0 1538 810];                  %figure顯示位置、大小 [x,y,width,hight]
        set(gca,'position',[0.03 0.03 0.94 0.94]);      %內部畫面顯示範圍
        set(gcf,'color',[0.1 0.1 0.1]);                 %figure邊框顏色
        set(gcf,'ToolBar','none');                      %關閉Toolbar
    end
    imagesc(x, y, count);                               %繪圖
    %colormap([bone();flipud(bone());0 0 0]);
    colormap([bone();0 0 0]);                           %繪圖的顏色
    title('\color[rgb]{.7 .7 1}Mandelbrot  mike');      %Title
    %xlabel('x軸標題','color',[1 1 1]);
    %ylabel('y軸標題','color',[1 1 1]);
    %set(gca, {'XColor', 'YColor'}, {[1 1 1], [1 1 1]});
    set(gca, 'XColor', [1 1 1]);                        %x軸座標顏色
    %axis off
    for n = 1 : frames
        axis([xlimit(1) xlimit(2) ylimit(1) ylimit(2)]); %設置畫面邊界座標(縮放)
        xlimit(1) = (xlimit(1) - targetx) * factor + targetx; xlimit(2) = (xlimit(2) - targetx) * factor + targetx;     %計算下次的邊界
        ylimit(1) = (ylimit(1) - targety) * factor + targety; ylimit(2) = (ylimit(2) - targety) * factor + targety;     %計算下次的邊界
        %F.cdata = imresize(F.cdata, [1000 1000]);      %設置長寬
        F = getframe(fig,[0 0 1538 810]);               %設置擷取長寬
        writeVideo(writerObj,F);
    end
end
close(writerObj);