function result = CompTrapIntegral(f, interval, n)
%% 复化梯形公式求定积分
% f: 被积函数
% interval: 积分区间
% n: 区间n等分

a = min(interval);  % 积分下限
b = max(interval);  % 积分上限
h = (b-a)/n;  % 步长
disp(['步长为: ', num2str(h)]);

x = linspace(a, b, n+1);  % 求积节点

result = h/2*(f(a) + 2*sum(f(x(2:end-1))) + f(b));

end
