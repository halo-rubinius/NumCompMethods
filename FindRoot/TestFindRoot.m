%% 二分法测试
func = @(x) x.^3-x.^2-1;
interval = [1.0, 1.5];
err = 0.005;
N = 100;
x = Bisection(func, interval, err, N);

%% 牛顿法求根测试
func = @(x) x.^3-x.^2-1;
df = @(x) 3*x.^2-2*x;
x0 = 1.5;
err = 1.0e-5;
N = 100;
x = NewtonRoot(func, df, x0, err, N);

%% 弦截法测试
func = @(x) 2*x.*exp(x)-1;
x = [0.3, 0.4];
err = 1.0e-6;
N = 100;
x = SecantRoot(func, x, err, N);
