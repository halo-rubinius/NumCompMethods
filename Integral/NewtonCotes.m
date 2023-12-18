function result = NewtonCotes(f, interval, n)
%% 牛顿-柯特斯求积公式
% f: 被积函数
% interval: 积分区间，如[-1, 1]
% n: 将区间n等分

% 柯特斯系数
if n == 1
    cotes = [1/2, 1/2];
elseif n == 2
    cotes = [1/6, 2/3, 1/6];
elseif n == 3
    cotes = [1/8, 3/8, 3/8, 1/8];
elseif n == 4
    cotes = [7/90, 16/45, 2/15, 16/45, 7/90];
else
    warning('等分数不宜过高!!!');
    result = [];
    return;
end

a = min(interval);
b = max(interval);
x = linspace(a, b, n+1);
result = (b-a)*sum(f(x).*cotes);

end
