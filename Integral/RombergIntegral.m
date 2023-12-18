function result = RombergIntegral(f, interval, err, N)
%% 龙贝格算法求定积分
% f: 被积函数
% interval: 积分区间
% err: 精度要求
% N: 区间最大二分次数

a = min(interval);  % 积分下限
b = max(interval);  % 积分上限
h = b-a;

if nargin < 4
    rows = 1000;
else
    rows = N+1;
end

if nargin < 3
    err = 1.0e-6;
end

cols = 4;
R = zeros(rows, cols);

R(1,1) = h/2*(f(a)+f(b));

for ir = 2:rows
    R(ir,1) = R(ir-1,1)/2 + h/2*(sum(f(a+h/2:h:b)));

    for jc = 2:min(4,ir)
        ratio = 1/(4^(jc-1)-1);
        R(ir, jc) = (1+ratio)*R(ir, jc-1) - ratio*R(ir-1, jc-1);
    end

    if ir > 4
        if abs(R(ir,4)-R(ir-1,4)) <= err
            break;
        end
    end

    h = h/2;
end

R = R(1:ir, :);
disp(R);
result = R(end,end);

end
