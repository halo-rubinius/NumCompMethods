%% 测试拉格朗日插值
xpoints = [-1, 1, 3, 4];
ypoints = [-2, 0, -6, 3];
xInterp = 2;
yInterp = LagrangeInterp(xpoints, ypoints, xInterp);

%% 测试牛顿插值
xpoints = [-1, 0, 1, 2];
ypoints = [0, -4, -2, 5];
xInterp = 1.5;
degree = 3;
interpY = NewtonInterp(xpoints, ypoints, xInterp, degree);

%% 测试最小二乘法曲线拟合
xpoints = [2, 3, 4];
ypoints = [4, 5, 9];
degrees = [0, 1];
CurveFit(xpoints, ypoints, degrees);
