clc;

x = [.69, -1.31, .39, .05, 1.29, .49, .19, -.81, -.31, .71];
y = [.89, -1.11, .59, .45, 1.19, .69, .25, -.71, -.21, .71];

xMean = mean(x);
yMean = mean(y);
xNum = length(x);

% Make X and Y zero mean
for i = 1:numel(x)
    xM(i) = (x(i) - xMean); % Zero Mean
    yM(i) = (y(i) - yMean); % Zero Mean
end

% Combine them together to form an 2x10 (MxN) matrix
xyM = [xM; yM]
% Find the covariance matrix
xyCov = (1/(xNum-1))*xyM*xyM'

% Find the Eigen vectors for the covariance matrix
[e_vec,e_val] = eig(xyCov);
e_vec = e_vec
% Find the new principal component matrix
eY = e_vec * xyM
% Ensure Covariance of eY is diagonal matrix
cY1 = (1/(xNum-1))*eY*eY'
% Variance of the second vector is greater so that will be the principal
% component
