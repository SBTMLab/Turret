
clear all
a=imread('img6_crop.jpg');
figure,imshow(a)
a= double(a);



[mean(mean(a(:,:,1))) mean(mean(a(:,:,2))) mean(mean(a(:,:,3)))]
