function [data] = double_moon_points(ts,r,w,d,theta)
% ts : number of points
% r  : radius
% w  : width 
% d  : distance between two half moons
ts1=10*ts;
tmp1=[];

while true
    tmp=[2*(r+w/2)*(rand(ts1,1)-0.5) (r+w/2)*rand(ts1,1)];
    tmp(:,3)=sqrt(tmp(:,1).*tmp(:,1)+tmp(:,2).*tmp(:,2)); 
    idx=find([tmp(:,3)>r-w/2] & [tmp(:,3)<r+w/2]);
    tmp1=[tmp1;tmp(idx,1:2)];
    if length(idx)>= ts 
        break;
    end
end
data=[tmp1(1:ts,:) zeros(ts,1);
     [tmp1(1:ts,1)+r -tmp1(1:ts,2)-d ones(ts,1)]];

rot = [cosd(theta) -sind(theta);
       sind(theta)  cosd(theta)];

data(:,2)=data(:,2)+d/2;
data(:,1:2) = data(:,1:2)*rot';

plot(data(1:ts,1),data(1:ts,2),'.r',data(ts+1:end,1),data(ts+1:end,2),'.b');
title(['Perceptron with the double-moon set at distance d = ' num2str(d)]),
axis([-r-w/2 2*r+w/2 -r-w/2-d r+w/2])
end