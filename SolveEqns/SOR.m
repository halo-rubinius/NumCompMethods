function x = SOR(A, b, x0, omega, err, maxIter)
%% 逐次超松弛迭代法解线性方程组
% A: 系数矩阵
% b: 右端项
% x0: 迭代初值向量
% omega: 松弛因子
% err: 精度要求，默认值为1.0e-6。||Ax-b||/||b||<=err
% maxIter: 最大迭代次数，默认值为1000

if nargin < 6
    maxIter = 1000;
end
if nargin < 5
    err = 1.0e-6;
end

x = x0(:);

D = diag(diag(A));
L = tril(A, -1);
U = triu(A, 1);

B = (D + omega*L)\((1-omega)*D-omega*U);
f = omega*((D+omega*L)\b);

bnorm = norm(b);
for k = 1:maxIter
    x = B*x + f;
    disp(['第', num2str(k), '次迭代解为：']);
    disp(x');

    if norm(A*x-b)/bnorm <= err
        break;
    end
end

end
