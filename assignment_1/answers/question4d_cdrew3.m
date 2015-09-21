clc;

x = [.69, -1.31, .39, .05, 1.29, .49, .19, -.81, -.31, .71];
y = [.89, -1.11, .59, .45, 1.19, .69, .25, -.71, -.21, .71];

xMean = mean(x);
yMean = mean(y);
xNum = length(x);

for i = 1:numel(x)
    xM(i) = (x(i) - xMean); % Zero Mean
    yM(i) = (y(i) - yMean); % Zero Mean
end

xyM = [xM; yM];
xyCov = (1/(xNum-1))*xyM*xyM';

[e_vec,e_val] = eig(xyCov)
eY = e_vect * xyM
cY1 = (1/(xNum-1))*eY*eY'
