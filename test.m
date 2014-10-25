% file name : g_spline : ginput�Լ��� spline�Լ��� ����Ͽ� interpolation�ϴ� ��� �׸���.
clear all
clf

v=[0 50 0 50];
axis(v);

hold on;

x=[];
y=[];
n=0;
button=1;

title('Drawing smooth curve');
xlabel('x');
ylabel('y');

while button==1
   [xi,yi,button]=ginput(1);               %���콺�� Ŭ���� ��ǥ�� �޴´�.
   plot(xi,yi,'ro');                       %���콺�� Ŭ���� ��ǥ�� o�� ��´�.
   text(xi+(xi)/15,yi+(yi)/15,int2str(n+1));  %���°�� Ŭ���� ������ ���ڸ�
   n=n+1;                                     %ī��Ʈ�ؼ� ��´�.
   x(n,1)=xi;      %spline�Լ��� ����� ���ؼ� x���͸� �����.
   y(n,1)=yi;      %y���͸� �����.
end

t=1:n;
ts=1:0.1:n;
xs=spline(t,x,ts);     
ys=spline(t,y,ts);
plot(xs,ys,'b-');          %��ü ���� spline����� �����Ѵ�.
hold off