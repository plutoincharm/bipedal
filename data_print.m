close all;
clc;
clearvars -except val;

frame  = 20; 
% frame 20 taken for start of SSP1
% frame 55 midswing phase
% frame 75 is taken as end of ssp
%
BC      =  readmatrix("BC.xlsx"); 
omg     =  readmatrix("omg.xlsx");



L1=  0.4041;
L2 = 0.4418;
L5 = 0.4418;
L3 = 0.4033;
L6 = 0.4033;
r4 = 0.0432;
r7 = 0.0442;
gamma71 =  1.2147;
gamma72 = 3.9843; 
gamma61 = 1.2104;
gamma62 = 3.9711;
r7t = 0.1115;
r7h = 0.0887;
r4t = 0.1114 ;
r4h = 0.0877 ;
r4c =   0.0873;%    0.0992;
gamma43 =  3.9381 %3.6666;

%i = 20;
i = 1;
while i < 125 
%while i < 56 

  tht1=BC(1,i);tht2=BC(2,i);tht3=BC(3,i);tht4=BC(4,i);tht5=BC(5,i);tht6=BC(6,i);tht7=BC(7,i);hx=BC(8,i) ;hy=BC(9,i);
  

xh = hx + L1*cos(pi + tht1);
yh = hy + L1*sin(pi + tht1);
xkl = hx + L1*cos(pi + tht1) + L2*cos(pi + tht2);
ykl = hy + L1*sin(pi + tht1) + L2*sin(pi + tht2);

xal = hx + L1*cos(pi + tht1) + L2*cos(pi + tht2) + L3*cos(pi + tht3);
yal = hy + L1*sin(pi + tht1) + L2*sin(pi + tht2) + L3*sin(pi + tht3);
xfl = hx + L1*cos(pi + tht1) + L2*cos(pi + tht2) + L3*cos(pi + tht3) + r4*cos(pi + tht4)
yfl = hy + L1*sin(pi + tht1) + L2*sin(pi + tht2) + L3*sin(pi + tht3) + r4*sin(pi + tht4)
xhl = hx + L1*cos(pi + tht1) + L2*cos(pi + tht2) + L3*cos(pi + tht3) + r4*cos(pi + tht4) + r4h*cos(tht4+ gamma61)
yhl = hy + L1*sin(pi + tht1) + L2*sin(pi + tht2) + L3*sin(pi + tht3) + r4*sin(pi + tht4) + r4h*sin(tht4+ gamma61)
xtl = hx + L1*cos(pi + tht1) + L2*cos(pi + tht2) + L3*cos(pi + tht3) + r4*cos(pi + tht4)+ r4t*cos(tht4+gamma62)
ytl = hy + L1*sin(pi + tht1) + L2*sin(pi + tht2) + L3*sin(pi + tht3) + r4*sin(pi + tht4)+ r4t*sin( tht4+gamma62)
xcop = hx + L1*cos(pi + tht1) + L2*cos(pi + tht2) + L3*cos(pi + tht3) + r4*cos(pi + tht4) + r4c*cos(gamma43 + tht4)
ycop = hy + L1*sin(pi + tht1) + L2*sin(pi + tht2) + L3*sin(pi + tht3) + r4*sin(pi + tht4) +  r4c*sin(gamma43 + tht4)



%%%%Leg + foot

%{
xkl = hx 
ykl = hy

xal = hx  + L3*cos(pi + tht3);
yal = hy  + L3*sin(pi + tht3);
xfl = hx  + L3*cos(pi + tht3) + r4*cos(pi + tht4);
yfl = hy  + L3*sin(pi + tht3) + r4*sin(pi + tht4);
xhl = hx  + L3*cos(pi + tht3) + r4*cos(pi + tht4) + r4h*cos(tht4+ gamma61);
yhl = hy  + L3*sin(pi + tht3) + r4*sin(pi + tht4) + r4h*sin(tht4+ gamma61);
xtl = hx  + L3*cos(pi + tht3) + r4*cos(pi + tht4)+ r4t*cos(tht4+gamma62);
ytl = hy  + L3*sin(pi + tht3) + r4*sin(pi + tht4)+ r4t*sin( tht4+gamma62);
%}
%%% only foot
%{
xal = hx 
yal = hy 
xfl = hx  + r4*cos(pi + tht4);
yfl = hy  + r4*sin(pi + tht4);
xhl = hx  + r4*cos(pi + tht4) + r4h*cos(tht4+ gamma61);
yhl = hy  + r4*sin(pi + tht4) + r4h*sin(tht4+ gamma61);
xtl = hx  + r4*cos(pi + tht4)+ r4t*cos(tht4+gamma62);
ytl = hy  + r4*sin(pi + tht4)+ r4t*sin( tht4+gamma62);
%}

