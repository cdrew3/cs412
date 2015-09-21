clc;

x = [.69, -1.31, .39, .05, 1.29, .49, .19, -.81, -.31, .71];
y = [.89, -1.11, .59, .45, 1.19, .69, .25, -.71, -.21, .71];

xMean = mean(x);
yMean = mean(y);
xStd = std(x,1);
yStd = std(y,1);
xNum = length(x);

for i = 1:numel(x)
    xM(i) = (x(i) - xMean); % Zero Mean
    yM(i) = (y(i) - yMean); % Zero Mean
end

xyM = [xM; yM];
xyCov = (1/(xNum-1))*xyM*xyM';

[e_vec,e_val] = eig(xyCov);
P = e_vec';
p1 = P(2,:);
eY = e_vec * xyM;
A = [.05; .45];
B = [.49; .69];

P(2,:)
A
Ay = P(2,:) * A
By = P(2,:) * B

q1 = dot(A,p1)
q = A*p1/abs(p1).^2
Ay_p = (dot(A,p1)/dot(p1,p1))*p1
By_p = (dot(B,p1)/dot(p1,p1))*p1

figure(1)
scatter(x,y);
hold on;
plot([0,e_vec(1,2)], [0,e_vec(2,2)])
plot([0,e_vec(1,1)], [0,e_vec(2,1)])
scatter(Ay_p(1), Ay_p(2), 'Red')
scatter(By_p(1), By_p(2), 'Black')
hold off;

