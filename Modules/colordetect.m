function out = colordetect (IMG,size,rgb)

diff_im = zeros(size(1),size(2));  

r = rgb(1);
g = rgb(2);
b = rgb(3);

for i=1:size(1)
	for j = 1:size(2)
        if (IMG(i,j,1) < r + 25 && IMG(i,j,1) > r - 25 && IMG(i,j,2) < g+ 25 && IMG(i,j,2) > g - 25 &&IMG(i,j,3) < b+ 25 && IMG(i,j,3) > b - 25)
        	diff_im(i,j) = 1;
            
        else
            diff_im(i,j) = 0;
              
        end
	end
end


diff_im = bwareaopen(diff_im,80);
bw = bwlabel(diff_im, 4);

out = bw;