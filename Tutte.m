function [x,t,vt]=Tutte(fname)

fullname=[fname,'.obj'];
[x,t,vt]=LoadOBJ(fullname);

%% Pre-computation 
%判断边界点
Boundary = Isboundary(x,t);
%构建一个圆圈，保证Boundary的顺序
CBoundary = CircleLoop(Boundary,t);
%创建一个数组对应单位为1的圆环上的点
Circle = CircleList(size(CBoundary,2));
%创建稀疏矩阵，用uniform weight
[A,b] = laplacian(x,t,CBoundary,Circle);

%% Tutte with uniform weight
u = A\b;
vt = u;

%% plot
figure
trimesh(t,vt(:,1),vt(:,2));
axis equal;

%% Save
newfilename=[fname,'_tutte.obj'];
WriteOBJ(newfilename, x, t, vt);

end

