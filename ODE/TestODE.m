%% 测试欧拉方法解常微分方程
func = @(x,y) x-y+1;
interval = [0,0.5];
y0 = 1;
h = 0.1;
odeEuler(func, interval, y0, h);

%% 测试改进的欧拉方法解常微分方程
func = @(x,y) x-y+1;
interval = [0,0.5];
y0 = 1;
h = 0.1;
odeImprovedEuler(func, interval, y0, h);

%% 测试龙格-库塔方法解常微分方程
func = @(x,y) x-y+1;
interval = [0,0.5];
y0 = 1;
h = 0.1;
RungeKutta(func, interval, y0, h)
