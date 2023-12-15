function yInterp = NewtonInterp(xpoints, ypoints, xInterp, degree)
%% 牛顿插值法
% (xpoints, ypoints): 插值节点
% xInterp: 待插值点x
% yInterp: 待插值点y
% degree: 多项式次数，可选参数

n = length(xpoints); % 数据点个数
[xpoints, i] = sort(xpoints);
ypoints = ypoints(i);

if nargin < 4
    degree = n-1;
end
degree = floor(degree);
if degree > n-1 || degree <= 0
    degree = n-1;
end

% 计算差商表
% 差商表第1列是x
% 差商表第2列是零阶差商（即函数值）
% 差商表第3列为一阶差商，。。。
T = zeros(n, n+1);
T(:, 1) = xpoints(:);
T(:, 2) = ypoints(:);
for k = 1:n-1
    % k阶差商
    for i = k+1:n
        T(i, k+2) = (T(i,k+1)-T(i-1,k+1))/(xpoints(i)-xpoints(i-k));
    end
end
disp('差商表全表如下:')
disp(T);

[~, idx] = sort(abs(xpoints-xInterp));
idx = sort(idx(1:degree+1));
if length(idx) ~= length(xpoints)
    disp('选取离待插值点最近的点如下:');
    disp(xpoints(idx));
end

syms x;
syms Nn;  % 牛顿插值多项式
assume(x,'real');

Nn = T(idx(1),2);
for k = 1:degree
    i = idx(k+1);
    Nn = Nn + T(i,k+2) * prod(x-xpoints(idx(1:k)));
end

Nn = expand(Nn);
disp([num2str(degree), '次牛顿插值函数为：']);
disp(Nn);

yInterp = subs(Nn, x, xInterp);

end
