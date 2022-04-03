function Archive = ExternalArchiveUpdate1(Population,Archive,N)


%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------
    
    D=DominantDifferenceMatrixConstruction(Population);
    Ds=sum(D);
    [v,number]=sort(Ds,'descend');
    Archive=[Archive,Population(number(1:N/2))];
    Archive=Archive(NDSort(Archive.objs,1)==1);
    [t,nn]=size(Archive);
    if nn>N
    nn
   
    AD=DominantDifferenceMatrixConstruction(Archive);
    ADs=sum(AD);
    [vv,number1]=sort(ADs,'descend');
    Archive=Archive(number1(1:N)); 
    else
        Archive=Archive;
        
    end
end