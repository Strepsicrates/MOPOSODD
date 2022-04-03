function Dif = DominantDifferenceMatrixConstruction(population)

%--------------------------------------------------------------------------

    %% Parameter setting
    Dec  = population.decs;
    [N,D]     = size(Dec);
    PopObj=population.objs;
    
    
    fmax   = max(PopObj,[],1);
    fmin   = min(PopObj,[],1);
    PopObj = (PopObj-repmat(fmin,N,1))./repmat(fmax-fmin,N,1);
    
    [N,M]     = size(PopObj);
    DM=zeros(N,N,M);
    for m=1:M
        for i=1:N
            for j=1:N
                if PopObj(i,m)<PopObj(j,m)
                
                    DM(j,i,m)=PopObj(j,m)-PopObj(i,m);
                else
                    DM(j,i,m)=0;
                end
            end
        end
    end
    Dif= zeros(N,N,1);
    for m=1:M
        Dif=Dif+DM(:,:,m);
    end
end