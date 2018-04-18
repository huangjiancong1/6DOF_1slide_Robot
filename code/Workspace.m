% Author: huangjiancong
% Function: Draw my robot's wokspace
% Date: 2018/04/18
clc;
clear;
close all;
global Link
BuildMyRobotDH;
num=1;
th1=0;
th2=-80;
th3=0;
th4=0;
dz=0;
th6=-180;
for th1=-170:10:170
    for th2= -90:20:155
        for th3=-175:50:190
            for th4=-150:80:150
                for th6=-45:90:180
                    for dz5=640:60:820
                        fprintf('%d %d %d %d %d %d \n',[th1,th2,th3,th4,dz,th6]');
                        LinkMyRobotDH(th1,th2,th3,th4,dz,th6,1); 
                        x(num)=Link(7).p(1);
                        y(num)=Link(7).p(2);
                        z(num)=Link(7).p(3);
                        num=num+1;
                        plot3(x,y,z,'b*');hold on;
                    end
                end
            end
        end
    end
end