
clear all
a=imread('img2.jpg');
a= double(a);
figure,imshow(a)

mean(mean(a(:,:,3)))
