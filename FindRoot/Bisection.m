function x = Bisection(func, interval, err, N)
%% 二分法求非线性方程的根
% func: func(x) = 0方程中的非线性函数
% interval: 区间2个端点，如输入[1,2]
% err: 根的误差精度要求，如输入1.0e-6
% N: 最大二分次数，如输入1000

a = min(interval);   % 区间左端点
b = max(interval);  % 区间右端点

if func(a)*func(b) > 0
    warning('区间不是有根区间!!!');
    x = [];
    return;
end

if nargin < 4
    N = 1000;
end

if nargin < 3
    err = 1.0e-6;
end

x = (a+b)/2;

result = zeros(N+1, 4);
result(1, :) = [0, a, b, x];

for k = 1:N
    if func(a)*func(x) > 0
        a = x;
    else
        b = x;
    end
    x = (a+b)/2;

    result(k+1, :) = [k, a, b, x];

    if (b-a)/2 <= err
        break;
    end
end

result = result(1:k+1, :);
disp(result);

end
