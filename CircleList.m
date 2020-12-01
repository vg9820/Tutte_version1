function Circle = CircleList(n)
%返回一个n*2的数组，表示一个离散点单位圆环
theta = 2*pi/n;
Circle = zeros(n,2);
for i =1:n
    Circle(i,:) = [cos(i*theta),sin(i*theta)];
end
end

