dir1 = dir('CroppedYale\');
pic = int16(zeros(192*168,64,40));

% CroppedYale\下所有資料夾，除了第一個跟第二個(.、..)
for i = 3 : length(dir1)
    dir2 = dir(['CroppedYale\' dir1(i).name '\*.pgm']);
    counter(i-2) = 0;
    
    %開始讀入 CroppedYale\dir1\下所有以pgm結尾的檔案
    for j = 1:length(dir2)
        %如果是…P00_Ambient.pgm則跳過
        if strcmp(dir2(j).name, [dir1(i).name '_P00_Ambient.pgm']) == 1
            %disp(['Break image at i = ' num2str(i) '\n']);
            continue;
        else
            disp(['Processing at i = ' num2str(i)]);
            counter(i-2) = counter(i-2) + 1;
            x = imread(['CroppedYale\' dir1(i).name '\' dir2(j).name]);
            %pic(:,counter) = reshape(rgb2gray(x), 192*168, 1);   %轉灰階
            pic(:,counter(i-2),i-2) = reshape(x, 192*168, 1);
        end
    end
end

correct = zeros(length(dir1)-2,2);
wrong = zeros(length(dir1)-2,2);

for i = 3 : length(dir1)
    for j = 36 : counter(i-2)
        min = 999999999;
        min2 = 999999999;
        for k = 3 : length(dir1)
            for l = 1 : 35
                tmp = sum(int32(abs(pic(:,j,i-2) - pic(:,l,k-2))));
                tmp2 = sum(int32((pic(:,j,i-2) - pic(:,l,k-2)).^2));
                if min > tmp
                    min = tmp;
                    flag = k-2;
                    %disp(['SAD : update min = ' num2str(min) '\n' 'flag = ' num2str(flag)]);
                end
                if min2 > tmp2
                    min2 = tmp2;
                    flag2 = k-2;
                    %disp(['SSD : update min = ' num2str(min2) '\n' 'flag = ' num2str(flag2)]);
                end
            end
        end
        %find solution
        %disp(['SAD : find ' num2str(i-2) ' near to ' num2str(flag) ' with min = ' num2str(min) '\n']);
        %disp(['SSD : find ' num2str(i-2) ' near to ' num2str(flag2) ' with min = ' num2str(min2) '\n']);
        
        if i-2 == flag
            correct(i-2,1) = correct(i-2,1) + 1;
        else
            wrong(i-2,1) = wrong(i-2,1) + 1;
        end
        
        if i-2 == flag2
            correct(i-2,2) = correct(i-2,2) + 1;
        else
            wrong(i-2,2) = wrong(i-2,2) + 1;
        end
    end
end

disp('Solution : ');
disp(['Accuracy of SAD : ' num2str(sum(100*correct(:,1))/sum(correct(:,1) + wrong(:,1))) '%']);
disp(['Accuracy of SSD : ' num2str(sum(100*correct(:,2))/sum(correct(:,2) + wrong(:,2))) '%']);

%{
[x,map]=imread('Koala.bmp');
gray_fg=rgb2gray(x);   %轉灰階
%image(gray_fg);
figure                 %顯示圖片 
imshow(gray_fg)
%}

%size(a,2)  %取行數
%c = sort(abs(a-b))