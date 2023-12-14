function x = SecantRoot(func, x, err, N)
%% 运用弦截法（割线法）求非线性方程的根
% func: func(x) = 0方程中的非线性函数
% x: 初值，含有2个初值，如[1.0, 1.2]
% err: 误差精度要求，如输入1.0e-6
% N: 最大迭代次数，如输入1000

result = zeros(N+2,2);
result(1:2, :) = [0, x(1); 0, x(2)];

xlast = x(1);
xcurrent = x(2);
for k = 1:N
    x = xcurrent - func(xcurrent)*(xcurrent-xlast)/(func(xcurrent)-func(xlast));  % 弦截法迭代

    result(k+2, :) = [k, x];

    if abs(x-xcurrent) <= err
        break;
    end

    xlast = xcurrent;
    xcurrent = x;
end

result = result(1:k+2, :);
disp(result);

end
