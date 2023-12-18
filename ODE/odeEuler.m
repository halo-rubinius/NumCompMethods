function odeEuler(func, interval, y0, h)
%% 欧拉方法求解常微分方程初值问题
% func: 常微分方程中的函数
% interval: 解所在的区间
% y0: 初值
% h: 步长

a = min(interval);
b = max(interval);

x = a:h:b;
y = zeros(length(x), 1);

syms xn yn;
assume(xn, 'real');
assume(yn, 'real');
sympref('FloatingPointOutput', true);  % 设置表达式中数显示为小数，而不是分数

yn1 = yn + h*func(xn, yn);
yn1 = expand(simplify(yn1));
disp('欧拉公式的化简结果为:');
disp(yn1);

sympref('FloatingPointOutput', 'default');

y(1) = y0;
for k = 2:length(x)
    y(k) = subs(yn1, [xn, yn], [x(k-1), y(k-1)]);
end
disp('x    y的结果为:');
disp([x(:), y(:)]);

end
