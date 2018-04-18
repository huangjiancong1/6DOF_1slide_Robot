% Author: huangjiancong
% Function: Link and draw my robot with Denavit-Hartenberg method
% Date: 2018/04/17
function pic=LinkMyRobotDH(th1,th2,th3,th4,dz,th6,fcla)
global Link
BuildMyRobotDH;
radius=50;
len=110;
joint_col=0; 
% Link(2).th=Link(2).th+th1*pi/180;
% Link(3).th=Link(3).th+th2*pi/180;
% Link(4).th=Link(4).th+th3*pi/180;
% Link(5).th=Link(5).th+th4*pi/180;
% Link(6).dz=Link(6).dz+dz;
% Link(7).th=Link(7).th+th6*pi/180;
Link(2).th=th1*pi/180;
Link(3).th=th2*pi/180;
Link(4).th=th3*pi/180;
Link(5).th=th4*pi/180;
Link(6).dz=dz;
Link(7).th=th6*pi/180;
p0=[0,0,0]';
for i=1:7
MatrixDH(i);
end
for i=2:7    
      Link(i).A=Link(i-1).A*Link(i).A;
      Link(i).p= Link(i).A(:,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
      Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
      plot3(Link(i).p(1),Link(i).p(2),Link(i).p(3),'rx');hold on;
      if i<=7
          DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
      end 
end
grid on;
view(134,12);
axis([-2500,2500,-2500,2500,-2500,2500]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
%pic=getframe;
if(fcla)
    cla;
end