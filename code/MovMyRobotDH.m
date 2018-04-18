% Author: huangjiancong
% Function: Move my robot with Denavit-Hartenberg method
% Date: 2018/04/17
close all;
clear;
ToDeg = 180/pi;
ToRad = pi/180;
th1=0;
th2=0;
th3=0;
th4=0;
dz=0;
th6=0;
stp=10;
dtime=0.01;
LinkMyRobotDH(th1,th2,th3,th4,dz,th6,0);
view(134,12);
pause;
stp=30;
dtime=0.01;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint1
for th=-170:stp:170
   LinkMyRobotDH(th,th2,th3,th4,dz,th6,1); 
end
for th=170:-stp:-170
    if th==0
      LinkMyRobotDH(th,th2,th3,th4,dz,th6,0);  
    else
      LinkMyRobotDH(th,th2,th3,th4,dz,th6,1);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint2
for th=-90:stp:155
   LinkMyRobotDH(th1,th,th3,th4,dz,th6,1); 
end
for th=155:-stp:-90
    if th==0
      LinkMyRobotDH(th1,th,th3,th4,dz,th6,0);  
    else
      LinkMyRobotDH(th1,th,th3,th4,dz,th6,1); 
    end
end
%%%%%%%%%%%%%%%%%%%%%%%Joint3
for th=-175:stp:190
  LinkMyRobotDH(th1,th2,th,th4,dz,th6,1); 
end
for th=190:-stp:-175
    if th==0
      LinkMyRobotDH(th1,th2,th,th4,dz,th6,0);  
    else
      LinkMyRobotDH(th1,th2,th,th4,dz,th6,1); 
    end 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint4
for th=-150:stp:150
 LinkMyRobotDH(th1,th2,th3,th,dz,th6,1); 
end
for th=150:-stp:-150
    if th==0
      LinkMyRobotDH(th1,th2,th3,th,dz,th6,0);  
    else
      LinkMyRobotDH(th1,th2,th3,th,dz,th6,1); 
    end 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%Joint5 slide
for dz=0:stp:180
  LinkMyRobotDH(th1,th2,th3,th4,dz,th6,1); 
end
for dz=180:-stp:0
    if dz==0
      LinkMyRobotDH(th1,th2,th3,th4,dz,th6,0);  
    else
      LinkMyRobotDH(th1,th2,th3,th4,dz,th6,1); 
    end 
end
%%%%%%%%%%%%%%%%%%%%Joint6
for th=-45:stp:180
  LinkMyRobotDH(th1,th2,th3,th4,dz,th,1); 
end
for th=180:-stp:45
    if th==0
      LinkMyRobotDH(th1,th2,th3,th4,dz,th,0);  
    else
      LinkMyRobotDH(th1,th2,th3,th4,dz,th,1); 
    end 
end