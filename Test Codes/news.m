clear all
cam = webcam('USB 카메라');

hold on;

pause(3);

IMG = snapshot(cam);

imshow(IMG);




% v=[0 1280 0 960];
% axis(v);
% [xi,yi,button]=ginput(1);               %마우스로 클릭한 좌표를 받는다.
% plot(xi,yi,'ro');                       %마우스로 클릭한 좌표에 o를 찍는다.

hold off;



r = 236;%IMG(xi,yi,1)
g = 170;%IMG(xi,yi,2)
b = 123;%IMG(xi,yi,3)


while (1)
    IMG = snapshot(cam);
    diff_im = zeros(960,1280);  
    for i=1:960
        for j = 1:1280
            if (IMG(i,j,1) < r+ 25 && IMG(i,j,1) > r - 25 && IMG(i,j,2) < g+ 25 && IMG(i,j,2) > g - 25 &&IMG(i,j,3) < b+ 25 && IMG(i,j,3) > b - 25)
                diff_im(i,j) = 1;

            
            else
                diff_im(i,j) = 0;
              
            end
        end
    end
    
    diff_im = bwareaopen(diff_im,80);
    bw = bwlabel(diff_im, 4);
    
    % Here we do the image blob analysis.
    % We get a set of properties for each labeled region.
    stats = regionprops(bw, 'BoundingBox', 'Centroid');
    
    % Display the image
    imshow(IMG)

    hold on
    %This is a loop to bound the red objects in a rectangular box.
    for object = 1:length(stats)
        bb = stats(object).BoundingBox;
        if bb > 30 
        bc = stats(object).Centroid;
        rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
        plot(bc(1),bc(2), '-m+')
        a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
        end
    end
    
    hold off
    
    
    
    
    
end




