function [M,b] = laplacian(x,t,CBoundary,Circle)
%����ϡ�������uniform weight
n = size(x,1);
M = sparse(n,n);
b = zeros(n,2);
for i = 1:n
    index = find(CBoundary == i);
    %�ж��Ƿ�Ϊ�߽��
    if(size(index)~=0)
        M(i,i) =1;
        b(i,:) = Circle(index,:);
        continue;
    end
    %�ڵ����,��Ҫͳ��loopԪ�صĸ���
    Loop = OneRing(i,t);
    n = length(Loop);
    M(i,Loop(:)) = -1/n;
    M(i,i) = 1; 
end

end



