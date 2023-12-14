function x = NewtonRoot(func, df, x0, err, N)
%% 运用牛顿迭代法求非线性方程的根
% func: func(x) = 0方程中的非线性函数
% df: func函数的导数的表达式
% x0: 初值
% err: 误差精度要求，如输入1.0e-6
% N: 最大迭代次数，如输入1000

result = zeros(N+1,2);
result(1, :) = [0, x0];

L = 0;
xlast = x0;
for k = 1:N
    if abs(df(xlast)) < eps
        L = k;
        break;
    end

    xnew = xlast - func(xlast)/df(xlast);  % 牛顿迭代
    result(k+1, :) = [k, xnew];

    if abs(xnew-xlast) <= err
        break;
    end

    xlast = xnew;
end

if k == N
    warning('到达最大迭代次数!!!');
end
if L == 0
    result = result(1:k+1, :);
else
    result = result(1:L, :);
end

x = result(end,2);

disp(result);

end
