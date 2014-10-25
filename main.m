clear all;

addpath('Modules');
cam = webcam('USB Ä«¸Þ¶ó');


xy = [960 1280];
rgb = [236 190 123];


while (1)
    IMG = snapshot(cam);
    
    bw = colordetect(IMG,xy,rgb);
    
    
    
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
