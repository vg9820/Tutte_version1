function Circle = CircleList(n)
%����һ��n*2�����飬��ʾһ����ɢ�㵥λԲ��
theta = 2*pi/n;
Circle = zeros(n,2);
for i =1:n
    Circle(i,:) = [cos(i*theta),sin(i*theta)];
end
end

