% close all
% img = snapshot(cam);
% imshow(img)
%cam=webcam('Logitech HD Webcam C270');

    while(1)        
        tic
        img = snapshot(cam);
        
    nCount =1;
    DrawX = 0;
    DrawY = 0;
    for i=1:480
        for j = 1:640
            if img(i,j,1)>200 && img(i,j,2)>130 && img(i,j,3)<150&&img(i,j,3)>70
                nCount = nCount+1;
                DrawY = DrawY+i;
                DrawX = DrawX+j;
            end
        end
    end
    y = (DrawY/nCount);
    x = (DrawX/nCount);
    R=img(:,:,1);
%     R1=medfilt2(R,[3 3]);
%     R1=imadjust(R1);
    R1=R>230;
%     figure(1);
%     imshow(R1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %roundness를 이용해서 label 하나만 찾기
%     [Label,total] = bwlabel(R1,4);
%     for i=1:total
%         if(sum(sum(Label==i)) < 500 )
%             
%             Label(Label==i)=0;
%             
%         end
%     end
%     
%     Sdata = regionprops(Label,'all');
%     Un=unique(Label);
%     my_max=0.0;
%        
% 
%     for i=2:numel(Un)
%         Roundness=(4*pi*Sdata(Un(i)).Area)/Sdata(Un(i)).Perimeter.^2;
%         my_max=max(my_max,Roundness);
%         if(Roundness==my_max)
%             ele=Un(i);
%         end
%     end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        %rgb이용해서 label 정하기.
        [Label,total] = bwlabel(R1,4);
        total;
        Label(floor(y),floor(x));
        Label2=Label==Label(floor(y),floor(x));
        Sdata = regionprops(Label2,'all');
%         figure(1)
%         imshow(Label2);
        
        cx=Sdata.Centroid(1);
        cy=Sdata.Centroid(2);
        rx=(x+cx)/2;
        ry=(y+cy)/2;        
        radi1=sqrt(Sdata.Area/pi);
        radi2=Sdata.Perimeter/(2*pi);
        radi3=Sdata.EquivDiameter/2;
        radi=(radi1+radi2+radi3)/3;
        center=[ry rx]; %%%%%%%% Center of the circle
        r=radi; %%%%%%%% Radius of the circle
        N=100; %%%%%%%% Number of dividing
        gag=linspace(0,2*pi,N); %%%%%%%% Angle of the circle(Radian)
        x1=r*cos(gag)+center(1); %%%%%%%% x coordinate
        y1=r*sin(gag)+center(2); %%%%%%%% y coordinate
        
%         figure(2)
%         imshow(img)
%         hold on
%         plot(y1,x1,'LineWidth',10); 
    toc 
    
    end