clear all
cam = webcam('FaceTime HD Ä«¸Þ¶ó');
theta1 = 5;;
theta2 = 10;;
while(1)
    
    
    IMG = snapshot(cam);
    nCount =1;
    DrawX = 0;
    DrawY = 0;
    for i=1:480
        for j = 1:640
            if IMG(i,j,1)>150 && IMG(i,j,2)<150 && IMG(i,j,2)>50 && IMG(i,j,3)<102
                IMG(i,j,1) = 255;
                IMG(i,j,2) = 0;
                IMG(i,j,3) = 0;
                nCount = nCount+1;
                DrawY = DrawY+i;
                DrawX = DrawX+j;
            end
        end
    end
    
    DrawY = DrawY/nCount;
    DrawX = DrawX/nCount;
    
    imshow(IMG);
    %hold on;
    text(DrawX, DrawY, 'XXXX');
    
end

    