function [Gbest,Pbest]= Updatebest(Pbest,Population,N,D,M)

% Update the local best position of each particle

%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------
    un=[Pbest,Population];
    Ds=sum(D);
    maxx=max(Ds);
    best=find(Ds==maxx);
    [cc,nn]=size(best);
   
    if nn==1
        Gbest=un(best);
    else
       
        crw=1:nn;
        for i=1:nn
            for j=1:2*N
                    obj=un(best(i)).objs-un(j).objs;
                    crw(i)= crw(i)+norm(obj, M); 
            end
        end
        [va,ind]=max(crw);
        [va,index]=size(ind);
        if index>1
            Gbest=un(best(ind(randi(index))));
        else
        Gbest=un(best(ind));
        end
    end
  % size(Gbest)
    
    for i=1:N
        if Ds(i)<Ds(N+i)
            Pbest(i)=Population(i);
        end
    end

end