clear all;

%%모듈 추가
addpath('Modules');


%%%카메라 설정
camname = 'USB 카메라';    
cam = webcam(camname);
xy = [960 1280];

%%%아두이노 설정
arduinoport = '/dev/tty.usbmodem1421';
hservopin = 9;
vservopin = 10;


uno = arduino(arduinoport,'uno');

hservo = servo(uno,hservopin);
vservo = servo(uno,vservopin);


hpos = 180 * readPosition (hservo);
vpos = 180 * readPosition (vservo);




rgb = [216 200 47];


while (1)
    IMG = snapshot(cam);
    
    stats = colordetect(IMG,xy,rgb);
    
    
    
    % Here we do the image blob analysis.
    % We get a set of properties for each labeled region.
     
    % Display the image
    imshow(IMG)

    hold on
    %This is a loop to bound the red objects in a rectangular box.
    maxsize = 0;
    maxobject = 1;
	for object = 1:length(stats)
        bb = stats(object).BoundingBox;
        if bb > 30 
            bc = stats(object).Centroid;
            rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
            plot(bc(1),bc(2), '-m+')
            a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
            set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
            
            if ( bc(1)*bc(2) > maxsize)
                maxsize = bc(1)*bc(2);
                maxobject = object;
                
                
                
            end
            
        end
	end
    
    hold off
    
    
	if (~isempty(stats))
        [hpos, vpos]= aiming(hpos,vpos,stats(maxobject).Centroid,xy/2);
        writePosition(hservo,hpos);
        writePosition(vservo,vpos);
        
	end
    
    
    
    
end
