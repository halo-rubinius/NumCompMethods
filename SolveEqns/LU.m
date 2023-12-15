function [x, L, U] = LU(A, b)
%% Doolittle三角分解求解线性方程组
% A: 系数矩阵
% b: 右端项
% x: 解向量
% L,U: 分解后的下三角、上三角矩阵

n = size(A,1);
A(2:n,1) = A(2:n,1)/A(1,1);

for i = 2:n
    % 第i行
    for j = i:n
        A(i,j) = A(i,j) - A(i,1:i-1)*A(1:i-1,j);
    end

    % 第i列
    if i ~= n
        for k = i+1:n
            A(k,i) = (A(k,i) - A(k,1:i-1)*A(1:i-1,i))/A(i,i);
        end
    end
end

L = tril(A);
L(1:n+1:end) = 1;
U = triu(A);

disp('L:');
disp(L);
disp('U:');
disp(U);

y = L\b;
disp('Ly = b, y = ');
disp(y);

x = U\y;
disp('Ux = y, x = ');
disp(x);

end
