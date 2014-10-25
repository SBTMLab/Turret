function out = colordetect (IMG,size,rgb)

diff_im = zeros(size(1),size(2));  

r = rgb(1);
g = rgb(2);
b = rgb(3);
rdif = 30;
gdif = 30;
bdif = 30;
%IMG(i,j,1) < r + 25 && 
for i=1:size(1)
	for j = 1:size(2)
        if (IMG(i,j,1) > r - rdif  && IMG(i,j,2) < g+ gdif && IMG(i,j,2) > g - gdif &&IMG(i,j,3) < b+ bdif && IMG(i,j,3) > b - bdif)
        	diff_im(i,j) = 1;
            
        else
            diff_im(i,j) = 0;
              
        end
	end
end


diff_im = bwareaopen(diff_im,80);
bw = bwlabel(diff_im, 4);

out = regionprops(bw, 'BoundingBox', 'Centroid');