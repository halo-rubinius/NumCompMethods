function yInterp = LagrangeInterp(xpoints, ypoints, xInterp)
%% 拉格朗日插值法
% xpoints, ypoints: 插值节点
% xInterp: 待插值的点x
% yInterp: 待插值的点y

n = length(xpoints);

syms x;
syms Lbase;  % 插值基函数
syms Ln;  % 拉格朗日插值函数
assume(x,'real');

Ln = 0;
for k = 1:n
    Lbase = 1;
    for i = 1:n
        if i ~= k
            Lbase = Lbase*(x-xpoints(i))/(xpoints(k)-xpoints(i));
        end
    end
    Lbase = expand(Lbase);
    disp(['第', num2str(k), '个点对应的插值基函数为：']);
    disp(Lbase);

    Ln = Ln + ypoints(k)*Lbase;
end

Ln = expand(Ln);
disp([num2str(n-1), '次拉格朗日插值函数为：']);
disp(Ln);

yInterp = subs(Ln, x, xInterp);

end
