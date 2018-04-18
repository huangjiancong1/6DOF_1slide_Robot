% Author: huangjiancong
% Function: Differential method - jacobian inverse kinematics analysis.
% Date: 2018/04/17
clc;
clear;
close all;
%global Link
figure; 
th1=0;
th2=0;
th3=0;
th4=30;
%th5=0;
dz=50;
th6=0;
LinkMyRobotDH(th1,th2,th3,th4,dz,th6,0);
pause; 
hold off;
%num=1;
for i=0:1:20
LinkMyRobotDH(th1,th2,th3,th4,dz,th6,1);
% x(num)=Link(7).p(1);
% y(num)=Link(7).p(2);
% z(num)=Link(7).p(3);
% num=num+1;
% plot3(x,y,z,'r.');grid on;
% hold on;
J=JacobianMyRobot(th1,th2,th3,th4,dz,th6);
%D=det(J) ;fprintf('D= %2.4f ',D); fprintf('\n');
dD=[0 0 0+i 0 0 0]';  
dth=inv(J)*dD;
th1=th1+dth(1)/pi*180;
th2=th2+dth(2)/pi*180;
th3=th3+dth(3)/pi*180;
th4=th4+dth(4)/pi*180;
dz=dz+dth(5);
th6=th6+dth(6)/pi*180;
LinkMyRobotDH(th1,th2,th3,th4,dz,th6,0)
end

