gridSize = 1000;                            %1000 74 60 200 0.994
xlimit = [-4 4];                            %�e�����
ylimit = [-2 2];                            %�e�����
times = 80;                                 %���s���I�B�⪺����
frames = 60;                                %�]�@�M���v���s��(�`�V��=times*frames)
calculateTimes = 800;                       %F(x)���B�⦸��(Iteration)
factor = 0.994;                             %�C�V��j���v
targetx = -0.72922175749625;                %��j�J�I
targety = -0.22322837539578;                %��j�J�I
FrameRate=24;                               %�v��t�v
filename=['movie_' num2str(FrameRate) '_' num2str(times*frames) '.mp4']; %�v���W��

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

    %�B��
    z = z0;
    C = calculateTimes + 2*i;
    for n = 0 : C
        z = z.*z + z0;                      %F(x) = x^2 + c
        inside = abs(z)<=2;
        count = count + inside;             %�֭p�I�b�ꤺ������

    end
    toc(t);

    count = log(count);

    %���
    fig = gcf;
    if i == 1
        fig.Position = [0 0 1538 810];                  %figure��ܦ�m�B�j�p [x,y,width,hight]
        set(gca,'position',[0.03 0.03 0.94 0.94]);      %�����e����ܽd��
        set(gcf,'color',[0.1 0.1 0.1]);                 %figure����C��
        set(gcf,'ToolBar','none');                      %����Toolbar
    end
    imagesc(x, y, count);                               %ø��
    %colormap([bone();flipud(bone());0 0 0]);
    colormap([bone();0 0 0]);                           %ø�Ϫ��C��
    title('\color[rgb]{.7 .7 1}Mandelbrot  mike');      %Title
    %xlabel('x�b���D','color',[1 1 1]);
    %ylabel('y�b���D','color',[1 1 1]);
    %set(gca, {'XColor', 'YColor'}, {[1 1 1], [1 1 1]});
    set(gca, 'XColor', [1 1 1]);                        %x�b�y���C��
    %axis off
    for n = 1 : frames
        axis([xlimit(1) xlimit(2) ylimit(1) ylimit(2)]); %�]�m�e����ɮy��(�Y��)
        xlimit(1) = (xlimit(1) - targetx) * factor + targetx; xlimit(2) = (xlimit(2) - targetx) * factor + targetx;     %�p��U�������
        ylimit(1) = (ylimit(1) - targety) * factor + targety; ylimit(2) = (ylimit(2) - targety) * factor + targety;     %�p��U�������
        %F.cdata = imresize(F.cdata, [1000 1000]);      %�]�m���e
        F = getframe(fig,[0 0 1538 810]);               %�]�m�^�����e
        writeVideo(writerObj,F);
    end
end
close(writerObj);