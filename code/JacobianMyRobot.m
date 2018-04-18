
function J=JacobianMyRobot(th1,th2,th3,th4,dz,th6)
close all
global Link
jsize=6;
J=zeros(6,jsize);
 Link(2).th=th1*pi/180;
 Link(3).th=th2*pi/180;
 Link(4).th=th3*pi/180;
 Link(5).th=th4*pi/180;
 Link(6).dz=dz;
 Link(7).th=th6*pi/180; 
for i=1:7
MatrixDH(i);
end
Link(1).p=Link(1).p(1:3);
for i=2:7
      Link(i).A=Link(i-1).A*Link(i).A;
      Link(i).p= Link(i).A(1:3,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
end
target=Link(7).p;
for n=1:4
     a=Link(n).R*Link(n).az;  
     J(:,n)=[cross(a,target-Link(n).p); a];
end
J(:,5)=[Link(5).R*Link(5).az;0;0;0];
a = Link(6).R*Link(6).az;
J(:,6)=[cross(a,target-Link(6).p); a];