xkr = hx + L1*cos(pi + tht1) + L5*cos(pi + tht5);
ykr = hy + L1*sin(pi + tht1) + L5*sin(pi + tht5);
xar = hx + L1*cos(pi + tht1) + L5*cos(pi + tht5) + L6*cos(pi + tht6);
yar = hy + L1*sin(pi + tht1) + L5*sin(pi + tht5) + L6*sin(pi + tht6);
xfr = hx + L1*cos(pi + tht1) + L5*cos(pi + tht5) + L6*cos(pi + tht6) + r7*cos(pi + tht7);
yfr = hy + L1*sin(pi + tht1) + L5*sin(pi + tht5) + L6*sin(pi + tht6) + r7*sin(pi + tht7);
xhr = hx + L1*cos(pi + tht1) + L5*cos(pi + tht5) + L6*cos(pi + tht6) + r7*cos(pi + tht7) + r7t*cos(tht7+ gamma71);
yhr = hy + L1*sin(pi + tht1) + L5*sin(pi + tht5) + L6*sin(pi + tht6) + r7*sin(pi + tht7) + r7h*sin(tht7+ gamma71);
xtr = hx + L1*cos(pi + tht1) + L5*cos(pi + tht5) + L6*cos(pi + tht6) + r7*cos(pi + tht7) + r7t*cos(tht7+ gamma72);
ytr = hy + L1*sin(pi + tht1) + L5*sin(pi + tht5) + L6*sin(pi + tht6) + r7*sin(pi + tht7) + r7t*sin(tht7+  gamma72);


axis([-0.5 2 -0.5 2]) 
%axis([-0.5 1.5 -0.5 0.5]) 
base =line([-1 2],[0.02 0.02],'LineWidth',1,'Color','black');
%pelvic =line([lhip_x(i) rhip_x(i)],[lhip_z(i) rhip_z(i)],'LineWidth',1,'Color','black');
   T=line([hx  xh],[hy  yh],'LineWidth',1,'Color','black');
    
   u=line([xh xkl],[yh ykl],'LineWidth',1,'Color','red');
   v=line([xkl xal],[ykl yal ],'LineWidth',1,'Color','red');
   w=line([xal xfl],[yal yfl],'LineWidth',1,'Color','red');
   x=line([xfl xhl],[yfl yhl],'LineWidth',1,'Color','red');
   y=line([xfl xtl],[yfl ytl],'LineWidth',1,'Color','red');
   lo =line([xal xhl],[yal yhl],'LineWidth',1,'Color','red');
   ko=line([xal xtl],[yal ytl],'LineWidth',1,'Color','red');
   yhj =line([xhl  xtl],[yhl  ytl],'LineWidth',1,'Color','red'); 
   yxhj =line([xfl  xcop],[yfl  ycop],'LineWidth',1,'Color','red'); 
   hold on
   plot(xcop,ycop,'g*')
   % legend('Left leg')

   u1=line([xh xkr],[yh ykr],'LineWidth',1,'Color','blue'); 
   v1=line([xkr xar],[ykr yar],'LineWidth',1,'Color','blue'); 
   w1=line([xar xfr],[yar yfr],'LineWidth',1,'Color','blue');
   x1=line([xfr xhr],[yfr yhr],'LineWidth',1,'Color','blue');
   y1=line([xfr xtr],[yfr ytr],'LineWidth',1,'Color','blue');
   yh1 =line([xhr xtr],[yhr ytr],'LineWidth',1,'Color','blue');
   lo1 =line([xar xhr],[yar yhr],'LineWidth',1,'Color','blue');
   ko1 =line([xar xtr],[yar ytr],'LineWidth',1,'Color','blue');
   legend('','Torso','Left leg','','','','','Right leg','','','','')
%   t1= text(1000,1500,txt,'Color','red','FontSize',14);
% pause
%delete(u);delete(u1);
%delete(v);delete(v1);
%delete(w);delete(w1);
%delete(x);delete(y);
%delete(x1);delete(y1);
%delete(lo1);delete(lo);
%delete(ko);delete(ko1);
%delete(yxhj);delete(T);
%delete(yh1);delete(lo1);
 %delete(ko1); delete(yhj);

 i = i +1;
 %pause
end
