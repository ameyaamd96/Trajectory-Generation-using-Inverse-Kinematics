%clearing
clc
clear
%parameter values for inverse kinematics
l = 10; d=10;
rc  = 1; %+1 if C is on the right side of A2A1 and -1 if on the left side of it
%equation for forward kinematics
% x = 0.5*(-d + l*cosd(theta1) + l*cosd(theta2)) + (rc/2)*(sqrt(l^2 -a^2)/a)*(l*sind(theta1) - l*sind(theta2));
% y = 0.5*(l*sind(theta1) + l*sind(theta2)) + (rc/2)*(sqrt(l^2-a^2)/a)*(d - l*cosd(theta1) + l*cos(theta2));

%equation for inverse kinematics
%defining the branch index
del1 = -1; %(+1 if A1 is on the right side and -1 if it is on the left side)
del2 = 1; %(+1 if A2 is on the right side and -1 if it is on the left side)
xc = 0;
yc = 15;
r=5;

count =1;
ang = 0:0.1:2*pi;
x = xc + r*cos(ang);
y = yc + r*sin(ang);
plot(x,y,'b-');
hold on




Dsx = zeros(64,1);
Dsy = zeros(64,1);
%spiral paramter
aspiral = 0.1;

%plotting the values
    figure(1)

for t=0:0.1:(11*pi + pi/3)
    
    x =xc+ aspiral*(cos(t)+t*sin(t)); %angle in radians
    y =yc+ aspiral*(sin(t) - t*cos(t)); %angle in radians
    %here we know values of x , y , l ,d,del1 ,del2
    %we need to calculate o2 and o1
    o2 = 0.5*(sqrt((x-d/2)^2+y^2));
    o1 = 0.5*(sqrt((x+d/2)^2+y^2));
    theta1 = atan2d((y - del1*(sqrt(l^2-o1^2)/o1)*(d/2 + x)),(x+d/2 + del1*y*(sqrt(l^2-o1^2)/o1)));
    theta2 = atan2d((y + del2*(sqrt(l^2-o2^2)/o2)*(d/2 - x)),(x-d/2 + del2*y*(sqrt(l^2-o2^2)/o2)));
    
    %calculating theta3 and theta4 based on theta1 and theta2
    C1 = cosd(theta1);
    C2 = cosd(theta2);
    S1 = sind(theta1);
    S2 = sind(theta2);
    a =l*C1 - d - l*C2;
    b = l*S1 - l*S2;
    A = (l^2) - (a^2 + b^2 + l^2);
    C = 2*l*sqrt(a^2 + b^2);
    beta1 = atan2d(a,b);
    
    theta3 = atan2d(A,C) - beta1;
    S3 = sind(theta3);
    C3 = cosd(theta3);
    theta4 = atan2d((b + l*S3 ),(a + l*C3 ));
    S4 = sind(theta4);
    C4 = cosd(theta4);    
    %so now we have theta3 and theta4
    %lets calculate x and y cordinate of every point
    Ax = -d/2 ; Ay =0;
    Bx = l*cosd(theta1)-(d/2);By = l*sind(theta1);
    Cx =l*(cosd(theta1)+cosd(theta3)) - (d/2);Cy= l*(sind(theta1)+sind(theta3));
    Dx = l*cosd(theta2) + d/2;
    Dy = l*sind(theta2);
    Ex = d/2;
    Ey = 0;  
    
    
    Dsx(count,1) = x;
    Dsy(count,1) = y;
    
    clf
      
    plot(Dsx,Dsy,'b-');hold on;
    plot([Ax Bx],[Ay By],'ro-'); hold on;
    plot([Bx x],[By y],'ro-'); hold on;
    plot([x Dx],[y Dy],'ro-'); hold on;
    plot([Dx Ex],[Dy Ey],'ro-'); hold on;
    plot([Ex Ax],[Ey Ay],'ro-'); hold on;
    count =count +1;
    % axis(gca,'equal');
    xlim([-20 20]);
    ylim([-20 20]);
    daspect([1 1 1]);
    
    
    pause(0.1)
    
    
end
count

tt = 0:0.1:(11*pi +pi/3);
xx =aspiral.*(cos(tt)+tt.*sin(tt))+ xc;
yy = aspiral.*(sin(tt) - tt.*cos(tt)) +yc;
title('Tracing a involute spiral path');
xlabel('x cordinates in cm');
ylabel('y cordintes in cm');
plot(xx, yy, '-g');hold on;
plot(xc,yc,'bo-');hold on;
hold off



