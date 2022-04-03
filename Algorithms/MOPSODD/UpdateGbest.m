function [Gbest] = UpdateGbest(Archive,Population,N,Z,Gbest)
% Update the local best position of each particle

%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------
    S=[Archive,Population];
    Ss    = S(NDSort(S.objs,1)==1);
    [nn,Ns]=size(Ss);
    NZ     = size(Z,1);
    PopObj=Ss.objs;
    PopObj = (PopObj-repmat(min(PopObj),Ns,1))./(repmat(max(PopObj)-min(PopObj),Ns,1));
    Cosine   = 1 - pdist2(PopObj,Z,'cosine');
    Distance = repmat(sqrt(sum(PopObj.^2,2)),1,NZ).*sqrt(1-Cosine.^2);
    [dd,pii] = min(Distance',[],2);
    for i=1:NZ
        Distance(pii(i),i)=10000;
    end
    [dd,pii2] = min(Distance',[],2);
    
    
    PopObj=Population.objs;
    PopObj = (PopObj-repmat(min(PopObj),N,1))./(repmat(max(PopObj)-min(PopObj),N,1));
    Cosine   = 1 - pdist2(PopObj,Z,'cosine');
    Distance1 = repmat(sqrt(sum(PopObj.^2,2)),1,NZ).*sqrt(1-Cosine.^2);
    [d,pi] = min(Distance1',[],1);
    
    for i=1:N
        if Population(i).objs==Ss(pii(pi(i))).objs
            Gbest(i)=Ss(pii2(pi(i)));
        else
            Gbest(i)=Ss(pii(pi(i)));
        end
    end
end