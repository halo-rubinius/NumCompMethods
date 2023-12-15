function x = GaussElim(A, b)
%% 高斯消去法解线性方程组
% A: 系数矩阵
% b: 右端项
% x: 方程组的解

n = size(A, 1);
Ab = [A, b(:)];  %增广矩阵

for i = 1:n-1  % 总共要进行n-1步消元
    pivot = Ab(i, i);  %主元
    ratio = zeros(1, length(i+1:n));
    for k = i+1:n
        ratio(k-i) = -Ab(k,i)/pivot;
        Ab(k,:) = Ab(k,:) + ratio(k-i)*Ab(i,:);
    end
    disp(['第', num2str(i),'步消元时, ' '消元系数: ']);
    disp(ratio);
    disp('消元结果: ');
    disp(Ab);
end

x = zeros(n,1);
x(end) = Ab(n,end)/Ab(n,n);
for i = n-1:-1:1
    x(i) = (Ab(i,end) - Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
end
disp('解向量:')
disp(x);

end
