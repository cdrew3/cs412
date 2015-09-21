clc;

x = [.69, -1.31, .39, .05, 1.29, .49, .19, -.81, -.31, .71];
y = [.89, -1.11, .59, .45, 1.19, .69, .25, -.71, -.21, .71];

xMean = mean(x);
yMean = mean(y);
xStdDev = std(x,1);
yStdDev = std(y,1);
xNum = length(x);

z11 = 0;
z12 = 0;
z21 = 0;
z22 = 0;
for i = 1:numel(x)
    z11 = z11 + ((x(i) - xMean) * (x(i) - xMean));
    z12 = z12 + ((x(i) - xMean) * (y(i) - yMean));
    z21 = z21 + ((y(i) - yMean) * (x(i) - xMean));
    z22 = z22 + ((y(i) - yMean) * (y(i) - yMean));
end

z = [z11 z12; z21 z22];
covMatrix = z/(xNum-1)