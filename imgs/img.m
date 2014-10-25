
clear all
a=imread('img4_crop.jpg');
a= double(a);
figure,imshow(a)


[mean(mean(a(:,:,1))) mean(mean(a(:,:,2))) mean(mean(a(:,:,3)))]
