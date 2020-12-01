function [M,b] = laplacian(x,t,CBoundary,Circle)
%创建稀疏矩阵，用uniform weight
n = size(x,1);
M = sparse(n,n);
b = zeros(n,2);
for i = 1:n
    index = find(CBoundary == i);
    %判断是否为边界点
    if(size(index)~=0)
        M(i,i) =1;
        b(i,:) = Circle(index,:);
        continue;
    end
    %内点情况,需要统计loop元素的个数
    Loop = OneRing(i,t);
    n = length(Loop);
    M(i,Loop(:)) = -1/n;
    M(i,i) = 1; 
end

end



