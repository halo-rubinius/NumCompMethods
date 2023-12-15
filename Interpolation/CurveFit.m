function CurveFit(xpoints, ypoints, degrees)
%% 最小二乘法多项式曲线拟合
% (xpoints, ypoints): 散点
% degrees: 多项式的所有次数，例如[0, 2, 3]，表示多项式具有0次、2次和3次项

degrees = sort(degrees);

m = length(xpoints); % 数据点个数
n = length(degrees);

A = zeros(m, n);

for i = 1:m
    A(i,:) = xpoints(i).^degrees(:);
end

b = ypoints(:);
a = (A'*A)\(A'*b);  % 解正规方程组

syms x f;
f = 0;
for i = 1:length(a)
    f = f + a(i)*x^degrees(i);
end

disp('多项式为：');
disp(f);

plot(xpoints, ypoints, 'ok', 'MarkerFaceColor', 'k');
hold on;
fplot(f, [min(xpoints), max(xpoints)], '-r', 'linewidth', 1.5);

legend('原始散点', '拟合曲线', 'location', 'best');

end
