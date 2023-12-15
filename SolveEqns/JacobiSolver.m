function x = JacobiSolver(A, b, x0, err, maxIter)
%% 雅克比迭代法解线性方程组
% A: 系数矩阵
% b: 右端项
% x0: 迭代初值向量
% err: 精度要求，默认值为1.0e-6。||Ax-b||/||b||<=err
% maxIter: 最大迭代次数，默认值为1000

if nargin < 5
    maxIter = 1000;
end
if nargin < 4
    err = 1.0e-6;
end

x = x0(:);

D = diag(diag(A));
B = -inv(D)*(tril(A, -1)+triu(A, 1));  % 迭代矩阵
f = D\b;

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
