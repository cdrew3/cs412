clc;
format longg;

load carsmall;
X = [MPG,Acceleration,Displacement,Weight,Horsepower];
varName = {'MPG','Acceleration','Displacement','Weight','Horsepower'};

comet(Displacement);
xlabel('Index of Car');
ylabel('Displacement');

boxplot(Acceleration);
ylabel('Acceleration');

boxplot(Acceleration,Cylinders);
xlabel('Cylinders');
ylabel('Acceleration');

scatter3(Displacement,Cylinders,Horsepower,'filled','r');
xlabel('Displacement');
ylabel('Cylinders');
zlabel('Horsepower');

h = glyphplot(X(1:9,:), 'glyph', 'star', 'varLabels', varName, 'obslabels', Model(1:9,:));
set(h(:,3), 'FontSize', 8);