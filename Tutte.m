function [x,t,vt]=Tutte(fname)

fullname=[fname,'.obj'];
[x,t,vt]=LoadOBJ(fullname);

%% Pre-computation 
%�жϱ߽��
Boundary = Isboundary(x,t);
%����һ��ԲȦ����֤Boundary��˳��
CBoundary = CircleLoop(Boundary,t);
%����һ�������Ӧ��λΪ1��Բ���ϵĵ�
Circle = CircleList(size(CBoundary,2));
%����ϡ�������uniform weight
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

