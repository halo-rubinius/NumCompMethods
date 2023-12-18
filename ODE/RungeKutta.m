function RungeKutta(func, interval, y0, h)
%% 四阶龙格-库塔方法解常微分方程初值问题
% func: 常微分方程中的函数
% interval: 解所在的区间
% y0: 初值
% h: 步长

a = min(interval);
b = max(interval);

x = a:h:b;
y = zeros(length(x), 1);
y(1) = y0;

for k = 2:length(x)
    K1 = func(x(k-1), y(k-1));
    K2 = func(x(k-1)+h/2, y(k-1)+h/2*K1);
    K3 = func(x(k-1)+h/2, y(k-1)+h/2*K2);
    K4 = func(x(k-1)+h, y(k-1)+h*K3);
    y(k) = y(k-1) + h/6*(K1+2*K2+2*K3+K4);
end

disp('x    y的结果为:');
disp([x(:), y(:)]);

end
