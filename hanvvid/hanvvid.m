

 

delete(a); % arduino ���� ����
a=arduino('COM10');  % arduinoIO add to path ���� ��. (arduinoIO����  adioes ���� ���ε� ��)
a.servoAttach(11);
for i=1:10
    servoWrite(a,11,0);
    pause(1);
    servoWrite(a,11,90);
    pause(1);
end

 

//////////////////////////////////

 

%delete(a);
a=arduino('COM10');  % arduinoIO add to path ���� ��. (arduinoIO����  adioes ���� ���ε� ��)
a.servoAttach(11);
for i=1:10
    servoWrite(a,11,0);
    pause(1);
    servoWrite(a,11,90);
    pause(1);
    %webcamlist    ��ķ ����Ȱ� �� ��
    %cam = webcam('����Ʈ �̸� �� �ϳ�') : �� �̸��� ��ķ�� ����
    %preview(cam) �ϸ� ī�޶� �ǽð� ���� �޾ƿ�.
end

 

///////////////////////////////////////////////////

 

%delete(a);
%a=arduino('COM10');  % arduinoIO add to path ���� ��. (arduinoIO����  adioes ���� ���ε� ��)
%a.servoAttach(11);
%for i=1:10
    %%%%%%%%%%%servo%%%%%%%%%%%%%%%%%%5
    %servoWrite(a,11,0);
    %pause(1);
    %servoWrite(a,11,90);
    %pause(1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%webcam%%%%%%%%%%%%%%%%%%%%
    %webcamlist    ��ķ ����Ȱ� �� ��
    %cam = webcam('����Ʈ �̸� �� �ϳ�') : �� �̸��� ��ķ�� ����
    %preview(cam) �ϸ� ī�޶� �ǽð� ���� �޾ƿ�.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%end

IMG = snapshot(cam);
nCount =1;
DrawX = 0;
DrawY = 0;
for i=1:480
    for j = 1:640
        if IMG(i,j,1)>200 && IMG(i,j,2)<160 && IMG(i,j,2)>147 && IMG(i,j,3)<102
            nCount = nCount+1;
            DrawX = DrawX+i;
            DrawY = DrawY+j;
        end   
    end
end

DrawX = DrawX/nCount;
DrawY = DrawY/nCount;
   
imshow(IMG);
hold on;
text(DrawY, DrawX, 'XXXX');
   
   
///////////////////////////////////////////////////////////////////////////////////////////////////////////

 

delete(a);
a=arduino('COM10');  % arduinoIO add to path ���� ��. (arduinoIO����  adioes ���� ���ε� ��)
a.servoAttach(11);
%for i=1:10
    %%%%%%%%%%%servo%%%%%%%%%%%%%%%%%%5
    %servoWrite(a,11,0);
    %pause(1);
    %servoWrite(a,11,90);
    %pause(1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%webcam%%%%%%%%%%%%%%%%%%%%
    %webcamlist    ��ķ ����Ȱ� �� ��
    %cam = webcam('����Ʈ �̸� �� �ϳ�') : �� �̸��� ��ķ�� ����
    %preview(cam) �ϸ� ī�޶� �ǽð� ���� �޾ƿ�.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%end
while(1)
   
    IMG = snapshot(cam);
    nCount =1;
    DrawX = 0;
    DrawY = 0;
    theta = 20;
    for i=1:480
        for j = 1:640
            if IMG(i,j,1)>200 && IMG(i,j,2)<160 && IMG(i,j,2)>147 && IMG(i,j,3)<102
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
   
    if DrawX>480
        deg=servoRead(a,11);
        if deg+theta>=180
        else
            servoWrite(a,11,deg+theta);
             pause(1);
        end
    elseif DrawX<160
        deg=servoRead(a,11);
        if deg-theta<=0
        else
            servoWrite(a,11,deg-theta);
            pause(1);
        end
    else
    end
end