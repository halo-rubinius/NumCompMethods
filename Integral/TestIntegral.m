%% 测试牛顿-柯特斯求积公式
f = @(x) 1./x;
interval = [1, 4];
result = NewtonCotes(f, interval, 1);
disp(result);
result = NewtonCotes(f, interval, 2);
disp(result);

%% 测试复化梯形公式
f = @(x) exp(2*x).*sin(3*x);
interval = [0, 2];
n = 8;
result = CompTrapIntegral(f, interval, n);
disp(result);

%% 测试复化辛普森公式
f = @(x) exp(2*x).*sin(3*x);
interval = [0, 2];
n = 4;
result = CompSimpsonIntegral(f, interval, n);
disp(result);

%% 测试龙贝格算法计算定积分
f = @(x) exp(2*x).*sin(3*x);
interval = [0, 2];
err = 1.0e-6;
result = RombergIntegral(f, interval, err);
