clc;

x = [.69, -1.31, .39, .05, 1.29, .49, .19, -.81, -.31, .71];
y = [.89, -1.11, .59, .45, 1.19, .69, .25, -.71, -.21, .71];

xMean = mean(x);
yMean = mean(y);
xStdDev = std(x,1);
yStdDev = std(y,1);
xNum = length(x);
yNum = length(y);

a = sum(x.*y);
b = xNum * xMean * yMean;
c = xNum * xStdDev * yStdDev;
z = (a - b) / c;

fprintf('Correlation Coefficient = %.3f\n', z);