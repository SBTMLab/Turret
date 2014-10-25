clear all

cam=webcam('Microsoft LifeCam VX-6000');
count=1;
xpoint = 1;
ypoint = 1;

while(1)
    data = snapshot(cam);
    v=[0 480 0 640];
axis(v);



x=[];
y=[];


title('Drawing smooth curve');
xlabel('x');
ylabel('y');
imshow(data);


 if button==1;
   [xi,yi,button]=ginput(1);               %마우스로 클릭한 좌표를 받는다.
   plot(xi,yi,'ro');                       %마우스로 클릭한 좌표에 o를 찍는다.
  xpoint=round(xi);
  ypoint=round(yi);
   
 end
 

end