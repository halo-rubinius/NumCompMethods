function result = CompSimpsonIntegral(f, interval, n)
%% 复化辛普森公式求定积分
% f: 被积函数
% interval: 积分区间
% n: 区间n等分

a = min(interval);  % 积分下限
b = max(interval);  % 积分上限
h = (b-a)/n;  % 步长
disp(['步长为: ', num2str(h)]);

x = linspace(a, b, n+1);

result = 0;
for k = 1:n
    midpoint = (x(k)+x(k+1))/2;
    result = result + h/6*(f(x(k)) + 4*f(midpoint) + f(x(k+1)));
end

end
