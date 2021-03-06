
V_MAX = 40;
N=50;
disp('Lois possibles : uniforme/normale/poisson/binomiale/geometrique');
string=input('Choisir une loi: ','s');
D = init_Loi(string,N);
Z=[];
for S=1:V_MAX
    G=zeros(1,V_MAX);
    for s=1:S
        G(s)=calcul_gain(s,D,S);
    end
    Z=[Z;G];
end


[max_val,idx]=max(Z(:))
[row,col]=ind2sub(size(Z),idx)

[X,Y] = meshgrid(1:V_MAX,1:V_MAX);
for S=1:V_MAX
    for s=1:V_MAX
        if (s > S)
           Z(S,s) = NaN;
        end
    end
end


fig1 = figure;
surf(X,Y,Z);
xlabel('S');
zlabel('gain');
ylabel('s');
legend('Gain en fonction de s et S');

fig2 = figure;
plot(1:N,D);

fig = [fig1 fig2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Résolution du problème
