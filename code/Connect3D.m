% Author: huangjiancong
% Function: draw the robot arm
% Date: 2018/04/17
function Connect3D(p1,p2,option,pt,fcla)
h = plot3([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],option);
set(h,'LineWidth',pt)